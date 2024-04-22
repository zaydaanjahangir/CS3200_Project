from flask import Blueprint, request, jsonify
from models import db, User


users_bp = Blueprint('users', __name__)


@users_bp.route('/users', methods=['POST'])
def register_user():
   data = request.json
   new_user = User(
       Name=data['Name'],
       PhoneNumber=data.get('PhoneNumber'),
       Email=data['Email'],
       Location=data.get('Location'),
       Age=data.get('Age'),
       Preferences=data.get('Preferences')
   )
   db.session.add(new_user)
   db.session.commit()
   return jsonify(new_user.to_dict()), 201


@users_bp.route('/users/<int:user_id>', methods=['GET'])
def get_user_profile(user_id):
   user = User.query.get(user_id)
   if user:
       return jsonify(user.to_dict()), 200
   else:
       return jsonify({"error": "User not found"}), 404




@users_bp.route('/users/<int:user_id>', methods=['PUT'])
def update_user_profile(user_id):
   user = User.query.get(user_id)
   if user:
       data = request.json
       user.Name = data.get('Name', user.Name)
       user.PhoneNumber = data.get('PhoneNumber', user.PhoneNumber)
       user.Email = data.get('Email', user.Email)
       user.Location = data.get('Location', user.Location)
       user.Age = data.get('Age', user.Age)
       user.Preferences = data.get('Preferences', user.Preferences)


       db.session.commit()
       return jsonify(user.to_dict()), 200
   else:
       return jsonify({"error": "User not found"}), 404
  
@users_bp.route('/users/<int:user_id>', methods=['DELETE'])
def delete_user_account(user_id):
   user = User.query.get(user_id)
   if user:
       db.session.delete(user)
       db.session.commit()
       return jsonify({"success": "User account deleted successfully"}), 204
   else:
       return jsonify({"error": "User not found"}), 404


