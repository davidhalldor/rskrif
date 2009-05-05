require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  test "create valid user" do
    user = User.new(:name => 'siggi',
                    :email => 'siggi@example.com',
                    :password => 'abc123',
                    :password_confirmation => 'abc123')
    assert user.save
  end

  test "invalid with empty attributes" do
    user = User.new
    assert !user.valid?
    assert user.errors.invalid?(:name)
    assert user.errors.invalid?(:email)
    assert user.errors.invalid?(:password)
    assert user.errors.invalid?(:password_confirmation)
  end

  test "valid email" do
    valid = %w{ dabbi@dabbi.is }
    invalid = %w{ dabbi dabbi@dabbi @dabbi.is dabbi@ @.is}

    valid.each do |email|
      user = User.new(:name => 'siggi',
                      :password => 'abc123',
                      :password_confirmation => 'abc123',
                      :email => email)
      assert user.valid?, user.errors.full_messages
    end

    invalid.each do |email|
      user = User.new(:name => 'siggi',
                      :password => 'abc123',
                      :password_confirmation => 'abc123',
                      :email => email)
      assert !user.valid?, "saving #{email}"
    end  
  end
end
