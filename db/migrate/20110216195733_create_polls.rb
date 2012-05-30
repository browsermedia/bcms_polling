class CreatePolls < ActiveRecord::Migration
  def self.up
    create_content_table :polls do |t|
      t.string :name
      t.text :question
    end

    create_table :poll_responses do |t|
      t.text :answer
      t.integer :votes, :default => 0
      t.belongs_to :poll
    end
    
  end

  def self.down
    drop_table :poll_responses
    drop_table :poll_versions
    drop_table :polls
  end
end
