class ClientsController < ApplicationController
  
    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.save 
  		    flash[:success] = "New client created."
  		    redirect_to new_client_project_path(:client_id => @client.id)
        else
  		    render 'new'
        end
    end

    def update
        @client = Client.find(params[:id])
        if @client.update_attributes(client_params)
            flash[:success] = "Client updated."
            redirect_to root_url
        else
            render 'edit'
        end
    end

    def edit
        @client = Client.find(params[:id])
    end

    def destroy
        Client.find(params[:id]).destroy
        flash[:success] = "Client removed."
        redirect_to root_url
    end

    def index
        @clients = Client.paginate(page: params[:page])
    end

    def show
        @client = Client.find(params[:id])
        @projects = @client.projects
    end

    private

      	def client_params
      		params.require(:client).permit(:name)
      	end

end