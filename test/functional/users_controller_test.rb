require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  test "index with out user" do
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in", flash[:notice]
  end

  test "should get index" do
    get :index, {}, { :user_id => users(:valid_user).id }
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new, {}, { :user_id => users(:valid_user).id }
    assert_response :success
  end

  test "should create user" do
    get :index, {}, { :user_id => users(:valid_user).id }
    assert_difference('User.count') do
      post :create, :user => { :name => 'siggi', :email => 'siggi@example.com',
            :password => 'abc123', :password_confirmation => 'abc123'}
    end
    assert_response :found
  end

  test "should show user" do
    get :index, {}, { :user_id => users(:valid_user).id }
    get :show, :id => users(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :index, {}, { :user_id => users(:valid_user).id }
    get :edit, :id => users(:one).id
    assert_response :success
  end

  test "should update user" do
    get :index, {}, { :user_id => users(:valid_user).id }
    put :update, :id => users(:one).id, :user => { }
    assert_response :success
  end

  test "should destroy user" do
    get :index, {}, { :user_id => users(:valid_user).id }
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:one).id
    end
    assert_redirected_to users_path
  end
end
