class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :new, :edit, :create]

  def index
    @projects = Project.all
  end

  def show; end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
