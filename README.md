#Summary
  **Remind Me** is an application built on Ruby on Rails. It is a reminder system for busy nurses who have many due dates for paperwork and appointments. Remind me sends out reminders *2 weeks*, *1 week*, and *2 days* before the due date that is entered.

  This app uses [Twilio](https://github.com/twilio/twilio-ruby) gem to send SMS reminders, [Sendgrid](https://github.com/PavelTyk/sendgrid-rails) gem to send email reminders, [Postgres](https://github.com/ged/ruby-pg) gem as the database, [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler) to send out daily reminders, and [Devise](https://github.com/plataformatec/devise), [CanCanCan](https://github.com/CanCanCommunity/cancancan), and [Rails_admin](https://github.com/sferik/rails_admin) gems are used for authorization and authentication.

###Don't Forget
  You will need to make a [Twilio](https://www.twilio.com/) account and [SendGrid](https://sendgrid.com/) account.
