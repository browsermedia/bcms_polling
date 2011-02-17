class PollResponse < ActiveRecord::Base
  belongs_to :poll
  validates_presence_of :answer
end