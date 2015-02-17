class ClubsController < ApplicationController

  before_action :require_login


  def require_login
    if !current_student
      redirect_to login_path, :notice => 'You must be logged in to visit this page.'
    end
  end

  def index
    @clubs = current_student.clubs
  end

  def show
    @club = Club.find(params[:id])
    if !@club.students.find_by_id(current_student.id)
      render 'public/403.html'
    end
  end

end
