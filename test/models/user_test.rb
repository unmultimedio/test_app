require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should create a new basic user' do
    user = User.new(
      email: 'julian@zentrifuga.com'
    )
    assert user.save
  end

  test 'should create a more complex user' do
    user = User.new(
      email: 'another_user@domain.com',
      first_name: 'Julian',
      last_name: 'Figueroa',
      zipcode: '54321',
      street: 'A Bright Street',
      country: 'UK'
    )
    assert user.save
  end

  test 'should not create user without email' do
    user = User.new(
      first_name: 'Julian',
      last_name: 'Figueroa',
      zipcode: '54321',
      street: 'A Bright Street',
      country: 'UK'
    )
    assert_not user.save
  end
end
