from flask import Blueprint, jsonify
from src import db

movies = Blueprint('movies', __name__)

@movies.route('/movies', methods=['GET'])
def get_all_movies():
    conn = db.get_db()
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM Movie")
    movies = cursor.fetchall()

    if movies:
        columns = [column[0] for column in cursor.description]
        result = [dict(zip(columns, row)) for row in movies]
        return jsonify(result), 200
    else:
        return jsonify({"message": "No movies found"}), 404
    
@movies.route('/movies/countries', methods=['GET'])
def get_movies_by_countries():
    countries = ["Germany", "France", "United Kingdom"]

    conn = db.get_db()
    cursor = conn.cursor()

    query = "SELECT * FROM Movie WHERE Country IN (%s, %s, %s)"
    cursor.execute(query, tuple(countries))

    movies = cursor.fetchall()
    if movies:
        columns = [column[0] for column in cursor.description]
        result = [dict(zip(columns, row)) for row in movies]
        return jsonify(result), 200
    else:
        return jsonify({"message": "No movies found from the specified countries"}), 404

