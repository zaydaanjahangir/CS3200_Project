from flask import Blueprint, request, jsonify
from src import db

users = Blueprint('users', __name__)

@users.route('/users', methods=['POST'])
def create_user():
    data = request.json
    cursor = db.get_db().cursor()
    query = f"INSERT INTO User (Name, Email, PhoneNumber, Location, Age, Preferences) VALUES ('{data['Name']}', '{data['Email']}', '{data['PhoneNumber']}', '{data['Location']}', {data['Age']}, '{data['Preferences']}')"
    cursor.execute(query)
    db.get_db().commit()
    return jsonify({"message": "User created successfully"}), 201

@users.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user(user_id):
    cursor = db.get_db().cursor()
    cursor.execute(f"DELETE FROM User WHERE UserID = {user_id}")
    db.get_db().commit()
    return jsonify({"message": "User deleted successfully"}), 204

@users.route('/users/<int:user_id>', methods=['GET'])
def get_user(user_id):
    cursor = db.get_db().cursor()
    cursor.execute(f"SELECT * FROM User WHERE UserID = {user_id}")
    result = cursor.fetchone()
    return jsonify(result), 200 if result else (jsonify({"error": "User not found"}), 404)

@users.route('/users/<int:user_id>/preferences', methods=['PUT'])
def update_preferences(user_id):
    data = request.json
    cursor = db.get_db().cursor()
    cursor.execute(f"UPDATE User SET Preferences = '{data['Preferences']}' WHERE UserID = {user_id}")
    db.get_db().commit()
    return jsonify({"message": "Preferences updated successfully"}), 200

@users.route('/users/<int:user_id>/location', methods=['PUT'])
def update_location(user_id):
    data = request.json
    cursor = db.get_db().cursor()
    cursor.execute(f"UPDATE User SET Location = '{data['Location']}' WHERE UserID = {user_id}")
    db.get_db().commit()
    return jsonify({"message": "Location updated successfully"}), 200

@users.route('/users/<int:user_id>/age', methods=['PUT'])
def update_age(user_id):
    data = request.json
    cursor = db.get_db().cursor()
    cursor.execute(f"UPDATE User SET Age = {data['Age']} WHERE UserID = {user_id}")
    db.get_db().commit()
    return jsonify({"message": "Age updated successfully"}), 200
