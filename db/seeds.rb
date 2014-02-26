require 'faker'

rand(4..10).times do
  password = Faker::Lorem.characters(10)
  u = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  u.skip_confirmation!
  u.save

rand(10..30).times do
  p = Post.create(
    title: Faker::Lorem.words(rand(1..10)).join(" "), body: Faker::Lorem.paragraphs(rand(1..4)).join("\n"))
  rand(3..10).times do
    p.comments.create(body: Faker::Lorem.paragraphs(rand(1..2)).join("\n"))
  end
 end
end

u = User.first
u.skip_reconfirmation!
u.update_attributes(email: 'vratkalkar@live.com', password: 'helloworld', password_confirmation: 'helloworld')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
