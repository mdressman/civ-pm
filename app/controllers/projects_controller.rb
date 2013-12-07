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
                when "Branding 1"
                    branding1_milestones = [
                                                ['Kickoff', 1, 3],
                                                ['Branding Exercise', 2, 2],
                                                ['Mood Board 1 Design', 3, 4],
                                                ['Mood Board 1 Internal Review', 3, 1],
                                                ['Mood Board 1 Refinement', 4, 2],
                                                ['Mood Board 1 Presentation', 4, 2],
                                                ['Sketches', 5, 20],
                                                ['Sketches Internal Review', 5, 2],
                                                ['Mood Board 2 Design', 5, 4],
                                                ['Mood Board 2 Internal Review', 6, 2],
                                                ['Mood Board 2 Refinement', 6, 2],
                                                ['Mood Board 2 Presentation', 6, 2],
                                                ['Logo Round 1 Design', 6, 20],
                                                ['Logo Round 1 Internal Review', 7, 2],
                                                ['Logo Round 1 Refinement', 8, 2],
                                                ['Logo Round 1 Presentation', 8, 2],
                                                ['Logo Round 2 Design', 9, 16],
                                                ['Logo Round 2 Internal Review', 10, 2],
                                                ['Logo Round 2 Refinement', 10, 2],
                                                ['Logo Round 2 Presentation', 10, 2],
                                                ['Send Final Logo Package', 11, 8],
                                                ['Style Guide Development', 11, 16],
                                                ['Style Guide Internal Review', 12, 2],
                                                ['Style Guide Refinement', 12, 2],
                                                ['Send Style Guide', 12, 2]
                                        ]
                    branding1_milestones.each do |ms| 
                        Milestone.create("name" => ms[0], "estimated_date" => set_estimated_deadline(ms[1]), "estimated_time" => ms[2], "client_id" => @client.id, "project_id" => @project.id)
                    end
                    # Milestone.create("name" => "Internal Review", "estimated_date" => set_estimated_deadline(3), "estimated_time" => 8, "client_id" => @client.id, "project_id" => @project.id)

                when "Branding 2"
                
                when "Print 1"

                when "Print 2"

                when "Web Design 1"

                when "Web Design 2"
                
                when "Web Development 1"

                when "Web Development 2"    
                
            end
        end

        def set_estimated_deadline(distance)
            if @project.start_date
                @project.start_date + distance.weeks
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
