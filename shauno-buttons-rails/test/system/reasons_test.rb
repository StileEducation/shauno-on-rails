require "application_system_test_case"

class ReasonsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit reasons_url
  
    assert_selector "h1", text: "Reasons"
  end

  test "index shows all reasons" do
    visit reasons_url
    assert_text "CI broken"
    assert_text "Developer sad"
  end

  test "creating reason works" do
    visit reasons_url
    click_on "New Reason"
    fill_in "Reason", with: "this is a new reason"
    click_on "Create Reason"
    assert_text "this is a new reason"
  end

  test "creating empty reason errors" do
    visit reasons_url
    click_on "New Reason"
    click_on "Create Reason"
    assert_text "Reason can't be blank"
  end

  test "creating reason that already exists errors" do
    visit reasons_url
    click_on "New Reason"
    fill_in "Reason", with: "CI broken"
    click_on "Create Reason"
    assert_text "Reason already exists!"
  end
end
