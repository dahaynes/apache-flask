from app import app
from flask import render_template

@app.route('/')
def index():
    page = { 'title': 'Home', 
            'meta_title': 'A meta title', 
            'meta_description': 'A meta description' }
    return render_template("index.html", page=page)
