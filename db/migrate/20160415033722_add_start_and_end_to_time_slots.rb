class AddStartAndEndToTimeSlots < ActiveRecord::Migration
  def change
    add_column :time_slots, :start, :datetime
    remove_column :time_slots, :end
  end
end
