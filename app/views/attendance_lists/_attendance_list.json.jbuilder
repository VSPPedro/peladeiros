json.extract! attendance_list, :id, :openess, :closure, :name, :user_id, :created_at, :updated_at
json.url attendance_list_url(attendance_list, format: :json)