require File.join(File.dirname(__FILE__), '/../../test_helper')

class PollResponseTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert PollResponse.create!(:answer=>"Non-blank")
  end
  
end