require 'test_helper'

class FavorsControllerTest < ActionController::TestCase
  
  def setup
    @favor = favors(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Favor.count' do
      post :create, favor: { content: "Lorem ipsum" }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Favor.count' do
      delete :destroy, id: @favor
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong favor" do
    log_in_as(users(:michael))
    favor = favors(:ants)
    assert_no_difference 'Favor.count' do
      delete :destroy, id: favor
    end
    assert_redirected_to root_url
  end
  
end
