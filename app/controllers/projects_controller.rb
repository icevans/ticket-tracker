class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: %i[index show]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.create(project_params)

    if @project.save
      flash[:notice] = 'Project saved'
      redirect_to projects_path
    else
      render 'new'
    end
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
    @project.destroy
    flash[:notice] = 'Project deleted'
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require('project').permit('name', 'description')
  end
end
