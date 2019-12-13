10.times do |talk|
  Talk.create(title: "opening speech #{talk}",
              description: 'orem ipsum dolor sit amet, consectetur adipiscing,
elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
aliquip ex ea commodo consequat',
              startTime: "DateTime.new(2012, 8, 29, 22, 35, 0).change(day: #{talk})",
              endTime: "DateTime.new(2012, 8, 29, 22, 35, 0).change(day: #{talk}+3)",
              location: "hall #{talk}", speakers: ["speaker #{talk}"])
end

puts '10 Talks created'

3.times do |time|
  User.create(email: 'email#{time}@gmail.com', password: "123456", password_confirmation: "123456")
end

puts '3 users created'

6.times do |time|
  schedule = Schedule.create(user_id: time%3, talk_id: time)
end

puts '6 schedules created'
