class EventAttendancesController < ApplicationController
  def new
    @new_attendance = current_user.event_attendances.build(event_id: params[:event_id])
    if @new_attendance.save
      flash.notice = "#{current_user[:name]} is attending the event!"
      redirect_to root_path
    else
      flash.alert = "Event attendance failed"
      redirect_to root_path
    end
  end

end
