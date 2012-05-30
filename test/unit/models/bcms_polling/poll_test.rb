require 'test_helper'

module BcmsPolling
  class PollTest < ActiveSupport::TestCase

    test "should be able to create new block" do
      assert Poll.create!(:question=>"A?")
    end


    test "Should have responses" do
      p = Poll.create!(:question=>"What color?")

      p.responses << PollResponse.create!(:answer=>"Red")
      p.responses << PollResponse.create!(:answer=>"Blue")

      found = Poll.find(p.id)
      assert_equal 2, p.responses.size

    end

    test "Should have responses unpublished" do
      p = Poll.create!(:question=>"What color?")

      p.responses << PollResponse.create!(:answer=>"Red")
      p.responses << PollResponse.create!(:answer=>"Blue")

      found = Poll.find(p.id)
      found = found.as_of_draft_version
      assert_equal 2, p.responses.size

    end

    test "Binding responses as nested attributes for new object" do
      poll = Poll.create!(:question=>"Are you different?")
      poll.update_attributes({ :responses_attributes=>{"0"=>{"answer"=>"Answer 1"}}})
      assert_equal 1, poll.responses.size
      assert_equal 1, PollResponse.count

    end

    test "Delete a response" do
      poll = Poll.create!(:question=>"Are you different?")
      poll.update_attributes({ :responses_attributes=>{"0"=>{"answer"=>"Answer 1"}}})
      
      poll.update_attributes({ :responses_attributes=>{"0"=>{"id"=>PollResponse.first.id, "answer"=>"Answer 1", "_destroy" => "1"}}})

      assert_equal 0, poll.responses.size

    end
  end
end