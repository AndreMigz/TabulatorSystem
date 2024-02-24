# test/models/contestant_test.rb
require 'test_helper'

class ContestantTest < ActiveSupport::TestCase
  setup do
    user = users(:one)
    @contestant = Contestant.new(first_name: "John", middle_name: "A.", last_name: "Doe", age: 25, address: "123 Main St", user_id: user.id)
  end

  test "should be valid" do
    assert @contestant.valid?
  end

  test "first name should be present" do
    @contestant.first_name = " "
    assert_not @contestant.valid?
  end

  test "middle name should be present" do
    @contestant.middle_name = " "
    assert_not @contestant.valid?
  end

  test "last name should be present" do
    @contestant.last_name = " "
    assert_not @contestant.valid?
  end

  test "full name formatting" do
    assert_equal "Doe, John A.", @contestant.full_name
  end

  test "should create rating after creating contestant" do
    assert_difference('Rating.count', 1) do
      @contestant.save
    end
  end
end
