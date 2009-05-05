require 'test_helper'

class PageTest < ActiveSupport::TestCase
  fixtures :pages

  test "create valid page" do
    page = Page.new(:name => 'new',
                    :title => 'New Page')
    assert page.save
  end

  test "invalid identical pages" do
    page = Page.new(:name => 'about',
                    :title => 'About Us')
    assert !page.save
  end

  test "invalid with empty attributes" do
    page = Page.new
    assert !page.valid?
    assert page.errors.invalid?(:name)
    assert page.errors.invalid?(:title)
  end
end
