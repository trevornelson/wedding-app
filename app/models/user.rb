class User < ActiveRecord::Base

  has_many :songs
  has_many :notes

  has_secure_password

  validates :type, inclusion: { in: %w(Admin Attending NotAttending NoResponse),
    message: "Input is not a valid user type." }

  validates :username, uniqueness: true

  validates_presence_of :username,
                        :password_digest,
                        :first_name,
                        :last_name

  def toggle_attending
    if type == 'NoResponse' || type == 'NotAttending'
      type == 'Attending'
    elsif type == 'Attending'
      type == 'NotAttending'
    end
    return type
  end

  def self.json_responses
    json_output = {}
    self.all.map {|u| json_output[u.id] = {first_name:        u.first_name,
                                            last_name:        u.last_name,
                                            full_name:        u.first_name + ' ' + u.last_name,
                                            username:         u.username,
                                            street_address:   u.street_address,
                                            city:             u.city,
                                            state:            u.state,
                                            zip_code:         u.zip_code,
                                            invited_plus_one: u.invited_plus_one,
                                            number_in_party:  u.number_in_party
                                          }
                  }
    return json_output.to_json
  end
end
