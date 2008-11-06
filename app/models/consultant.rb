class Consultant < ActiveRecord::Base
	has_one :account
	has_one :history
	validates_presence_of :name
	validates_uniqueness_of :name
        
        cattr_reader :per_page
        @@per_page = 5
end
