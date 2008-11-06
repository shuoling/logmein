class CreateAdminaccs < ActiveRecord::Migration
  def self.up
    create_table :adminaccs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :adminaccs
  end
end
