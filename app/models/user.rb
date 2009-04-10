require 'digest/sha2'

class User < ActiveRecord::Base

  validates_presence_of :name
  validates_uniqueness_of :name
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validate :password_non_blank
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end


  def password_non_blank
    errors.add(:password, "missing") if hashed_password.blank?
    errors.add(:password_confirmation, "missing") if password_confirmation.blank?    
  end

  private

  def self.encrypted_password(password, salt)
    string_to_hash = password + "kisi" + salt
    Digest::SHA256.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

end
