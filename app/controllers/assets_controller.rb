class AssetsController < ApplicationController
	def new
        @project = Project.find_by(params[:project_id])
        @milestone = Milestone.find_by(params[:milestone_id])
        @asset = Asset.new
    end

    def create
        @project = Project.find_by(params[:project_id])
        @milestone = Milestone.find_by(params[:milestone_id])
        @asset = Asset.new(asset_params)
        if @asset.save 
  		    flash[:success] = "New asset created."
  		    redirect_to project_milestone_asset_path(@project, @milestone, @asset)
        else
  		    render 'new'
        end
    end

    def update
        if @asset.update_attributes(asset_params)
            flash[:success] = "Asset updated."
            redirect_to @asset
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        Asset.find(params[:id]).destroy
        flash[:success] = "Asset removed."
        redirect_to project_milestone_assets_url
    end

    def index
        @assets = Asset.all
    end

    def show
        @milestone = Milestone.find_by(params[:milestone_id])
        @project = Project.find_by(params[:milestone_id])
        @asset = Asset.find(params[:id])
    end

    def receive
        params[:asset_ids].each do |check|
            asset = Asset.find(check)
            asset.update_attributes(:received => !asset.received, :received_date => DateTime.now)
        end
        respond_to do |format|
            format.html { redirect_to root_url }
            format.js
        end
    end


    private

      	def asset_params
      		params.require(:asset).permit(:name, :notes, :expected_daet, :received_date, :milestone_id)
      	end

      	# def set_milestone
      	# 	@milestone = Milestone.find_by(:id, params[:milestone_id])
      	# end
end
