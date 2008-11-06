class CreateHistories < ActiveRecord::Migration
  def self.up
    create_table :histories do |t|
	t.integer :consultant_id, :account_id
	t.datetime :start_time, :end_time
    end
  end

  def self.down
    drop_table :histories
  end
end
