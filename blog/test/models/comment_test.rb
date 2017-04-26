require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @user = users(:two)
    @post = posts(:two)
  end

  test "the comment creation" do
    assert_difference('Comment.count') do
      comment = Comment.new(body: comments(:one).body,
                            post: @post,
                            user: @user)
      comment.save
    end
  end

  test "last_comments should return 5 by default" do
    assert Comment.last_comments.count == 5
  end

  test "last_comments should return 3 when 3 is passed" do
    assert Comment.last_comments(3).count == 3
  end

  test "last_comments should return 5 or less if there are less than 5 comments" do
    assert Comment.last_comments.count <= 5
  end
end
