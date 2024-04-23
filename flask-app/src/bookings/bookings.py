from flask import Blueprint, request, jsonify
from src import db

bookings = Blueprint('bookings', __name__)

@bookings.route('/bookings', methods=['POST'])
def new_booking():
    data = request.json
    cursor = db.get_db().cursor()
    query = f"INSERT INTO bookings (UserID, ShowingID, SeatID, Price) VALUES ({data['UserID']}, {data['ShowingID']}, {data['SeatID']}, {data['Price']})"
    cursor.execute(query)
    db.get_db().commit()
    return jsonify({"success": "Booking created successfully"}), 201

@bookings.route('/bookings/<int:booking_id>', methods=['DELETE'])
def delete_booking(booking_id):
    cursor = db.get_db().cursor()
    cursor.execute(f"DELETE FROM bookings WHERE BookingID = {booking_id}")
    db.get_db().commit()
    return jsonify({"success": "Booking deleted successfully"}), 204

@bookings.route('/bookings/<int:booking_id>', methods=['GET'])
def get_booking(booking_id):
    cursor = db.get_db().cursor()
    cursor.execute(f"SELECT * FROM bookings WHERE BookingID = {booking_id}")
    result = cursor.fetchone()
    return jsonify(result), 200 if result else (jsonify({"error": "Booking not found"}), 404)

@bookings.route('/bookings/<int:booking_id>/showing', methods=['PUT'])
def change_showing(booking_id):
    showing_id = request.json.get('ShowingID')
    cursor = db.get_db().cursor()
    cursor.execute(f"UPDATE bookings SET ShowingID = {showing_id} WHERE BookingID = {booking_id}")
    db.get_db().commit()
    return jsonify({"success": "Showing updated successfully"}), 200
