class ProjectsController < ApplicationController
  
  def new
  	@project = Project.new
  end

  def create
  	@project = Project.new(project_params)
  	if @project.save 
  		flash[:success] = "New project created."
  		redirect_to projects_url
  	else
  		render 'new'
  	end
  end

  def update
  	if @project.update_attributes(project_params)
		flash[:success] = "Project updated."
		redirect_to @project
	else
		render 'edit'
	end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def destroy
  	Project.find(params[:id]).destroy
    flash[:success] = "Project removed."
    redirect_to projects_url
  end

  def index
  	@projects = Project.paginate(page: params[:page])
  end

  def show
  	@project = Project.find(params[:id])
    @milestones = @project.milestones
  end

  private

  	def project_params
  		params.require(:project).permit(:name)
  	end


end
