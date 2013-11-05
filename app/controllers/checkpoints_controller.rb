class CheckpointsController < ApplicationController
	# before_action :set_milestone
  
    def new
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find_by(params[:milestone_id])
        @checkpoint = Checkpoint.new
    end

    def create
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:milestone_id])
        @checkpoint = Checkpoint.new(checkpoint_params)
        if @checkpoint.save 
  		    flash[:success] = "New checkpoint created."
  		    redirect_to root_url
        else
  		    render 'new'
        end
    end

    def update
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:milestone_id])
        @checkpoint = Checkpoint.find(params[:id])
        if @checkpoint.update_attributes(checkpoint_params)
            flash[:success] = "Checkpoint updated."
            redirect_to @checkpoint
        else
            render 'edit'
        end
    end

    def edit
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:milestone_id])
        @checkpoint = Checkpoint.find(params[:id])
    end

    def destroy
        Checkpoint.find(params[:id]).destroy
        flash[:success] = "Checkpoint removed."
        redirect_to milestone_checkpoints_url
    end

    def index
        @checkpoints = Checkpoint.all.order(:end_date)
    end

    def show
        @project = Project.find_by(params[:project_id])
        @milestone = Milestone.find(params[:milestone_id])
        @checkpoint = Checkpoint.find(params[:id])
    end

    def complete
        params[:checkpoint_ids].each do |check|
            cp = Checkpoint.find(check)
            cp.update_attributes(:complete => !cp.complete)
        end
        respond_to do |format|
            format.html { redirect_to root_url }
            format.js
        end
    end


    private

      	def checkpoint_params
      		params.require(:checkpoint).permit(:name, :start_date, :end_date, :esimate, :user_id, :milestone_id, :project_id)
      	end

      	# def set_milestone
      	# 	@milestone = Milestone.find_by(:id, params[:milestone_id])
      	# end

end
