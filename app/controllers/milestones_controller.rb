class MilestonesController < ApplicationController

  def new
    @milestone = Milestone.new
  end

  def create
  	@milestone = Milestone.new(milestone_params)
  	if @milestone.save 
  		flash[:success] = "New milestone created."
  		# redirect_to project_milestone_path(@project, @milestone)
      # redirect_to @project#index
      @milestone.checkpoints.create("name" => "Internal Review")
      redirect_to milestones_url
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
    @milestones = Milestone.all.order(:deadline)

  end

  def show
  	@milestone = Milestone.find(params[:id])
  end

  private

  	def milestone_params
  		params.require(:milestone).permit(:name, :deadline, :user_id, :estimate, :project_id, :milestone_type)
  	end
end
