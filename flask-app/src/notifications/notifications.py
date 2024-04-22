from flask import Blueprint, request, jsonify
from models import db, Notification


notifications_bp = Blueprint('notifications', __name__)


@notifications_bp.route('/notifications/user/<int:user_id>', methods=['GET'])
def get_user_notifications(user_id):
   notifications = Notification.query.filter_by(UserID=user_id).all()
   if notifications:
       return jsonify([notification.to_dict() for notification in notifications]), 200
   else:
       return jsonify({"error": "No notifications found for this user"}), 404


@notifications_bp.route('/notifications/user/<int:user_id>', methods=['DELETE'])
def delete_user_notifications(user_id):
   notifications = Notification.query.filter_by(UserID=user_id).all()
   if notifications:
       for notification in notifications:
           db.session.delete(notification)
       db.session.commit()
       return jsonify({"success": "All notifications deleted for user"}), 204
   else:
       return jsonify({"error": "No notifications found for this user to delete"}), 404
