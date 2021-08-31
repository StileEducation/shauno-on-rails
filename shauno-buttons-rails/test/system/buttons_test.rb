require "application_system_test_case"

class ButtonsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit buttons_url
  
    assert_selector "h1", text: "Buttons"
  end

  test "creating button works" do
    visit buttons_url

    click_on "New Button"

    fill_in "Uuid", with: "legitimate-uuid"
    select("CI broken", from: "Reason")
    select("Ikram Saedi", from: "Developer")
    
    click_on "Create Button"
    assert_text "legitimate-uuid"
  end

  test "create button with no uuid doesnt work" do
    visit buttons_url
    click_on "New Button"
    click_on "Create Button"
    assert_text "Uuid can't be blank"
  end

  test "editing buttons successfully" do
    visit buttons_url

    assert find_link("this-is-uuid")

    click_on "this-is-uuid" 
    click_on "Edit"

    select("Developer sad", from: "Reason")
    click_on "Update Button"

    assert_text "Developer sad"
  end
end
