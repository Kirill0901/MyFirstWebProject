require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not save category' do
    category = Category.new
    assert_not category.save
  end

  test 'should save post' do
    name = Faker::Lorem.word

    category = Category.new(name: name)
    assert category.save!
  end

  test 'should find post' do
    assert Category.find_by(name: 'MyString')
  end
end
