class User < ActiveRecord::Base

  validates :type, inclusion: { in: %w(Admin Attending NotAttending NoResponse),
    message: "Input is not a valid user type." }

  validates :username, uniqueness: true

  validates_presence_of :username,
                        :password_digest,
                        :first_name,
                        :last_name

  validates :invited_plus_one, inclusion: { in: [true, false] }
end
