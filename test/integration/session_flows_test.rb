require 'test_helper'

class SessionFlowsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:post_one)
    @category = categories(:one)
    @comment = comments(:comment_one)
  end

  test 'unauthorized user will be redirected to login page' do
    get root_url
    assert :redirect
  end

  test 'user with incorrect credentials will be redirected to login page' do
    post user_session_url, params: { name: Faker::Lorem.word, password: Faker::Lorem.word }
    assert controller: :session, action: :login
  end

  test 'user with correct credentials will see the root' do
    password = Faker::Lorem.word

    user = User.create(name: Faker::Lorem.word, password: password, password_confirmation: password)

    post user_session_url, params: { name: user.name, password: password }

    assert controller: :posts, action: :index
  end

  test 'user will see the root after signing up' do
    username = Faker::Lorem.word
    password = Faker::Lorem.word

    post users_url, params: { user: { name: username, password: password, password_confirmation: password } }

    assert :success
  end

  test 'user can logout' do
    password = Faker::Lorem.word

    user = User.create(name: Faker::Lorem.word, password: password, password_confirmation: password)

    post user_session_url, params: { name: user.name, password: password }

    get destroy_user_session_url

    assert controller: :session, action: :login
  end

  test 'user can create post' do
    username = Faker::Lorem.word
    password = Faker::Lorem.word

    post users_url, params: { user: { name: username, password: password, password_confirmation: password } }
    get create_url, params: {post: { title: @post.title, body: @post.body } }

    assert :success
  end

  test 'user can create category' do
    username = Faker::Lorem.word
    password = Faker::Lorem.word

    post users_url, params: { user: { name: username, password: password, password_confirmation: password } }
    get create_category_url, params: {category: { name: @category.name } }

    assert :success
  end
end
