class MilestonesController < ApplicationController
	# before_action :set_project
  
    def new
        @client = Client.find(params[:client_id])
        @project = Project.find_by(params[:project_id])
        @milestone = Milestone.new
    end

    def create
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @milestone = Milestone.new(milestone_params)
        if @milestone.save 
  		    flash[:success] = "New milestone created."
            @milestone.insert_at(Milestone.find(params[:manual_position]['id'].to_i).position)
  		    redirect_to root_url
        else
  		    render 'new'
        end
    end

    def update
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:id])
        if @milestone.update_attributes(milestone_params)
            flash[:success] = "Milestone updated."
            @milestone.insert_at(Milestone.find(params[:manual_position]['id'].to_i).position)
            redirect_to root_url
        else
            render 'edit'
        end
    end

    def edit
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:id])
    end

    def destroy
        Milestone.find(params[:id]).destroy
        flash[:success] = "Milestone removed."
        redirect_to root_url
    end

    def index
        @milestones = Milestone.all.order(:end_date)
    end

    def show
        @client = Client.find_by(params[:client_id])
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:id])
    end

    def complete
        params[:milestone_ids].each do |check|
            cp = Milestone.find(check)
            cp.update_attributes(:complete => !cp.complete)
        end
        flash[:success] = "Milestones marked complete!"
        respond_to do |format|
            format.html { redirect_to root_url }
            format.js
        end
    end

    def bulk_delete
        params[:milestone_ids].each do |check|
            cp = Milestone.find(check)
            cp.destroy
        end
        flash[:success] = "Milestones deleted!"
        redirect_to root_url
    end


    private

      	def milestone_params
      		params.require(:milestone).permit(:name, :estimated_date, :actual_date, :estimated_time, :actual_time, :notes, :project_id, :client_id, :manual_position_id, :phase)
      	end



      	# def set_project
      	# 	@project = Project.find_by(:id, params[:project_id])
      	# end

end
