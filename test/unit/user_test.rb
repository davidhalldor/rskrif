require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  # Replace this with your real tests.

  def test_create_valid_user
    user = User.new(:name => 'siggi', :email => 'siggi@example.com',
            :password => 'abc123', :password_confirmation => 'abc123')
    assert user.save
  end

  test "invalid with empty attributes" do
    user = User.new
    assert !user.valid?
    assert user.errors.invalid?(:name)
    assert user.errors.invalid?(:email)
    assert user.errors.invalid?(:password)
    #assert user.errors.invalid?(:password_confirmation)
  end

end
