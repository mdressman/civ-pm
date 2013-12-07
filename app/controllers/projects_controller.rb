class ProjectsController < ApplicationController

    def new
        @client = Client.find(params[:client_id])
        @project = Project.new
    end

    def create
        @client = Client.find(params[:client_id])
        @project = Project.new(project_params)
        if @project.save 
  		    flash[:success] = "New project created."
            create_milestones
            create_assets
            redirect_to root_url
        else
  		    render 'new'
        end
    end

    def update
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:id])
        if @project.update_attributes(project_params)
            flash[:success] = "Project updated."
            redirect_to root_url
        else
            render 'edit'
        end
    end

    def edit
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:id])
    end

    def destroy
        Project.find(params[:id]).destroy
        flash[:success] = "Project removed."
        redirect_to root_url
    end

    def index
        @projects = Project.all.order(:end_date)
    end

    def show
        @client = Client.find(params[:client_id])
        @project = Project.find(params[:id])
    end


    private

        def project_params
  		    params.require(:project).permit(:name, :start_date, :end_date, :estimate, :user_id, :client_id, :project_type)
        end

        def create_milestones
            case @project.project_type
                when "Print Design"
                    Milestone.create("name" => "Internal Review", "estimated_date" => set_estimated_deadline(3), "estimated_time" => 8, "client_id" => @client.id, "project_id" => @project.id)
                when "Interface Design"
                    Milestone.create("name" => "Internal Review", "estimated_date" => set_estimated_deadline(3), "estimated_time" => 8, "client_id" => @client.id, "project_id" => @project.id)
                when "Web Development"
                    Milestone.create("name" => "Internal Review", "estimated_date" => set_estimated_deadline(3), "estimated_time" => 8, "client_id" => @client.id, "project_id" => @project.id)
            end
        end

        def set_estimated_deadline(distance)
            if @project.end_date
                @project.end_date - distance.days
            else
                nil
            end
        end

        def create_assets
            case @project.project_type
                when "Print Design"
                    Asset.create("name" => "Content", "project_id" => @project.id)
                when "Interface Design"
                    Asset.create("name" => "Website copy", "project_id" => @project.id)
                    Asset.create("name" => "Website images", "project_id" => @project.id)
                when "Web Development"
                    Asset.create("name" => "Domain / Hosting info", "project_id" => @project.id)
            end
        end

    
end
