require "test_helper"


class EventTest < ActiveSupport::TestCase
  test "does not save event to database with missing parameters" do
    event = Event.new
    assert event.save, "saved event without event info"
  end

  test "saves event successfully with all required parameters" do
    event = Event.new(button_id: 1, developer_id: 1, reason_id: 1, timestamp: "2021-08-10 07:19:45")
    assert event.save, "did not save event successfully"
  end

  test "does not save event without developer_id" do
    event = Event.new(button_id: 1, reason_id: 1, timestamp: "2021-08-10 07:19:46")
    assert_not event.save, "did save event without developer_id"
  end

  test "does not save event without reason_id" do
    event = Event.new(button_id: 1, developer_id: 1, timestamp: "2021-08-10 07:19:47")
    assert_not event.save, "did save event without reason_id"
  end

  test "does not save event without button_id" do
    event = Event.new(developer_id: 1, reason_id: 1, timestamp: "2021-08-10 07:19:46")
    assert_not event.save, "did save event without button_id"
  end

  test "does not save event without timestamp" do
    event = Event.new(button_id: 1, reason_id: 1, developer_id: 1)
    assert_not event.save, "did save event without timestamp"
  end
end
