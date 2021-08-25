require "test_helper"

class ButtonTest < ActiveSupport::TestCase
  test "should not save button without uuid" do
    button = Button.new
    assert_not button.save, "save the button without a uuid"
  end

  test "should save button with uuid" do
    button = Button.create(uuid: "totally-uuid")
    assert button.save, "button with uuid is saved"
  end

  test "should not save button with a uuid that already exists in the database" do
    Button.create(uuid: "existing-uuid")
    button = Button.create(uuid: "existing-uuid")

    assert_not button.save, "button with pre-existing uuid is not saved" #currently fails... have to ensure the uuids r unique?
  end
end
