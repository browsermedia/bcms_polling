class Poll < ActiveRecord::Base
  acts_as_content_block

  has_many :responses, :class_name => "PollResponse"
  accepts_nested_attributes_for :responses, :allow_destroy => true

  validates_presence_of :question

  def total_votes
    self.responses.inject(0) { |sum, r| sum += r.votes }
  end

  def name
    question
  end


  # Overridden to make sure nested attributes (i.e. poll responses) will correctly update.
  def update_attributes(attributes)
    unless attributes[:responses_attributes].blank?
      logger.debug "Forcing update of poll so updated answers are saved."
      self.updated_at = Time.now  # Force this block to update, regardless of what was submitted.

    else
      logger.debug "No poll attributes were submitted."
    end
    super(attributes)
  end

  # Overridden for purely debugging purposes.
  def different_from_last_draft?
    result = super
    logger.debug "Is this poll is different than the last draft? '#{result}'"
    result
  end

end
