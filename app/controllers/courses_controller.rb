class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  def index
    @courses = Course.all()
  end

  def new
    @course = Course.new()
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      flash[:success] = "Course added successfully."
      redirect_to courses_path
    else
      flash.now[:danger] = "Error. Course not added."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:success] = "Course updated successfully."
      redirect_to(@course)
    else
      flash.now[:danger] = "Error. Course not updated."
      render :edit
    end
  end

  def destroy
    @course.destroy
    flash[:success] = "Course deleted successfully."
    redirect_to courses_path, status: :see_other
  end

  private
  def course_params
    params.require(:course).permit(:title, :description, :is_free)
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
