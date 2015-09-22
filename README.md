#Summary
<hr>
**Remind Me** is an application built on Ruby on Rails. It is a reminder system for busy nurses who have many due dates for paperwork and appointments. Remind me sends out reminders *2 weeks*, *1 week*, and *2 days* before the due date that is entered.
This app uses:

-[Twilio gem](https://github.com/twilio/twilio-ruby) to send SMS reminders
-[Sendgrid gem](https://github.com/PavelTyk/sendgrid-rails) to send email reminders
-Postgres as the database
-Heroku scheduler to send out daily reminders
-Devise, CanCanCan, and Rails_admin is used for authorization and authentication

###Don't Forget
You will need to make a [Twilio account](https://www.twilio.com/) and [SendGrid account](https://sendgrid.com/)
