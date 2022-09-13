class CoursesController < ApplicationController
  before_action :authenticate_user!, only: %i[ show new create edit update destroy enroll ]
  before_action :set_course, only: %i[ show preview edit update destroy ]
  before_action :only_course_author, only: %i[ edit destroy ]

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
    if current_user.created_courses.exclude?(@course) && current_user.courses.exclude?(@course)
      render :preview
    end
  end

  def preview
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

  def enroll
    course = Course.find_by(id: params[:course_id])
    enrolledCourse = current_user.enrolled_courses.build(course_id: course.id)
    if enrolledCourse.valid? && enrolledCourse.save
      flash[:success] = "Enrolled successfully."
      redirect_to course
    else
      flash[:danger] = "You can not enroll your own course. You can enroll course only once."
      redirect_to courses_path
    end
  end

  private
  def only_course_author
    if current_user.created_courses.exclude?(@course)
      flash[:warning] = "You are not allowed to edit/delete this course."
      redirect_to courses_path
    end
  end

  def course_params
    params.require(:course).permit(:title, :recording, :description, :is_free, category_ids: [])
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end
end
