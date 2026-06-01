route of assignment4
###
GET http://localhost:4004/odata/v4/event/Events?$filter=status eq 'Published'&$orderby=startDate asc

###1. Published events sorted by startDate
GET http://localhost:4004/odata/v4/event/Events?$filter=status eq 'Published'&$orderby=startDate

###2. Events filtered by Workshop
GET http://localhost:4004/odata/v4/event/Events?$filter=eventType eq 'Workshop'

###3. Registrations for a specific event
GET http://localhost:4004/odata/v4/event/Registrations?$filter=event_ID eq 'a1111111-1111-1111-1111-111111111111'

###4. Create Registration
POST http://localhost:4004/odata/v4/event/Registrations
Content-Type: application/json

{
  "ID": "77777777-7777-7777-7777-777777777777",
  "event_ID": "11111111-1111-1111-1111-111111111111",
  "attendeeName": "Vikram Singh",
  "attendeeEmail": "vikram@test.com",
  "attendeePhone": "9876543210",
  "company": "ABC Pvt Ltd",
  "ticketType": "VIP",
  "registrationDate": "2026-05-31T10:00:00Z",
  "amountPaid": 2500,
  "paymentId": "PAY1001"
}

###5. Speakers by Rating
GET http://localhost:4004/odata/v4/event/Speakers?$orderby=rating desc

###6. Events with Available Seats
GET http://localhost:4004/odata/v4/event/Events?$filter=registeredCount lt maxAttendees


### dummy
POST http://localhost:4004/odata/v4/event/Events
Content-Type: application/json
X-CSRF-Token: <token>

{
  "ID": "a1111111-1111-1111-1111-111111111111",
  "title": "AI Summit",
  "description": "AI Conference",
  "eventType": "Conference",
  "venue_ID": "V1",
  "startDate": "2026-06-10",
  "endDate": "2026-06-11",
  "startTime": "10:00:00",
  "endTime": "18:00:00",
  "maxAttendees": 500,
  "registeredCount": 0,
  "ticketPrice": 1000,
  "status": "Draft",
  "organizerName": "TechOrg",
  "organizerEmail": "org@test.com",
  "tags": "AI,ML"
}

###7. Publish an Event
PATCH http://localhost:4004/odata/v4/event/Events(a1111111-1111-1111-1111-111111111111)
Content-Type: application/json
X-CSRF-Token: <token>
If-Match: *

{
  "status": "Published"
}

###8. Submit Feedback
POST http://localhost:4004/odata/v4/event/Feedback
Content-Type: application/json

{
  "ID": "88888888-8888-8888-8888-888888888888",
  "event_ID": "11111111-1111-1111-1111-111111111111",
  "attendeeEmail": "vikram@test.com",
  "overallRating": 5,
  "contentRating": 5,
  "venueRating": 4,
  "speakerRating": 5,
  "comment": "Excellent event",
  "submittedAt": "2026-05-31T15:00:00Z"
}
