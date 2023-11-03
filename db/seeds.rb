# db/seeds.rb

# User seed data
user1 = User.create!(
  provider: "github",
  uid: "uid1",
  name: "User One",
  image_url: "https://example.com/user1.jpg"
)

user2 = User.create!(
  provider: "github",
  uid: "uid2",
  name: "User Two",
  image_url: "https://example.com/user2.jpg"
)

user3 = User.create!(
  provider: "github",
  uid: "uid3",
  name: "User Three",
  image_url: "https://example.com/user3.jpg"
)

# Event seed data
event1 = Event.create!(
  owner: user1,
  name: "Event One",
  place: "Place One",
  start_at: DateTime.now + 1.days,
  end_at: DateTime.now + 2.days,
  content: "Event One content here."
)

event2 = Event.create!(
  owner: user2,
  name: "Event Two",
  place: "Place Two",
  start_at: DateTime.now + 3.days,
  end_at: DateTime.now + 4.days,
  content: "Event Two content here."
)

event3 = Event.create!(
  owner: user3,
  name: "Event Three",
  place: "Place Three",
  start_at: DateTime.now + 5.days,
  end_at: DateTime.now + 6.days,
  content: "Event Three content here."
)

# Ticket seed data
Ticket.create!(
  user: user1,
  event: event2,
  comment: "Looking forward to it!"
)

Ticket.create!(
  user: user2,
  event: event3,
  comment: "Can't wait!"
)

Ticket.create!(
  user: user3,
  event: event1,
  comment: "See you there!"
)