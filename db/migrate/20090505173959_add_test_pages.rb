class AddTestPages < ActiveRecord::Migration
  def self.up
    Page.delete_all

    Page.create(:name => 'about',
            :title => 'About Us',
            :body => 'This is the About page.')
    Page.create(:name => 'contact',
            :title => 'Contact Us',
            :body => 'This is the Contact page.')
    Page.create(:name => 'privacy',
            :title => 'Privacy policy',
            :body => 'This is the Privacy policy page.')

  end

  def self.down
    Page.delete_all
  end
end
