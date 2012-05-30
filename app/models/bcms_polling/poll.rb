module BcmsPolling
  class Poll < ActiveRecord::Base
    acts_as_content_block

    has_many :responses, :class_name => "PollResponse"
    accepts_nested_attributes_for :responses, :allow_destroy => true
    attr_accessible :responses_attributes
    validates_presence_of :question

    after_validation :ensure_responses_save
    
    def total_votes
      self.responses.inject(0) { |sum, r| sum += r.votes }
    end

    def name
      question
    end

    private
    def ensure_responses_save
      logger.warn "Force save responses #{responses}"    
      
      responses.each do |r|
        r.save if r.changed?
      end
    end

  end
end