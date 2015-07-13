require 'test_helper'

class FavorsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "favor interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # Invalid submission
    assert_no_difference 'Favor.count' do
      post favors_path, favor: { content: "" }
    end
    assert_select 'div#error_explanation'
    # Valid submission
    content = "This favor really ties the room together"
    assert_difference 'Favor.count', 1 do
      post favors_path, favor: { content: content }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # Delete a post.
    assert_select 'a', text: 'delete'
    first_favor = @user.favors.paginate(page: 1).first
    assert_difference 'Favor.count', -1 do
      delete favor_path(first_favor)
    end
    # Visit a different user.
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
