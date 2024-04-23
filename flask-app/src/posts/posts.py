from flask import Blueprint, request, jsonify
from src import db

posts = Blueprint('posts', __name__)

@posts.route('/posts', methods=['POST'])
def new_post():
    data = request.json
    cursor = db.get_db().cursor()
    query = f"INSERT INTO posts (Content, UserID, Topic) VALUES ('{data['Content']}', {data['UserID']}, '{data['Topic']}')"
    cursor.execute(query)
    db.get_db().commit()
    return jsonify({"success": "Post created successfully"}), 201

@posts.route('/posts/<int:post_id>', methods=['DELETE'])
def delete_post(post_id):
    cursor = db.get_db().cursor()
    cursor.execute(f"DELETE FROM posts WHERE PostID = {post_id}")
    db.get_db().commit()
    return jsonify({"success": "Post deleted successfully"}), 204

@posts.route('/posts/<int:post_id>', methods=['GET'])
def get_post(post_id):
    cursor = db.get_db().cursor()
    cursor.execute(f"SELECT * FROM posts WHERE PostID = {post_id}")
    result = cursor.fetchone()
    return jsonify(result), 200 if result else (jsonify({"error": "Post not found"}), 404)

@posts.route('/posts/<int:post_id>/title', methods=['PUT'])
def change_title(post_id):
    title = request.json.get('Title')
    cursor = db.get_db().cursor()
    cursor.execute(f"UPDATE posts SET Title = '{title}' WHERE PostID = {post_id}")
    db.get_db().commit()
    return jsonify({"success": "Title updated successfully"}), 200
