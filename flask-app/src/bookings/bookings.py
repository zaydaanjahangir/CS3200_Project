from flask import Blueprint, request, jsonify
from models import db, Booking

bookings_bp = Blueprint('bookings', __name__)

@bookings_bp.route('/bookings', methods=['POST'])
def make_booking():
    data = request.json
    new_booking = Booking(
        UserID=data['UserID'],
        ShowingID=data['ShowingID'],
        SeatID=data['SeatID'],
        Price=data['Price']
    )
    db.session.add(new_booking)
    db.session.commit()
    return jsonify(new_booking.to_dict()), 201

@bookings_bp.route('/bookings/<int:booking_id>', methods=['GET'])
def get_booking(booking_id):
    booking = Booking.query.get(booking_id)
    if booking:
        return jsonify(booking.to_dict()), 200
    else:
        return jsonify({"error": "Booking not found"}), 404

@bookings_bp.route('/bookings/<int:booking_id>', methods=['PUT'])
def update_booking(booking_id):
    booking = Booking.query.get(booking_id)
    if booking:
        data = request.json
        booking.SeatID = data.get('SeatID', booking.SeatID)
        booking.Price = data.get('Price', booking.Price)
        db.session.commit()
        return jsonify(booking.to_dict()), 200
    else:
        return jsonify({"error": "Booking not found"}), 404

@bookings_bp.route('/bookings/<int:booking_id>', methods=['DELETE'])
def cancel_booking(booking_id):
    booking = Booking.query.get(booking_id)
    if booking:
        db.session.delete(booking)
        db.session.commit()
        return jsonify({"success": "Booking cancelled"}), 204
    else:
        return jsonify({"error": "Booking not found"}), 404


@bookings_bp.route('/bookings/user/<int:user_id>', methods=['GET'])
def get_bookings_for_user(user_id):
    bookings = Booking.query.filter_by(UserID=user_id).all()
    if bookings:
        return jsonify([booking.to_dict() for booking in bookings]), 200
    else:
        return jsonify({"error": "No bookings found for this user"}), 404
