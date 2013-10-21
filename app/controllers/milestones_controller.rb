class MilestonesController < ApplicationController
  before_action :set_project
  
  before_action :set_milestone, only: [:show]

  def new
  	@project = Project.find(params[:project_id])
    @milestone = Milestone.new
  end

  def create
  	@milestone = Milestone.new(milestone_params)
  	if @milestone.save 
  		flash[:success] = "New milestone created."
  		# redirect_to project_milestone_path(@project, @milestone)
      redirect_to @project#index
  	else
  		render 'new'
  	end
  end

  def update
  	if @milestone.update_attributes(milestone_params)
		  flash[:success] = "Milestone updated."
		  redirect_to @milestone
	  else
		  render 'edit'
	  end
  end

  def edit
  end

  def destroy
  	Milestone.find(params[:id]).destroy
    flash[:success] = "Milestone removed."
    redirect_to milestones_url
  end

  def index
    # @milestones = Milestone.find_by(:project_id, params[:project_id])
    @milestones = @project.milestones

  end

  def show
  	@milestone = Milestone.find(params[:id])
  end

  private

  	def milestone_params
  		params.require(:milestone).permit(:name, :deadline, :user_id, :estimate).merge(:project_id => params[:project_id])
  	end

    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    def set_project 
      @project = Project.find(params[:project_id])
    end
end
