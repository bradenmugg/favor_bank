require 'test_helper'

class FavorTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @favor = @user.favors.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @favor.valid?
  end

  test "user id should be present" do
    @favor.user_id = nil
    assert_not @favor.valid?
  end
  
  test "content should be present" do
    @favor.content = "   "
    assert_not @favor.valid?
  end

  test "content should be at most 300 characters" do
    @favor.content = "a" * 301
    assert_not @favor.valid?
  end
  
  test "order should be most recent first" do
    assert_equal favors(:most_recent), Favor.first
  end
  
end
