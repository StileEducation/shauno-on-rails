require "test_helper"

class DeveloperTest < ActiveSupport::TestCase
  test "successfully saves developer with name" do
    developer = Developer.new(name: "Shaun O'Keefe")
    assert developer.save, "it did not successfully save developer with a name"
  end

  test "does not save developer without name" do
    developer = Developer.new
    assert_not developer.save, "it successfully saved a developer without a name"
  end
end
