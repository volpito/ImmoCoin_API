require 'faker'

5.times do |y|
  User.create( email: "mail#{y}@mail.com", password: "pwpwpw#{y}" )
end
30.times do |i|
  Accommodation.create(title: Faker::Superhero.name, description: Faker::Quotes::Shakespeare.as_you_like_it_quote, price: Faker::Number.number(digits: 6), user_id: Faker::Number.between(from: 1, to: 4))
end