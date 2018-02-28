class CreateUsersAttendanceLists < ActiveRecord::Migration[5.0]
  def change
    create_table :users_attendance_lists do |t|
      t.references :user, foreign_key: true
      t.references :attendance_list, foreign_key: true

      t.timestamps
    end
  end
end
