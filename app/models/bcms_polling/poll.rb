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
    
    # This is a work around for bugs in CMS 3.5.x where updates to nested_associations:
    # 1. Do not count as 'changes' to the parent model (so they don't trigger a version save)
    # 2. Associated blocks don't save and/or delete themselves like nested_attributes says they should.
    #
    # Both of these will require changes to the core CMS to fix.
    def ensure_responses_save
      responses.each do |r|
        if r.changed?
          r.save 
        elsif r.marked_for_destruction?
          responses.delete(r) 
        end
      end
    end

  end
end