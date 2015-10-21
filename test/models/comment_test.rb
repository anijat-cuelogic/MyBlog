require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'presence of comment description' do
    @comment = FactoryGirl.create(:comment)
    assert_equal @comment.valid?, true, 'Saved the comment successfully'
  end

  test 'absence of comment params' do
    @comment = Comment.new(description: '', commented_by: nil, post_id: nil)
    assert_equal @comment.valid?, false, 'comment is invalid as params is blank'
  end
end
