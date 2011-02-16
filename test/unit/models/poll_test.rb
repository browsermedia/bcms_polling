require File.join(File.dirname(__FILE__), '/../../test_helper')

class PollTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert Poll.create!
  end
  
end