require 'test_helper'

class CreateUserTest < ActionDispatch::IntegrationTest

  test "sign up new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username: "joe", email: "joe@example.com", password: "password" }
    end
    assert_template 'users/show'
    assert_match "joe", response.body
  end

end