require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new(email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should be valid (fixture)" do
    user = users(:daily_user)
    assert user.valid?
  end


  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

end
