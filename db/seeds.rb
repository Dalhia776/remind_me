User.delete_all
Event.delete_all
Notification.delete_all

name = ['Sabertooth', 'Armor', 'Juggernaut', 'Warpath', 'Cable', 'Pixie', 'Karma', 'Sunspot', 'Legion', 'Deadpool','Toad']
description = ['Appointment Reminder', 'Follow up paperwork signed', 'Complete ASV', 'Complete Recert', 'Audit chart', 'Follow up meds or supplies']
reminder_type = ['text', 'email', 'both']




users = User.create([
      {
        first_name: "Jean", last_name: "Grey",
        cellphone_number: "555-555-1111",
        email: "jean1@example.com",
        password: "Wolverine1",
        password_confirmation: "Wolverine1",
        admin: true
      },

      {
        first_name: "Charles", last_name: "Xavier",
        cellphone_number: "555-555-2222",
        email: "professorx@example.com",
        password: "Iknowall",
        password_confirmation: "Iknowall",
        admin: true
      },

      {
        first_name: "Scott", last_name: "Summers",
        cellphone_number: "555-555-3333",
        email: "cyclops@example.com",
        password: "Smolderingeyes",
        password_confirmation: "Smolderingeyes",
        admin: false
      },

      {
        first_name: "Ororo", last_name: "Monroe",
        cellphone_number: "555-555-4444",
        email: "storm@example.com",
        password: "Electrifying",
        password_confirmation: "Electrifying",
        admin: false
      },

      {
        first_name: "Anna", last_name: "Marie",
        cellphone_number: "555-555-5555",
        email: "rogue@example.com",
        password: "Donttouchme",
        password_confirmation: "Donttouchme",
        admin: false
      },

      {
        first_name: "Erik", last_name: "Lehnsherr",
        cellphone_number: "555-555-6666",
        email: "magnito@example.com",
        password: "Magneticman",
        password_confirmation: "Magneticman",
        admin: false
      },

      {
        first_name: "Remy", last_name: "LeBeau",
        cellphone_number: "555-555-7777",
        email: "gambit@example.com",
        password: "Cardplayer",
        password_confirmation: "Cardplayer",
        admin: false
      },

      {
        first_name: "Pietro", last_name: "Maximoff",
        cellphone_number: "555-555-8888",
        email: "quicksilver@example.com",
        password: "Ucantcatchme",
        password_confirmation: "Ucantcatchme",
        admin: false
      },

      {
        first_name: "Kurt", last_name: "Wagner",
        cellphone_number: "555-555-9999",
        email: "nightcrawler@example.com",
        password: "Idisappear1",
        password_confirmation: "Idisappear1",
        admin: false},


      {
        first_name: "Raven", last_name: "Darkhölme",
        cellphone_number: "555-555-1010",
        email: "mystique@example.com",
        password: "Erikfan1",
        password_confirmation: "Erikfan1",
        admin: false
      }])


        40.times do
        user = users.sample
        event = Event.create(
        name: name.sample,
        description: description.sample,
        reminder_type: reminder_type.sample,
        date_time: Faker::Time.forward(23, :morning),
        )
        user.events << event
        end
