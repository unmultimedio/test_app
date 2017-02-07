require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should not register existing email' do
    post users_path, params: { user: {
      email: 'user@domain.com'
    } }
    assert_response 401
  end

  test 'should register basic' do
    post users_path, params: { user: {
      email: 'julian@zentrifuga.com'
    } }
    assert_response 302
  end

  test 'should register complex' do
    post users_path, params: { user: {
      first_name: 'Julian',
      last_name: 'Figueroa',
      zipcode: '123456',
      street: 'A Wide Street',
      country: 'Colombia',
      email: 'julian@zentrifuga.com'
    } }
    assert_response 302
  end

  test 'should get user info' do
    user = users(:one)
    get user_path id: user.id, token: user.token
    assert_response 200
  end

  test 'should not get user info' do
    user = users(:one)
    get user_path id: user.id
    assert_response 401
  end
end
