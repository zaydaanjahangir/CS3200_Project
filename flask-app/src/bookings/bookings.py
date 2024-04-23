from flask import Blueprint, request, jsonify
from src import db

bookings = Blueprint('bookings', __name__)

@bookings.route('/bookings', methods=['POST'])
def new_booking():
    data = request.json
    cursor = db.get_db().cursor()
    query = "INSERT INTO Booking (UserID, ShowingID, SeatID, Price) VALUES (%s, %s, %s, %s)"
    cursor.execute(query, (data['UserID'], data['ShowingID'], data['SeatID'], data['Price']))
    db.get_db().commit()
    return jsonify({"success": "Booking created successfully"}), 201

@bookings.route('/bookings/<int:booking_id>', methods=['DELETE'])
def delete_booking(booking_id):
    cursor = db.get_db().cursor()
    cursor.execute("DELETE FROM Booking WHERE BookingID = %s", (booking_id,))
    db.get_db().commit()
    return jsonify({"success": "Booking deleted successfully"}), 204

@bookings.route('/bookings/<int:booking_id>', methods=['GET'])
def get_booking(booking_id):
    cursor = db.get_db().cursor()
    cursor.execute("SELECT * FROM Booking WHERE BookingID = %s", (booking_id,))
    result = cursor.fetchone()
    if result:
        keys = ["BookingID", "UserID", "ShowingID", "SeatID", "Price"]
        result_dict = dict(zip(keys, result))
        return jsonify([result_dict]), 200
    else:
        return jsonify({"error": "Booking not found"}), 404

@bookings.route('/bookings/<int:booking_id>/showing', methods=['PUT'])
def change_showing(booking_id):
    showing_id = request.json.get('ShowingID')
    cursor = db.get_db().cursor()
    cursor.execute("UPDATE Booking SET ShowingID = %s WHERE BookingID = %s", (showing_id, booking_id))
    db.get_db().commit()
    return jsonify({"success": "Showing updated successfully"}), 200

@bookings.route('/bookings/user/<int:user_id>', methods=['GET'])
def get_bookings_by_user_id(user_id):
    conn = db.get_db()
    cursor = conn.cursor()

    query = "SELECT * FROM Booking WHERE UserID = %s"
    cursor.execute(query, (user_id,))  

    bookings = cursor.fetchall()

    if bookings:
        columns = [column[0] for column in cursor.description]
        result = [dict(zip(columns, row)) for row in bookings]
        return jsonify(result), 200
    else:
        return jsonify({"message": "No bookings found for this user"}), 404