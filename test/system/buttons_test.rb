require "application_system_test_case"

class ButtonsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit buttons_url
  
    assert_selector "h1", text: "Buttons"
  end

  test "index shows all buttons" do
    visit buttons_url
    assert_text "definitely-uuid"
    assert_text "this-is-uuid"
  end

  test "creating button works" do
    visit buttons_url

    click_on "New Button"

    fill_in "Uuid", with: "legitimate-uuid"
    select("CI broken", from: "Reason")
    select("Ikram Saedi", from: "Developer")
    
    click_on "Create Button"
    assert_text "legitimate-uuid"
    assert_text "CI broken"
    assert_text "Ikram Saedi"
  end

  test "create button with no uuid doesnt work" do
    visit buttons_url
    click_on "New Button"
    click_on "Create Button"
    assert_text "Uuid can't be blank"
  end

  test "create button with existing uuid doesnt work" do
    visit buttons_url
    click_on "New Button"

    fill_in "Uuid", with: "definitely-uuid"

    click_on "Create Button"
    assert_text "Uuid already exists!"
  end

  test "editing the reason associated with button successfully" do
    visit buttons_url

    assert find_link("this-is-uuid")

    click_on "this-is-uuid" 
    click_on "Edit"

    select("Developer sad", from: "Reason")
    click_on "Update Button"

    assert_text "Developer sad"
  end

  test "editing the developer associated with button successfully" do
    visit buttons_url
    click_on "this-is-uuid" 
    click_on "Edit"

    select("Ikram Saedi", from: "Developer")
    click_on "Update Button"

    assert_text "Ikram Saedi"
  end

  test "editing button to be inactive is successful" do
    visit buttons_url
    click_on "this-is-uuid" 
    click_on "Edit"

    find("#button_is_active").check #this checkbox is actually labeled "Button is inactive:" for readability, which is why it appears to be the opposite of what it should

    click_on "Update Button"
    assert_text "Is active: false"
  end

end
