class StudentsController < ApplicationController

  before_action :require_login

  def require_login
    if !current_student 
      redirect_to login_path, :notice => 'You must be logged in to visit this page.'
    end
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

end
