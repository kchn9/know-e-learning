class CoursesController < ApplicationController
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]
  before_action :set_course, only: %i[ show edit update destroy ]

  def index
    @courses = Course.all()
    @categories = Category.all()
    @should_render_categories = true
  end

  def new
    @course = Course.new()
    @categories = Category.all()
  end

  def create
    @categories = Category.all()
    @course = current_user.created_courses.create(course_params)
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
    @categories = Category.all()
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
    params.require(:course).permit(:title, :recording, :description, :is_free, category_ids: [])
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
