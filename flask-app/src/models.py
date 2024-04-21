from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Format(db.Model):
    __tablename__ = 'Format'
    FormatID = db.Column(db.Integer, primary_key=True)
    AudioType = db.Column(db.String(50))
    Language = db.Column(db.String(50))
    showings = db.relationship('Showing', backref='format', lazy=True)

class Movie(db.Model):
    __tablename__ = 'Movie'
    MovieID = db.Column(db.Integer, primary_key=True)
    Title = db.Column(db.String(255), nullable=False)
    MaturityRating = db.Column(db.String(50))
    Studio = db.Column(db.String(100))
    Country = db.Column(db.String(50))
    Genre = db.Column(db.String(50))
    showings = db.relationship('Showing', backref='movie', lazy=True)

class Showing(db.Model):
    __tablename__ = 'Showing'
    ShowingID = db.Column(db.Integer, primary_key=True)
    Showtime = db.Column(db.DateTime, nullable=False)
    MovieID = db.Column(db.Integer, db.ForeignKey('Movie.MovieID'), nullable=False)
    FormatID = db.Column(db.Integer, db.ForeignKey('Format.FormatID'), nullable=False)
    bookings = db.relationship('Booking', backref='showing', lazy=True)

class User(db.Model):
    __tablename__ = 'User'
    UserID = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(255), nullable=False)
    PhoneNumber = db.Column(db.String(20))
    Email = db.Column(db.String(255))
    Location = db.Column(db.String(255))
    Age = db.Column(db.Integer)
    Preferences = db.Column(db.Text)
    bookings = db.relationship('Booking', backref='user', lazy=True)
    posts = db.relationship('Post', backref='user', lazy=True)
    reviews = db.relationship('Review', backref='user', lazy=True)
    notifications = db.relationship('Notification', backref='user', lazy=True)

class Cinema(db.Model):
    __tablename__ = 'Cinema'
    CinemaID = db.Column(db.Integer, primary_key=True)
    Location = db.Column(db.String(255), nullable=False)
    Amenities = db.Column(db.Text)
    Facilities = db.Column(db.Text)
    seats = db.relationship('Seat', backref='cinema', lazy=True)
    events = db.relationship('Event', backref='cinema', lazy=True)

class Seat(db.Model):
    __tablename__ = 'Seat'
    SeatID = db.Column(db.Integer, primary_key=True)
    SeatNo = db.Column(db.String(10))
    SeatRow = db.Column(db.String(1))
    SeatType = db.Column(db.String(50))
    CinemaID = db.Column(db.Integer, db.ForeignKey('Cinema.CinemaID'), nullable=False)
    bookings = db.relationship('Booking', backref='seat', lazy=True)

class Booking(db.Model):
    __tablename__ = 'Booking'
    BookingID = db.Column(db.Integer, primary_key=True)
    UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)
    ShowingID = db.Column(db.Integer, db.ForeignKey('Showing.ShowingID'), nullable=False)
    SeatID = db.Column(db.Integer, db.ForeignKey('Seat.SeatID'), nullable=False)
    Price = db.Column(db.Numeric(10, 2))

class Event(db.Model):
    __tablename__ = 'Event'
    EventID = db.Column(db.Integer, primary_key=True)
    Type = db.Column(db.String(50))
    Date = db.Column(db.DateTime)
    Description = db.Column(db.Text)
    CinemaID = db.Column(db.Integer, db.ForeignKey('Cinema.CinemaID'), nullable=False)

class Forum(db.Model):
    __tablename__ = 'Forum'
    Topic = db.Column(db.String(255), primary_key=True)
    Section = db.Column(db.String(100))
    Genre = db.Column(db.String(50))
    posts = db.relationship('Post', backref='forum', lazy=True)

class Post(db.Model):
    __tablename__ = 'Post'
    PostID = db.Column(db.Integer, primary_key=True)
    Content = db.Column(db.Text)
    UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)
    Topic = db.Column(db.String(255), db.ForeignKey('Forum.Topic'), nullable=False)

class Review(db.Model):
    __tablename__ = 'Review'
    ReviewID = db.Column(db.Integer, primary_key=True)
    Rating = db.Column(db.Integer)
    Title = db.Column(db.String(255))
    UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)

class Notification(db.Model):
    __tablename__ = 'Notification'
    NotificationID = db.Column(db.Integer, primary_key=True)
    Time = db.Column(db.DateTime)
    Type = db.Column(db.String(50))
    Sound = db.Column(db.String(50))
    Content = db.Column(db.Text)
    UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)
