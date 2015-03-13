class User < ActiveRecord::Base
  scope :admin, -> { where(status: 'Admin') }
  scope :no_response, -> { where(status: 'NoResponse') }
  scope :attending, -> { where(status: 'Attending') }
  scope :not_attending, -> { where(status: 'NotAttending') }

  has_secure_password
end
