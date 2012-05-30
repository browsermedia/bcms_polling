module BcmsPolling
  class PollResponse < ActiveRecord::Base
    belongs_to :poll
    validates_presence_of :answer
  
    attr_accessible :answer
  
  end
end