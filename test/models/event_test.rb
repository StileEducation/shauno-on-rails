require "test_helper"


class EventTest < ActiveSupport::TestCase
  test "does not save event to database with missing parameters" do
    event = Event.new
    assert_not event.save, "saved event without event info"
  end

  test "saves event successfully with all required parameters" do
    button = Button.find_by(uuid: "definitely-uuid")
    button_id = button.id
    reason_id = button.current_reason.id
    developer_id = button.current_developer.id

    event = Event.new(button_id: button_id, developer_id: developer_id, reason_id: reason_id, timestamp: "2021-08-10 07:19:45")
    assert event.save, "did not save event successfully"
  end

  test "does not save event without developer_id" do
    button = Button.find_by(uuid: "definitely-uuid")
    button_id = button.id
    reason_id = button.current_reason.id
    developer_id = button.current_developer.id

    event = Event.new(button_id: 1, reason_id: 1, timestamp: "2021-08-10 07:19:46")
    assert_not event.save, "did save event without developer_id"
  end

  test "does not save event without reason_id" do
    button = Button.find_by(uuid: "definitely-uuid")
    button_id = button.id
    reason_id = button.current_reason.id
    developer_id = button.current_developer.id

    event = Event.new(button_id: 1, developer_id: 1, timestamp: "2021-08-10 07:19:47")
    assert_not event.save, "did save event without reason_id"
  end

  test "does not save event without button_id" do
    button = Button.find_by(uuid: "definitely-uuid")
    button_id = button.id
    reason_id = button.current_reason.id
    developer_id = button.current_developer.id

    event = Event.new(developer_id: 1, reason_id: 1, timestamp: "2021-08-10 07:19:46")
    assert_not event.save, "did save event without button_id"
  end

  test "does not save event without timestamp" do
    button = Button.find_by(uuid: "definitely-uuid")
    button_id = button.id
    reason_id = button.current_reason.id
    developer_id = button.current_developer.id

    event = Event.new(button_id: 1, reason_id: 1, developer_id: 1)
    assert_not event.save, "did save event without timestamp"
  end

  test "event can be invalidated" do
    event = Event.find_by(timestamp: "2021-08-10 01:05:20")

    event.update(to_ignore: true)

    assert event.save, "event was not marked as ignored"
  end
end
