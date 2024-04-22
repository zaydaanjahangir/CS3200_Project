from flask import Blueprint, request, jsonify
from models import db, Review


reviews_bp = Blueprint('reviews', __name__)


@reviews_bp.route('/reviews/movie/<int:movie_id>', methods=['GET'])
def get_reviews_for_movie(movie_id):
   reviews = Review.query.filter_by(MovieID=movie_id).all()
   if reviews:
       return jsonify([review.to_dict() for review in reviews]), 200
   else:
       return jsonify({"error": "No reviews found for this movie"}), 404


@reviews_bp.route('/reviews', methods=['POST'])
def add_review():
   data = request.json
   new_review = Review(
       MovieID=data['MovieID'],
       UserID=data['UserID'],
       Rating=data['Rating'],
       Title=data.get('Title', '')
   )
   db.session.add(new_review)
   db.session.commit()
   return jsonify(new_review.to_dict()), 201


@reviews_bp.route('/reviews/<int:review_id>', methods=['PUT'])
def update_review(review_id):
   review = Review.query.get(review_id)
   if review:
       data = request.json
       review.Rating = data.get('Rating', review.Rating)
       review.Title = data.get('Title', review.Title)
       db.session.commit()
       return jsonify(review.to_dict()), 200
   else:
       return jsonify({"error": "Review not found"}), 404


@reviews_bp.route('/reviews/<int:review_id>', methods=['DELETE'])
def delete_review(review_id):
   review = Review.query.get(review_id)
   if review:
       db.session.delete(review)
       db.session.commit()
       return jsonify({"success": "Review deleted"}), 204
   else:
       return jsonify({"error": "Review not found"}), 404
