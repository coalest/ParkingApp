# ParkingApp Task

Build a simple app that allows booking of company’s parking place (we have reserved
parking spot on a street by the office). It should be possible to book this place using a slack
command (ie. /parking book). Such booking will be valid until end of day (in correct time
zone) or until someone releases it (so an option to release booking is also required). 

Deployed at: https://cory-parking-app.herokuapp.com/

Slack app at: https://slack.com/oauth/v2/authorize?client_id=3390847623332.3388691088674&scope=commands,chat:write&user_scope=identity.basic,identity.email

# Must-haves
- [X] Sign-in via Slack on web front-end
- [X] View history of bookings on web front-end
- [X] Possible to book a parking spot via Slack
- [X] Possible to release a booking
- [X] Hosted on Github
- [X] Deployed on Heroku
- [ ] Continuous Integration set up
- [X] Most recent versions of Ruby and gems
- [X] Use overcommit and rubocop with Standard gem

# Nice-to-haves
- [X] Slack command for checking who booked the parking spot
- [X] Book and release booking via web
- [ ] Possibility to book and release via SMS (Twilio)
- [ ] Looks half-way decent
- [ ] ES6
- [ ] React/stimulus+turbolinks in frontend
- [ ] Background worker used for emails
- [ ] Additional useful features

# Details
Ruby Version 3.1.2
Rails Version 7.0.2.3
