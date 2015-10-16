require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    login_as_user
  end

  test "should get index" do
    @ability.can :read, Post
    get :index
    assert_response :success
  end

  test "should get new" do
    @ability.can :create, Post
    get :new
    assert_response :success
  end

  test "should create post" do
    @ability.can :create, Post
    assert_difference('Post.count') do
      post :create, post: @post.attributes
    end

    assert_redirected_to post_path(assigns(:post))
  end

  test "should get edit" do
    @ability.can :update, Post
    get :edit
    assert_response :success
  end

  test "should show post" do
    @ability.can :read, Post
    get :show, id: @post
    assert_response :success
  end

  test "should get destroy" do
    @ability.can :destroy, Post
    assert_difference('Post.count', -1) do
      delete :destroy, id: @post
    end
    assert_redirected_to posts_path
  end

end
