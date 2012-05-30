require 'cms/upgrades/v3_5_0'
class V110 < ActiveRecord::Migration
  def change
    v3_5_0_apply_namespace_to_block("BcmsPolling", "Poll")
    rename_table :poll_responses, :bcms_polling_poll_responses 
    
  end
end
