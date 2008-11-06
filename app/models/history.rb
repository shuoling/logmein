class History < ActiveRecord::Base
	belongs_to :consultant
	belongs_to :account
	
        cattr_reader :per_page
        @@per_page = 20
  
	def self.add_record_for(account_to_add)
		return false unless account_to_add.is_a? Account
		history_record = History.new
		history_record.consultant_id =  account_to_add.consultant_id
		history_record.account_id = account_to_add.id
		history_record.start_time = account_to_add.start_time
		history_record.save
		return true
		
		
	end
        
     
  

	
end
