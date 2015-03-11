### Production Seeds

User.create(type: 'Admin', username: 'trevor', password: '12345', first_name: 'Trevor', last_name: 'Nelson', street_address: '34 12 29th Street #4D', city: 'Long Island City', state: 'NY', zip_code: '11106', invited_plus_one: true)

Prompt.create(content: 'Do you have some marriage advice for us?')
Prompt.create(content: 'Share a memory of Tina and Trevor.')

### Testing Seeds


# Create users with invited_plus_one = true
10.times do
  User.create(username: Faker::Internet.user_name, password: '12345', first_name: Faker::Name.name, last_name: Faker::Name.last_name, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.postcode, invited_plus_one: true)
end

# Create users with invited_plus_one = false
3.times do
  User.create(username: Faker::Internet.user_name, password: '12345', first_name: Faker::Name.name, last_name: Faker::Name.last_name, street_address: Faker::Address.street_address, city: Faker::Address.city, state: Faker::Address.state_abbr, zip_code: Faker::Address.postcode, invited_plus_one: false)
end

# Create notes & songs
5.times do
  Note.create(prompt_id: 1,user_id: 3, content: Faker::Lorem.paragraph)
  Song.create(user_id: 3, name: Faker::Lorem.sentence, artist: Faker::Name.name, url: Faker::Internet.url('www.youtube.com'))
end
