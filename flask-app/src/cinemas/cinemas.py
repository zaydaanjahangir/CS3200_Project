from flask import Blueprint, request, jsonify
import pymysql  # Ensure you import pymysql or the relevant adapter
from src import db

cinemas = Blueprint('cinemas', __name__)

@cinemas.route('/cinemas/city/<string:city>', methods=['GET'])
def get_cinemas_by_city(city):
    conn = db.get_db()
    cursor = conn.cursor()
    query = "SELECT * FROM Cinema WHERE Location LIKE %s"
    cursor.execute(query, ('%' + city + '%',))
    
    cinemas = cursor.fetchall()
    if cinemas:
        return jsonify([dict(zip([column[0] for column in cursor.description], row)) for row in cinemas]), 200
    else:
        return jsonify({"error": "No cinemas found in the specified city"}), 404
    
@cinemas.route('/cinemas', methods=['GET'])
def get_all_cinemas():
    conn = db.get_db()
    cursor = conn.cursor()
    
    cursor.execute("SELECT * FROM Cinema")
    cinemas = cursor.fetchall()

    if cinemas:
        columns = [column[0] for column in cursor.description]
        result = [dict(zip(columns, row)) for row in cinemas]
        return jsonify(result), 200
    else:
        return jsonify({"message": "No cinemas found"}), 404


