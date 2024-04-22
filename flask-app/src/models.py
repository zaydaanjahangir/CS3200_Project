from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()


class Format(db.Model):
   __tablename__ = 'Format'
   FormatID = db.Column(db.Integer, primary_key=True)
   AudioType = db.Column(db.String(50))
   Language = db.Column(db.String(50))
   showings = db.relationship('Showing', backref='format', lazy=True)


   def to_dict(self):
       return {
           'FormatID': self.FormatID,
           'AudioType': self.AudioType,
           'Language': self.Language
       }


class Movie(db.Model):
   __tablename__ = 'Movie'
   MovieID = db.Column(db.Integer, primary_key=True)
   Title = db.Column(db.String(255), nullable=False)
   MaturityRating = db.Column(db.String(50))
   Studio = db.Column(db.String(100))
   Country = db.Column(db.String(50))
   Genre = db.Column(db.String(50))
   showings = db.relationship('Showing', backref='movie', lazy=True)


   def to_dict(self):
       return {
           'MovieID': self.MovieID,
           'Title': self.Title,
           'MaturityRating': self.MaturityRating,
           'Studio': self.Studio,
           'Country': self.Country,
           'Genre': self.Genre
       }


class Showing(db.Model):
   __tablename__ = 'Showing'
   ShowingID = db.Column(db.Integer, primary_key=True)
   Showtime = db.Column(db.DateTime, nullable=False)
   MovieID = db.Column(db.Integer, db.ForeignKey('Movie.MovieID'), nullable=False)
   FormatID = db.Column(db.Integer, db.ForeignKey('Format.FormatID'), nullable=False)
   bookings = db.relationship('Booking', backref='showing', lazy=True)


   def to_dict(self):
       return {
           'ShowingID': self.ShowingID,
           'Showtime': self.Showtime.strftime('%Y-%m-%d %H:%M:%S'),
           'MovieID': self.MovieID,
           'FormatID': self.FormatID
       }


class Cinema(db.Model):
   __tablename__ = 'Cinema'
   CinemaID = db.Column(db.Integer, primary_key=True)
   Location = db.Column(db.String(255), nullable=False)
   Amenities = db.Column(db.Text)
   Facilities = db.Column(db.Text)
   seats = db.relationship('Seat', backref='cinema', lazy=True)
   events = db.relationship('Event', backref='cinema', lazy=True)


   def to_dict(self):
       return {
           'CinemaID': self.CinemaID,
           'Location': self.Location,
           'Amenities': self.Amenities,
           'Facilities': self.Facilities
       }


class Seat(db.Model):
   __tablename__ = 'Seat'
   SeatID = db.Column(db.Integer, primary_key=True)
   SeatNo = db.Column(db.String(10))
   SeatRow = db.Column(db.String(1))
   SeatType = db.Column(db.String(50))
   CinemaID = db.Column(db.Integer, db.ForeignKey('Cinema.CinemaID'), nullable=False)


   def to_dict(self):
       return {
           'SeatID': self.SeatID,
           'SeatNo': self.SeatNo,
           'SeatRow': self.SeatRow,
           'SeatType': self.SeatType,
           'CinemaID': self.CinemaID
       }


class Booking(db.Model):
   __tablename__ = 'Booking'
   BookingID = db.Column(db.Integer, primary_key=True)
   UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)
   ShowingID = db.Column(db.Integer, db.ForeignKey('Showing.ShowingID'), nullable=False)
   SeatID = db.Column(db.Integer, db.ForeignKey('Seat.SeatID'), nullable=False)
   Price = db.Column(db.Numeric(10, 2))


   def to_dict(self):
       return {
           'BookingID': self.BookingID,
           'UserID': self.UserID,
           'ShowingID': self.ShowingID,
           'SeatID': self.SeatID,
           'Price': str(self.Price)
       }


class Event(db.Model):
   __tablename__ = 'Event'
   EventID = db.Column(db.Integer, primary_key=True)
   Type = db.Column(db.String(50))
   Date = db.Column(db.DateTime)
   Description = db.Column(db.Text)
   CinemaID = db.Column(db.Integer, db.ForeignKey('Cinema.CinemaID'), nullable=False)


   def to_dict(self):
       return {
           'EventID': self.EventID,
           'Type': self.Type,
           'Date': self.Date.strftime('%Y-%m-%d'),
           'Description': self.Description,
           'CinemaID': self.CinemaID
       }


class Forum(db.Model):
   __tablename__ = 'Forum'
   Topic = db.Column(db.String(255), primary_key=True)
   Section = db.Column(db.String(100))
   Genre = db.Column(db.String(50))
   posts = db.relationship('Post', backref='forum', lazy=True)


   def to_dict(self):
       return {
           'Topic': self.Topic,
           'Section': self.Section,
           'Genre': self.Genre
       }


class Post(db.Model):
   __tablename__ = 'Post'
   PostID = db.Column(db.Integer, primary_key=True)
   Content = db.Column(db.Text)
   UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)
   Topic = db.Column(db.String(255), db.ForeignKey('Forum.Topic'), nullable=False)


   def to_dict(self):
       return {
           'PostID': self.PostID,
           'Content': self.Content,
           'UserID': self.UserID,
           'Topic': self.Topic
       }


class Review(db.Model):
   __tablename__ = 'Review'
   ReviewID = db.Column(db.Integer, primary_key=True)
   Rating = db.Column(db.Integer)
   Title = db.Column(db.String(255))
   UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)


   def to_dict(self):
       return {
           'ReviewID': self.ReviewID,
           'Rating': self.Rating,
           'Title': self.Title,
           'UserID': self.UserID
       }


class Notification(db.Model):
   __tablename__ = 'Notification'
   NotificationID = db.Column(db.Integer, primary_key=True)
   Time = db.Column(db.DateTime)
   Type = db.Column(db.String(50))
   Sound = db.Column(db.String(50))
   Content = db.Column(db.Text)
   UserID = db.Column(db.Integer, db.ForeignKey('User.UserID'), nullable=False)


   def to_dict(self):
       return {
           'NotificationID': self.NotificationID,
           'Time': self.Time.strftime('%Y-%m-%d %H:%M:%S'),
           'Type': self.Type,
           'Sound': self.Sound,
           'Content': self.Content,
           'UserID': self.UserID
       }
