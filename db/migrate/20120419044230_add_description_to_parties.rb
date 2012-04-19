class AddDescriptionToParties < ActiveRecord::Migration
  def self.up
    add_column :parties, :description, :string
  end

  def self.down
    remove_column :parties, :description
  end
end
