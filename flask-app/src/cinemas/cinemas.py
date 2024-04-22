from flask import Blueprint, request, jsonify
from models import db, Cinema

cinemas_bp = Blueprint('cinemas', __name__)

@cinemas_bp.route('/cinemas', methods=['GET'])
def get_all_cinemas():
    cinemas = Cinema.query.all()
    return jsonify([cinema.to_dict() for cinema in cinemas]), 200

@cinemas_bp.route('/cinemas/<int:cinema_id>', methods=['GET'])
def get_cinema(cinema_id):
    cinema = Cinema.query.get(cinema_id)
    if cinema:
        return jsonify(cinema.to_dict()), 200
    else:
        return jsonify({"error": "Cinema not found"}), 404


@cinemas_bp.route('/cinemas/amenities', methods=['GET'])
def get_cinemas_by_amenities():
    amenities_query = request.args.get('amenities', '')
    amenities_list = amenities_query.lower().split(',')
    
    cinemas = Cinema.query.filter(
        db.or_(*[Cinema.Amenities.ilike(f"%{amenity}%") for amenity in amenities_list if amenity])
    ).all()

    if cinemas:
        return jsonify([cinema.to_dict() for cinema in cinemas]), 200
    else:
        return jsonify({"error": "No cinemas found with the specified amenities"}), 404

@cinemas_bp.route('/cinemas/facilities', methods=['GET'])
def get_cinemas_by_facilities():
    facilities_query = request.args.get('facilities', '')
    facilities_list = facilities_query.lower().split(',')

    cinemas = Cinema.query.filter(
        db.or_(*[Cinema.Facilities.ilike(f"%{facility}%") for facility in facilities_list if facility])
    ).all()

    if cinemas:
        return jsonify([cinema.to_dict() for cinema in cinemas]), 200
    else:
        return jsonify({"error": "No cinemas found with the specified facilities"}), 404


