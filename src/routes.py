from flask import render_template ,url_for,flash,redirect,request,session
from . import app
from flask_mysqldb import MySQL
import MySQLdb.cursors
from .output import output
from werkzeug.utils import secure_filename
import os
from werkzeug.security import generate_password_hash, check_password_hash

# from flask_sqlalchemy import SQLAlchemy


mysql = MySQL(app)

# @app.route("/")
@app.route('/login', methods=['POST', 'GET'])
def login():
    if 'uid' in session:
        flash('You are already logged in', 'info')
        return redirect(url_for('home'))
    
    if request.method == 'POST':
            username = request.form['username']
            password_input = request.form['password']

            cur = mysql.connection.cursor()
            cur.execute("SELECT uid, username, password FROM users WHERE username = %s", (username,))
            user_data = cur.fetchone()
            cur.close()
            if user_data and check_password_hash(user_data[2], password_input):
                session['uid'] = user_data[0]
                session['username'] = user_data[1]
                flash('Login successful, welcome {} to recipelens '.format(username), 'success')
                return redirect(url_for('home'))  # Redirect to the home route after successful login
            else:
                flash('Invalid username or password', 'error')
                return redirect(url_for('login'))
     
    return render_template('login.html')




# Registration Routes

@app.route('/register', methods=['POST', 'GET'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        # Check if the username already exists
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE username = %s", (username,))
        existing_user = cur.fetchone()
        cur.close()

        if existing_user:
            flash('Username already exists. Please choose another username.', 'error')
            return redirect(url_for('register'))

        # Hash the password before storing it
        hashed_password = generate_password_hash(password, method='pbkdf2:sha256')

        # Save 'username' and 'hashed_password' in the database
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users (username, password) VALUES (%s, %s)", (username, hashed_password))
        mysql.connection.commit()
        cur.close()

        flash('Registration successful. You can now log in.', 'success')
        return redirect(url_for('login'))

    return render_template('registration.html')

# Log our route 
@app.route('/logout')
def logout():
    # Clear the session
    session.clear()

    # Redirect to the login page
    flash('Logout successful', 'success')
    return redirect(url_for('login'))

# App routes
  
@app.route('/')
def home():
    if 'uid' in session:
        return render_template('home.html', username=session['username'])
    else:
        return redirect(url_for('login'))
    

    


@app.route('/predict',methods=['POST','GET'])

def predict():
    imagefile = request.files['imagefile']
    filename = secure_filename(imagefile.filename)
    image_path = os.path.join(app.root_path, 'static', 'demo_imgs', filename)
    imagefile.save(image_path)

    img = "/demo_imgs/" + filename
    title, ingredients, recipe,score = output(image_path)
    print(title, ingredients, recipe)
    return render_template('predict.html', title=title, ingredients=ingredients,img=img,recipe=recipe,score=score)



@app.route('/<samplefoodname>')
def predictsample(samplefoodname):
    imagefile=os.path.join(app.root_path,'static\\images',str(samplefoodname)+".jpg")
    img="/images/"+str(samplefoodname)+".jpg"
    title,ingredients,recipe,score = output(imagefile)
    return render_template('predict.html',title=title,ingredients=ingredients,recipe=recipe,img=img,score=score)

@app.route('/save_recipe', methods=['POST'])
def save_recipe():
    if 'uid' not in session:
        return redirect(url_for('login'))  # Redirect to login page if user is not logged in

    if request.method == 'POST':
        title = request.form['title']
        ingredients = request.form['ingredients']
        recipe = request.form['recipe']

        try:
            cursor = mysql.connection.cursor()
            cursor.execute("INSERT INTO recipes (uid, title, ingredients, recipe) VALUES (%s, %s, %s, %s)",
                           (session['uid'], title, ingredients, recipe))
            mysql.connection.commit()
            cursor.close()

            flash('Your recipe is saved successfully!', 'success')
            return redirect(url_for('home'))  # Redirect to the home page after saving the recipe
        except Exception as e:
            flash('An error occurred while saving the recipe. Please try again later.', 'error')
            return redirect(url_for('home'))

@app.route('/my_recipes')
def my_recipes():
    if 'uid' not in session:
        return redirect(url_for('login'))  # Redirect to login page if user is not logged in
    else:
   
        return render_template('my_recipes.html')
    
@app.route('/view_recipe')
@app.route('/view_recipe/<samplefood>')
def view_recipe(samplefood):
    if 'uid' not in session:
        return redirect(url_for('login'))  # Redirect to login page if user is not logged in
    else:
        img="/images/"+str(samplefood)+".jpg"
        return render_template('view_recipe.html',img=img)

@app.route('/recipe/<samplefood>')
def kabab_recipe(samplefood):
    if 'uid' not in session:
        return redirect(url_for('login'))  # Redirect to login page if user is not logged in
    else:
        img="/images/"+str(samplefood)+".jpg"
        return render_template('my_recipe_kabab.html',img=img)
