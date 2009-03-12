class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 128, :null => false
      t.string :email, :limit => 128, :null => false
      t.string :hashed_password, :limit => 64 
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
