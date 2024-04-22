from flask import Blueprint, request, jsonify
from models import db, Movie


movies_bp = Blueprint('movies', __name__)


@movies_bp.route('/movies', methods=['GET'])
def get_all_movies():
   all_movies = Movie.query.all()
   return jsonify([movie.to_dict() for movie in all_movies]), 200


@movies_bp.route('/movies/genre/<string:genre>', methods=['GET'])
def get_movies_by_genre(genre):
   movies = Movie.query.filter(Movie.Genre.ilike(f"%{genre}%")).all()
   if movies:
       return jsonify([movie.to_dict() for movie in movies]), 200
   else:
       return jsonify({"error": "No movies found for the specified genre"}), 404