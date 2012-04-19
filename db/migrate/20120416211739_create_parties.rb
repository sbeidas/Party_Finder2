class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.string :title
      t.string :owner
      t.timestamp :start_time
      t.timestamp :end_time	

      t.int :location_id 	
 
      t.timestamps
    
    end
  end

  def self.down
    drop_table :parties
  end
end
  