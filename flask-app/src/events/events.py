# blueprints/events.py
from flask import Blueprint, request, jsonify
from models import db, Event
from datetime import datetime

events_bp = Blueprint('events', __name__)


@events_bp.route('/events/<int:event_id>', methods=['GET'])
def get_event(event_id):
    event = Event.query.get(event_id)
    if event:
        return jsonify(event.to_dict()), 200
    else:
        return jsonify({"error": "Event not found"}), 404


@events_bp.route('/events', methods=['GET'])
def get_events_by_type_and_date():
    event_type = request.args.get('type')
    event_date = request.args.get('date')
    
    if not event_type or not event_date:
        return jsonify({"error": "Both event type and date must be provided"}), 400
    

    try:
        event_date_parsed = datetime.strptime(event_date, '%Y-%m-%d')
    except ValueError:
        return jsonify({"error": "Invalid date format. Please use YYYY-MM-DD format."}), 400
    
    events = Event.query.filter(Event.Type == event_type, db.func.date(Event.Date) == event_date_parsed.date()).all()
    
    if events:
        return jsonify([event.to_dict() for event in events]), 200
    else:
        return jsonify({"error": "No events found matching the criteria"}), 404
