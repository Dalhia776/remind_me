description = [
  'Doctors appointment Reminder', 'Paperwork has been signed and returned', 'Complete ASV and paperwork', 'Complete Recert and paperwork', 'Audit chart', 'Follow up patients meds or supplies'
]
reminder_type = ['text', 'email', 'both']




  user = User.create(
        :first_name => "Jean",
        :last_name => "Grey",
        :cellphone_number => "555-555-5555",
        :email => "jean1@example.com",
        :password => "Wolverine1",
        :password_confirmation => "Wolverine1",
        :admin => true
        )


  10.times do |n|
      password = Faker::Internet.password(8)
      user = User.create!(
              email: Faker::Internet.email,
              password: password,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              cellphone_number: Faker::PhoneNumber.phone_number
              )
          4.times do
          event = Event.create(
          name: Faker::Name.name,
          description: description.sample,
          reminder_type: reminder_type.sample,
          date_time: Faker::Time.forward(23, :morning),
          user_id: user.id
          )
          
        end
  end
