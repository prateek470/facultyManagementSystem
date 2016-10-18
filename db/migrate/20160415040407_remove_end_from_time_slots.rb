class RemoveEndFromTimeSlots < ActiveRecord::Migration
  def change
    remove_column :time_slots, :end, :datetime
  end
end
