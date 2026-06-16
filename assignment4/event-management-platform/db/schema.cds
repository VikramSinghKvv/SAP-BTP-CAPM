namespace platform.events;


type Email : String;
type Phone : String;
type Amount : Decimal(10,2);
type Rating : Decimal(2,1);
type Name : String;
type URL : String;


type EventType : String enum {
  Conference; Workshop; Seminar; Webinar; Meetup;
}

type EventStatus : String enum {
  Draft; Published; Ongoing; Completed; Cancelled;
}

type TicketType : String enum {
  General; VIP; Student;
}

type RegistrationStatus : String enum {
  Confirmed; Cancelled; Waitlisted; Attended;
}

type VenueType : String enum {
  Auditorium; ConferenceHall; Outdoor; Virtual;
}

entity Venues {
  key ID : String;
  name : Name;
  address : String;
  city : String;
  capacity : Integer;
  type : VenueType;
  amenities : String;
  hourlyRate : Amount;
  contactPerson : Name;
  phone  : Phone;
  isActive : Boolean default true;
  
}

entity Events {
  key ID : String;

  title : Name;
  description : String;
  eventType : EventType;
  venue : Association to Venues;

  startDate : Date;
  endDate : Date;
  startTime : Time;
  endTime : Time;

  maxAttendees : Integer;
  registeredCount : Integer default 0;

  ticketPrice : Amount;

  status : EventStatus default 'Draft';

  organizerName : Name;
  organizerEmail : Email;

  tags : String;
}

entity Speakers {
  key ID : String;

  name : Name;
  email : Email;
  phone : Phone;
  bio : String;
  company : String;
  designation : String;
  expertise : String;
  photoUrl : URL;

  rating : Rating;
  totalTalks : Integer;
  isActive : Boolean default true;
}

entity EventSpeakers {
  key event : Association to Events;
  key speaker : Association to Speakers;

  topic : String;
  sessionTime : Time;
  sessionDuration : Integer;
  roomNumber : String;
}

entity Registrations {
  key ID : String;

  event : Association to Events;

  attendeeName : Name;
  attendeeEmail : Email;
  attendeePhone : Phone;
  company : String;

  ticketType : TicketType;

  registrationDate : Timestamp;

  status : RegistrationStatus default 'Confirmed';

  amountPaid : Amount;
  paymentId : String;
}

entity Feedback {
  key ID : String;

  event : Association to Events;

  attendeeEmail : Email;

  overallRating : Rating;
  contentRating : Rating;
  venueRating : Rating;
  speakerRating : Rating;

  comment : String;
  submittedAt : Timestamp;
}