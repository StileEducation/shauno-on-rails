require "test_helper"

class ReasonTest < ActiveSupport::TestCase
  test "create reason with non empty string works" do
    reason = Reason.new(reason: "legitimate reason")
    assert reason.save, "it did not save valid reason"
  end

  test "create reason with empty/nil string fails" do
    reason = Reason.new
    assert_not reason.save, "it saved an empty reason"
  end

  test "should not save reason that already exists in the database" do
    Reason.create(reason: "existing reason")
    reason = Reason.new(reason: "existing reason")

    assert_raises(ActiveRecord::RecordNotUnique) { reason.save }
  end
end
