require 'test_helper'

module BcmsPolling
  class PollResponseTest < ActiveSupport::TestCase

    test "should be able to create new block" do
      assert PollResponse.create!(:answer=>"Non-blank")
    end
  
  end
end