class AttendanceList < ApplicationRecord
  has_many :users_attendance_list
  has_many :user, through: :users_attendance_list
end
