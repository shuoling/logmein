class CreateConsultants < ActiveRecord::Migration
  def self.up
    create_table :consultants do |t|
	t.string :name
	t.timestamp
       end
  end

  def self.down
    drop_table :consultants
  end
end
