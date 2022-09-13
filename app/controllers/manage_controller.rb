class ManageController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.created_courses
  end
end
