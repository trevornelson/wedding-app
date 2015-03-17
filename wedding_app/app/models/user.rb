class User < ActiveRecord::Base
  #  I'm feeling like the "status" method is overloaded a bit much here.  My gut
  # says that "Admin" should be something like a role on the User object.  Just
  # a feeling - may not be correct
  scope :admin, -> { where(status: 'Admin') }
  scope :no_response, -> { where(status: 'NoResponse') }
  scope :attending, -> { where(status: 'Attending') }
  scope :not_attending, -> { where(status: 'NotAttending') }

  has_secure_password

  def admin?
    status == 'Admin'
  end

end
