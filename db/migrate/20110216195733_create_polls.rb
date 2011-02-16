class CreatePolls < ActiveRecord::Migration
  def self.up
    create_content_table :polls do |t|
      t.string :name
      t.text :question
    end

    create_content_table :poll_responses do |t|
      t.text :answer
      t.integer :votes, :default => 0
      t.belongs_to :poll
    end
    
    ContentType.create!(:name => "Poll", :group_name => "Polling")
  end

  def self.down
    ContentType.delete_all(['name = ?', 'Poll'])
    CategoryType.all(:conditions => ['name = ?', 'Poll']).each(&:destroy)
    #If you aren't creating a versioned table, be sure to comment this out.
    drop_table :poll_response_versions
    drop_table :poll_responses
    drop_table :poll_versions
    drop_table :polls
  end
end
