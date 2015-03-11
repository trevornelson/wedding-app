class User < ActiveRecord::Base

  validates :type, inclusion: { in: %w(Admin Attending NotAttending NoResponse),
    message: "Input is not a valid user type." }

  validates :username, uniqueness: true

  validates_presence_of :type,
                        :username,
                        :password_digest,
                        :first_name,
                        :last_name,

  validates_inclusion_of :invited_plus_one
end
