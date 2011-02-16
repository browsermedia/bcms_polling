class PollResponse < ActiveRecord::Base
  acts_as_content_block

  belongs_to :poll
  validates_presence_of :answer

  def self.default_order
    "votes desc"
  end

  def self.columns_for_index
    [ {:label => "Answer", :method => :name, :order => "answer" },
      {:label => "Votes", :method => :votes, :order => "votes" } ]
  end

end