class DeliverablesController < ApplicationController
	def new
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @deliverable = Deliverable.new
    end

    def create
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @deliverable = Deliverable.new(deliverable_params)
        if @deliverable.save 
  		    flash[:success] = "New deliverable created."
  		    redirect_to root_url
        else
  		    render 'new'
        end
    end

    def update
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @deliverable = Deliverable.find(params[:id])
        if @deliverable.update_attributes(deliverable_params)
            flash[:success] = "Deliverable updated."
            redirect_to root_url
        else
            render 'edit'
        end
    end

    def edit
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @deliverable = Deliverable.find(params[:id])
    end

    def destroy
        Deliverable.find(params[:id]).destroy
        flash[:success] = "Deliverable removed."
        redirect_to root_url
    end

    def index
        @deliverables = Deliverable.all
    end

    def show
        @project = Project.find_by(params[:project_id])
        @client = Client.find_by(params[:client_id])
        @deliverable = Deliverable.find(params[:id])
    end

    def complete
        dv = Deliverable.find(params[:id])
        dv.update_attributes(
            :complete => !dv.complete,
            :completed_date => DateTime.now
            )
        flash[:success] = dv.name + " marked complete."
        redirect_to root_url
    end

    def bulk_complete
        params[:deliverable_ids].each do |check|
            deliverable = Deliverable.find(check)
            deliverable.update_attributes(:complete => !deliverable.complete, :completed_date => DateTime.now)
        end
        respond_to do |format|
            format.html { redirect_to root_url }
            format.js
        end
    end


    private

      	def deliverable_params
      		params.require(:deliverable).permit(:name, :notes, :completed_date, :complete, :user_id, :project_id, :link)
      	end

      	# def set_project
      	# 	@project = Project.find_by(:id, params[:project_id])
      	# end
end
