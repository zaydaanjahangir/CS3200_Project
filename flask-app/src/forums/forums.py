from flask import Blueprint, request, jsonify
from models import db, Forum, Post


forums_bp = Blueprint('forums', __name__)


@forums_bp.route('/forums', methods=['GET'])
def get_all_forums():
   forums = Forum.query.all()
   return jsonify([forum.to_dict() for forum in forums]), 200


@forums_bp.route('/forums/<string:topic>', methods=['GET'])
def get_forum_details(topic):
   forum = Forum.query.get(topic)
   if forum:
       return jsonify(forum.to_dict()), 200
   else:
       return jsonify({"error": "Forum not found"}), 404




@forums_bp.route('/forums/<string:topic>/posts', methods=['GET'])
def get_posts_in_forum(topic):
   posts = Post.query.filter_by(Topic=topic).all()
   return jsonify([post.to_dict() for post in posts]), 200


@forums_bp.route('/forums/<string:topic>/posts', methods=['POST'])
def add_post_to_forum(topic):
   data = request.json
   new_post = Post(
       Content=data['Content'],
       UserID=data['UserID'],
       Topic=topic
   )
   db.session.add(new_post)
   db.session.commit()
   return jsonify(new_post.to_dict()), 201


@forums_bp.route('/forums/posts/<int:post_id>', methods=['DELETE'])
def delete_post(post_id):
   post = Post.query.get(post_id)
   if post:
       db.session.delete(post)
       db.session.commit()
       return jsonify({"success": "Post deleted"}), 204
   else:
       return jsonify({"error": "Post not found"}), 404