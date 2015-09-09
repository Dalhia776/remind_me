

user = User.create(
        :first_name => "Jean",
        :last_name => "Grey",
        :cellphone_number => "555-555-5555",
        :email => "jean1@example.com",
        :password => "Wolverine1",
        :password_confirmation => "Wolverine1",
        :admin => true
        )
  5.times do
  event = Event.create(
  name: Faker::Name.name,
  reminder_type: Faker::Lorem.words(2),
  date_time: Faker::Time.forward(23, :morning),
  user_id: user.id
  )
  end

  10.times do |n|
    password = Faker::Internet.password(8)
    user = User.create!(
            email: Faker::Internet.email,
            password: password,
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            cellphone_number: Faker::PhoneNumber.phone_number
            )
      5.times do
      event = Event.create(
      name: Faker::Name.name,
      reminder_type: Faker::Lorem.words(2),
      date_time: Faker::Time.forward(23, :morning),
      user_id: user.id
      )
      end
  end
