require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => { :name => 'siggi', :email => 'siggi@example.com',
            :password => 'abc123', :password_confirmation => 'abc123'}
    end
   
    #assert_redirected_to users_path(assigns(:user))
    assert_response :found
  end

  test "should show user" do
    get :show, :id => users(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => users(:one).id
    assert_response :success
  end

  test "should update user" do
    put :update, :id => users(:one).id, :user => { }
    #assert_redirected_to user_path(assigns(:user))
    assert_response :success
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => users(:one).id
    end

    assert_redirected_to users_path
  end
end
