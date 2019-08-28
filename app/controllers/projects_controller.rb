class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
  end

  def edit; end

  def create
  end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project updated'
      redirect_to project_path(@project)
    else
      render 'update'
    end
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require('project').permit('name', 'description')
  end
end
