require 'test_helper'

class TransphotosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transphotos_index_url
    assert_response :success
  end

end
