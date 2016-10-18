class AddEndTimeToTimeSlots < ActiveRecord::Migration
  def change
    add_column :time_slots, :end_time, :datetime
  end
end
