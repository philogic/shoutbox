require 'faker'

Rails.logger = Logger.new(STDOUT)

Rails.logger.info "Creating users..."

Shout.delete_all
User.delete_all

20.times do |i|
  number = i.zero? ? "" : i + 1
  username = "user#{number}"
  email = "#{username}@example.com"
  next if User.exists?(email: email)
  User.create!(
      email: email,
      username: username,
      confirmed_at: Time.zone.now,
      password: "password"
  )
end

Rails.logger.info "Creating shouts..."

user_ids = User.pluck(:id)

100.times do
  Shout.create(
      body: Faker::Lorem.sentence,
      user_id: user_ids.sample,
      created_at: Faker::Date.between(3.weeks.ago, Date.today)
  )
end
