class CheckpointsController < ApplicationController
	# before_action :set_milestone
  
    def new
        @milestone = Milestone.find_by(params[:milestone_id])
        @checkpoint = Checkpoint.new
    end

    def create
        @milestone = Milestone.find_by(params[:milestone_id])
        @checkpoint = Checkpoint.new(checkpoint_params)
        if @checkpoint.save 
  		    flash[:success] = "New checkpoint created."
  		    redirect_to milestone_checkpoint_path(@milestone, @checkpoint)
            # redirect_to @project#index
            # redirect_to @checkpoints
        else
  		    render 'new'
        end
    end

    def update
        if @checkpoint.update_attributes(checkpoint_params)
            flash[:success] = "Checkpoint updated."
            redirect_to @checkpoint
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        Checkpoint.find(params[:id]).destroy
        flash[:success] = "Checkpoint removed."
        redirect_to milestone_checkpoints_url
    end

    def index
        @checkpoints = Checkpoint.all.order(:end)
    end

    def show
        @milestone = Milestone.find_by(params[:milestone_id])
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
      		params.require(:checkpoint).permit(:name, :start, :end, :esimate, :user_id, :milestone_id)
      	end

      	# def set_milestone
      	# 	@milestone = Milestone.find_by(:id, params[:milestone_id])
      	# end

end
