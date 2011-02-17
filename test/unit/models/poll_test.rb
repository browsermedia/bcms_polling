require File.join(File.dirname(__FILE__), '/../../test_helper')

class PollTest < ActiveSupport::TestCase

  test "should be able to create new block" do
    assert Poll.create!(:question=>"A?")
  end


  test "Should have responses" do
    p = Poll.create!(:question=>"What color?")

    p.responses << PollResponse.create!(:answer=>"Red", :publish_on_save=>true)
    p.responses << PollResponse.create!(:answer=>"Blue", :publish_on_save=>true)

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

end