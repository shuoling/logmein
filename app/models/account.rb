
class Account < ActiveRecord::Base

        belongs_to :consultant
	has_many :histories 
        
        cattr_reader :per_page
        @@per_page = 10
  
	validates_presence_of :name
	validates_presence_of :password
	validates_uniqueness_of :name
	
	def add_consultant(consultant_to_add)
                return false if self.in_use == true
		return false unless consultant_to_add.is_a? Consultant
		self.consultant = consultant_to_add
		self.start_time = Time.now
		self.in_use = true
		if self.save
		History.add_record_for(self)
		end
		return true 
	end
	
	def remove_consultant
		
		if hist = self.histories.find(:first, :conditions => ["consultant_id = ? and end_time is null", self.consultant_id ])
			hist.end_time = Time.now
			hist.save
		end
		
		self.consultant = nil	
		self.start_time = nil
		self.in_use = false
		self.save

		return true
	end	
	
end
