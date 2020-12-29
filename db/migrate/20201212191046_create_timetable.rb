class CreateTimetable < ActiveRecord::Migration[6.0]
  def change
    create_table :timetables do |t|
      t.string :group
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday

      t.timestamps
    end
  end
end
