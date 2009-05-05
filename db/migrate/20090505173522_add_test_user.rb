class AddTestUser < ActiveRecord::Migration
  def self.up
    User.delete_all

    User.create(:name => 'Dabbi',
                    :email => 'dabbi@example.com',
                    :password => 'abc123',
                    :password_confirmation => 'abc123')
  end

  def self.down
    User.delete_all
  end
end
