from flask import Blueprint, request, jsonify
from datetime import datetime
from models import db, Showing


showings_bp = Blueprint('showings', __name__)


@showings_bp.route('/showings', methods=['GET'])
def get_all_showings():
   all_showings = Showing.query.all()
   return jsonify([showing.to_dict() for showing in all_showings]), 200


@showings_bp.route('/showings/time/<string:showtime>', methods=['GET'])
def get_showings_by_time(showtime):
   try:
       showtime_dt = datetime.strptime(showtime, '%Y-%m-%d %H:%M:%S')
   except ValueError:
       return jsonify({"error": "Invalid date format. Please use YYYY-MM-DD HH:MM:SS format."}), 400
  
   showings = Showing.query.filter(Showing.Showtime == showtime_dt).all()
   if showings:
       return jsonify([showing.to_dict() for showing in showings]), 200
   else:
       return jsonify({"error": "No showings found for the specified time"}), 404


