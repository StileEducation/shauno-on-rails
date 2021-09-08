require "test_helper"

class ButtonTest < ActiveSupport::TestCase
  test "should not save button without uuid" do
    button = Button.new
    assert_not button.save, "Saved the button without a uuid"
  end

  test "should save button with uuid" do
    button = Button.new(uuid: "totally-uuid")
    assert button.save, "Did not save button with uuid provided"
  end

  test "should not save button with a uuid that already exists in the database" do
    Button.create(uuid: "existing-uuid")
    button = Button.new(uuid: "existing-uuid")

    assert_raises(ActiveRecord::RecordNotUnique) { button.save }
  end

  test "successfully edits whether button is active or not" do 
    button = Button.find_by(uuid: "this-is-uuid")
    button.update(is_active: false)

    assert button.save, "Button was not marked as inactive"
  end
end
