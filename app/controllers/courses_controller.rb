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
      redirect_to courses_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to course_path, status: :see_other
  end

  private
  def course_params
    params.require(:course).permit(:title, :description, :is_free)
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
