class Poll < ActiveRecord::Base
  acts_as_content_block

  has_many :responses, :class_name => "PollResponse"

  validates_presence_of :question

  def initialize(attributes=nil)
    super

    self.build_responses unless self.responses
  end

  accepts_nested_attributes_for :responses, :allow_destroy => true

  def total_votes
    self.responses.inject(0) { |sum, r| sum += r.votes }
  end

  def name
    question
  end


end
