class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|  
	t.integer :consultant_id
	t.string :name, :password
	t.boolean :in_use, :null => false, :default => false
	t.datetime :start_time	
	end
  end

  def self.down
    drop_table :accounts
  end
end
