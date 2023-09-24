class User < ApplicationRecord
  CONFIRMATION_TOKEN_EXP = 30.minutes
  EMAIL_REGEXP = /\A[^@\s]+@[^@\s]+\z/

  has_secure_password

  validates :first_name, presence: true, on: :update
  validates :last_name, presence: true, on: :update
  validates :password,
  presence: {on: create},
  length: {minimum: 8, maximum: 128}
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: EMAIL_REGEXP

  normalizes :email, with: -> { _1.strip.downcase }

  def generate_confirmation_token
    signed_id expires_in: CONFIRMATION_TOKEN_EXP, purpose: :confirm_email
  end

  ### Name
  def name=(full_name)
    self.first_name, self.last_name = full_name.to_s.squish.split(/\s/, 2)
  end

  def name
    [first_name, last_name].join(" ")
  end

  def to_s
    name
  end
end
