require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "the post creation" do
    assert_difference('Post.count') do
      post = Post.new(body: posts(:one).body,
                      title: posts(:one).title,
                      user_id: users(:one).id)
      post.save
    end
  end
end
