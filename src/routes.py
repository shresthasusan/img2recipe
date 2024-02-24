from flask import render_template ,url_for,flash,redirect,request,session
from . import app
from flask_mysqldb import MySQL
import MySQLdb.cursors
from .output import output
from werkzeug.utils import secure_filename
import os
from werkzeug.security import generate_password_hash, check_password_hash

from flask_sqlalchemy import SQLAlchemy


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
                flash('Login successful', 'success')
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
        return render_template('home.html')
    else:
        return redirect(url_for('login'))
    

    
@app.route('/about',methods=['GET'])
def about():
    return render_template('about.html')



@app.route('/predict',methods=['POST','GET'])

def predict():
    imagefile = request.files['imagefile']
    filename = secure_filename(imagefile.filename)
    image_path = os.path.join(app.root_path, 'static', 'demo_imgs', filename)
    imagefile.save(image_path)

    img = "/demo_imgs/" + filename
    title, ingredients, recipe = output(image_path)

    return render_template('predict.html', title=title, ingredients=ingredients, recipe=recipe, img=img)



@app.route('/my_recipes',methods=['GET'])
def my_recipes():
#     if 'uid' not in session:
#         return redirect(url_for('login'))

#     # Retrieve saved recipes for the current user
#     user_id = session['uid']
#     cur = mysql.connection.cursor()
#     cur.execute("SELECT title, ingredients FROM recipes WHERE uid = %s", (user_id,))
#     saved_recipes = cur.fetchall()
   
#     print(saved_recipes)
#     cur.close()
#     # Render the saved recipes page
#     return render_template('my_recipes.html', saved_recipes=saved_recipes)
#     # return render_template('my_recipes.html')
    cur = mysql.connection.cursor()
    cur.execute("SELECT  * FROM students")
    data = cur.fetchall()
    cur.close()
    print(data)



    return render_template('my_recipes.html', students=data )


@app.route('/insert', methods = ['POST'])
def insert():

    if request.method == "POST":
        flash("Data Inserted Successfully")
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO students (name, email, phone) VALUES (%s, %s, %s)", (name, email, phone))
        mysql.connection.commit()
        return redirect(url_for('Index'))




@app.route('/delete/<string:id_data>', methods = ['GET'])
def delete(id_data):
    flash("Record Has Been Deleted Successfully")
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM students WHERE id=%s", (id_data,))
    mysql.connection.commit()
    return redirect(url_for('Index'))





@app.route('/update',methods=['POST','GET'])
def update():

    if request.method == 'POST':
        id_data = request.form['id']
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        cur = mysql.connection.cursor()
        cur.execute("""
               UPDATE students
               SET name=%s, email=%s, phone=%s
               WHERE id=%s
            """, (name, email, phone, id_data))
        flash("Data Updated Successfully")
        mysql.connection.commit()
        return redirect(url_for('Index'))










@app.route('/<samplefoodname>')
def predictsample(samplefoodname):
    imagefile=os.path.join(app.root_path,'static\\images',str(samplefoodname)+".jpg")
    img="/images/"+str(samplefoodname)+".jpg"
    title,ingredients,recipe,score = output(imagefile)
    return render_template('predict.html',title=title,ingredients=ingredients,recipe=recipe,img=img,score=score)

# Function to save recipe to database
def save_recipe(user_id, recipe_title, recipe_ingredients, recipe_steps):
    user_id = session['uid']
    recipe_title = request.form['title']
    recipe_ingredients = request.form['ingredients']
    recipe_steps = request.form['recipe']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO recipes (uid, title, ingredients, recipe) VALUES (%s, %s, %s, %s)",
              (user_id, recipe_title, recipe_ingredients, recipe_steps))
    mysql.connection.commit()
    cur.close()

@app.route('/save_recipe', methods=['POST'])
def save_recipe_to_db():
    if request.method == 'POST':
        user_id = session['uid']
        recipe_title = request.form['title']
        recipe_ingredients = request.form['ingredients']
        recipe_steps = request.form['recipe']
        
        save_recipe(user_id, recipe_title, recipe_ingredients, recipe_steps)
        return 'Recipe saved successfully!'
    else:
        return 'Invalid request method'


@app.route('/view_recipe', methods=['GET'])
def view_recipe_from_db():
    if 'uid' not in session:
        return redirect(url_for('login'))

    # Retrieve saved recipes for the current user
    user_id = session['uid']
    cur = mysql.connection.cursor()
    cur.execute("SELECT title, ingredients FROM recipes WHERE uid = %s", (user_id,))
    saved_recipes = cur.fetchall()
    cur.close()
    
    # Render the saved recipes page
    return render_template('view_recipes.html')
    