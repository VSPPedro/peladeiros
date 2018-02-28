class CreateAttendanceLists < ActiveRecord::Migration[5.0]
  def change
    create_table :attendance_lists do |t|
      t.datetime :openess
      t.datetime :closure
      t.string :name
      t.string :local
      t.datetime :start
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
