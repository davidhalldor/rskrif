require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  fixtures :pages

  test "index with out user" do
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in", flash[:notice]
  end

  test "should get index" do
    get :index, {}, { :user_id => users(:valid_user).id }
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
    get :new, {}, { :user_id => users(:valid_user).id }
    assert_response :success
  end

  test "should create page" do
    get :index, {}, { :user_id => users(:valid_user).id }
    assert_difference('Page.count') do
      post :create, :page => { :name => 'after', :title => 'After Page' }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
    get :index, {}, { :user_id => users(:valid_user).id }
    get :show, :id => pages(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :index, {}, { :user_id => users(:valid_user).id }
    get :edit, :id => pages(:one).id
    assert_response :success
  end

  test "should update page" do
    get :index, {}, { :user_id => users(:valid_user).id }
    put :update, :id => pages(:one).id, :page => { }
    assert_response :success
  end

  test "should destroy page" do
    get :index, {}, { :user_id => users(:valid_user).id }
    assert_difference('Page.count', -1) do
      delete :destroy, :id => pages(:one).id
    end

    assert_redirected_to pages_path
  end
end
