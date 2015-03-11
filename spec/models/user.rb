require_relative '../spec_helper'

describe 'User Model' do
  let(:valid_user) { User.new(username: 'username1', password: '12345', first_name: 'David', last_name: 'Johnson', street_address: '1423 South Smith Rd.', city: 'Astoria', state: 'NY', zip_code: '11105', invited_plus_one: true) }
  let(:valid_attending_user) { User.new(type: 'Attending', username: 'username2', password: '12345', first_name: 'Berry', last_name: 'Johnson', street_address: '1423 South Smith Rd.', city: 'Astoria', state: 'NY', zip_code: '11105', invited_plus_one: true) }
  let(:invalid_type_user)  { User.new(username: 'username3', password: '12345', first_name: 'Terry', last_name: 'Smith', street_address: '14 Summer Rd.', city: 'Houston', state: 'TX', zip_code: '11107', invited_plus_one: true) }
  let(:nonunique_username_user)  { User.new(username: 'username1', password: '12345', first_name: 'Pete', last_name: 'Johns', street_address: '123532 Broadway Rd.', city: 'Houston', state: 'TX', zip_code: '11107', invited_plus_one: true) }

  it 'saved a valid user to the database' do
    valid_user.save
    saved_user = User.find_by(username: 'username1')
    expect(saved_user.first_name).to eq('David')
  end

  it 'flagged user as not attending' do
    valid_user.toggle_attending
    valid_user.save
    saved_user = Attending.find_by(username: 'username1')
    expect(saved_user.first_name).to eq('David')
  end

  it 'flagged a user as attending' do
    user = valid_attending_user.save
    user.toggle_attending
    user.save
    saved_user = Attending.find_by(username: 'username2')
    expect(saved_user.first_name).to eq('Berry')
  end

  it 'did not save a user to the database with an invalid type attribute' do
    invalid_type_user.save
    saved_user = User.find_by(username: 'username3')
    expect(saved_user).to eq(nil)
  end

  it 'encrypted a users password' do
    saved_user = User.find_by(username: 'username1')
    expect(saved_user.password_digest).not_to eq('12345')
  end

  it 'did not save a user to the database with a non-unique username' do
    nonunique_username_user.save
    saved_user = User.find_by(street_address: '123532 Broadway Rd.')
    expect(saved_user).to eq(nil)
  end
end
