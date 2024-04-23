from flask import Blueprint, request, jsonify
from src import db

posts = Blueprint('posts', __name__)

@posts.route('/posts', methods=['POST'])
def new_post():
    data = request.json
    cursor = db.get_db().cursor()
    query = "INSERT INTO Post (Content, UserID, Topic) VALUES (%s, %s, %s)"
    cursor.execute(query, (data['Content'], data['UserID'], data['Topic']))
    db.get_db().commit()
    return jsonify({"success": "Post created successfully"}), 201

@posts.route('/posts/<int:post_id>', methods=['DELETE'])
def delete_post(post_id):
    cursor = db.get_db().cursor()
    query = "DELETE FROM Post WHERE PostID = %s"
    cursor.execute(query, (post_id,))
    db.get_db().commit()
    return jsonify({"success": "Post deleted successfully"}), 204


@posts.route('/posts/<int:post_id>', methods=['GET'])
def get_post(post_id):
    cursor = db.get_db().cursor()
    query = "SELECT * FROM Post WHERE PostID = %s"
    cursor.execute(query, (post_id,))
    result = cursor.fetchone()
    if result:
        keys = ["PostID", "Content", "UserID", "Topic", "Title"] 
        result_dict = dict(zip(keys, result))
        return jsonify([result_dict]), 200  
    else:
        return jsonify([]), 404  


@posts.route('/posts/<int:post_id>/title', methods=['PUT'])
def change_title(post_id):
    title = request.json.get('Title')
    cursor = db.get_db().cursor()
    query = "UPDATE Post SET Title = %s WHERE PostID = %s"
    cursor.execute(query, (title, post_id))
    db.get_db().commit()
    return jsonify({"success": "Title updated successfully"}), 200

@posts.route('/posts', methods=['GET'])
def get_all_posts():
    cursor = db.get_db().cursor()
    query = "SELECT * FROM Post"
    cursor.execute(query)
    rows = cursor.fetchall()  
    posts_list = []
    
    keys = ["PostID", "Content", "UserID", "Topic", "Title"]
    
    for row in rows:
        post_dict = dict(zip(keys, row))
        posts_list.append(post_dict)
    
    return jsonify(posts_list), 200 