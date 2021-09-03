require "application_system_test_case"

class DevelopersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit developers_url
  
    assert_selector "h1", text: "Developers"
  end

  test "index shows all developers" do
    visit developers_url
    assert_text "Ikram Saedi"
    assert_text "Dev McKenzie"
  end

  test "creating developer works" do
    visit developers_url
    click_on "New Developer"
    fill_in "Name", with: "Developer Name"
    click_on "Create Developer"
    assert_text "Developer Name"
  end

  test "creating empty developer errors" do
    visit developers_url
    click_on "New Developer"
    click_on "Create Developer"
    assert_text "Name can't be blank"
  end

end
