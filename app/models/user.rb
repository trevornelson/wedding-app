class User < ActiveRecord::Base

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
end
