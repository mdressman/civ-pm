class AssetsController < ApplicationController
	def new
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @asset = Asset.new
    end

    def create
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @asset = Asset.new(asset_params)
        if @asset.save 
  		    flash[:success] = "New asset created."
  		    redirect_to root_url
        else
  		    render 'new'
        end
    end

    def update
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @asset = Asset.find(params[:id])
        if @asset.update_attributes(asset_params)
            flash[:success] = "Asset updated."
            redirect_to root_url
        else
            render 'edit'
        end
    end

    def edit
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:project_id])
        @asset = Asset.find(params[:id])
    end

    def destroy
        Asset.find(params[:id]).destroy
        flash[:success] = "Asset removed."
        redirect_to root_url
    end

    def index
        @assets = Asset.all
    end

    def show
        @project = Project.find_by(params[:project_id])
        @client = Client.find_by(params[:client_id])
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
      		params.require(:asset).permit(:name, :notes, :expected_date, :received_date, :project_id, :link)
      	end

      	# def set_project
      	# 	@project = Project.find_by(:id, params[:project_id])
      	# end
end
