require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'presence of post title and description' do
    @post = FactoryGirl.create(:post)
    assert_equal @post.valid?, true, 'Saved the post succesfully'
  end

  test 'absence of post params' do
    @post = Post.new(title: '', description: '', author_id: nil)
    assert_equal @post.valid?, false, 'post is invalid as title is blank'
  end

  test "should not save post without title and description" do
    post = Post.new
    assert_not post.save, "Saved the post with blank title & description"
  end
end
