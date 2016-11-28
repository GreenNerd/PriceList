require 'test_helper'

class SitesAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sites_admin_index_url
    assert_response :success
  end

end
