require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit events_url
  
    assert_selector "h1", text: "Events"
  end

  test "events correctly displayed on page" do
    visit events_url
    assert_text "definitely-uuid"
    assert_text "2021-08-10 01:05:20"
    assert_text "this-is-uuid"
    assert_text "2021-08-10 01:05:15"
  end

  test "creating event with valid inputs works" do
    visit events_url
    click_on "New Event"
    time = Time.now.utc.strftime("%Y-%m-%d %H:%M:%S")
    select("this-is-uuid", from: "UUID of Button")
    click_on "Create Event"

    assert_text "this-is-uuid"
    assert_text time
    assert_text "Developer sad"
    assert_text "Dev McKenzie"
  end

  test "can invalidate an existing event" do
    visit events_url

    event = Event.all.first

    link = find_link("Show", {href: "/events/#{event.id}"})
    link.click

    accept_alert do
      click_on "Ignore this event"
    end

    assert_no_text event.timestamp
  end

end
