class VisitorsController < ApplicationController
  
  def index
    @approved_users_count = User.all.select{ |user| user.approved == true }.count
    @pending_users_count = User.all.select{ |user| user.approved == false }.count
  end
end
