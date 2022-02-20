require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @user = users(:example)
    @post = posts(:post_one)
  end

  test 'should not save comment' do
    comment = Comment.new
    assert_not comment.save
  end

  test 'should save comment' do
    body = Faker::Lorem.word
    summary = Faker::Lorem.word
    image = Faker::Lorem.word

    comment = Comment.create(body: body, :user_id => @user.id, :post_id => @post.id)
    assert comment.save!
  end

  test 'should find comment' do
    assert Comment.find_by(body: 'MyText')
  end
end
