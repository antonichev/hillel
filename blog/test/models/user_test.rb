require 'test_helper'

class UserTest < ActiveSupport::TestCase

  setup do
    @user = users(:two)
  end

  test "last_comments should return 3 by default" do
    assert @user.last_comments.count == 3
  end

  test "last_comments should return 2 when 2 is passed" do
    assert @user.last_comments(2).count == 2
  end

  test "last_comments should return 3 or less if there are less than 3 comments" do
    assert users(:one).last_comments.count <= 3
  end

  test "last_user returns the newest user" do
    user = User.create(email: 'test@mail.com', password: '123456')
    assert User.last_user == user
  end
end
