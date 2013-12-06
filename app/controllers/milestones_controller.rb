class MilestonesController < ApplicationController

    def new
        @project = Project.find(params[:project_id])
        @milestone = Milestone.new
    end

    def create
        @project = Project.find(params[:project_id])
        @milestone = Milestone.new(milestone_params)
        if @milestone.save 
  		    flash[:success] = "New milestone created."
            create_checkpoints
            create_assets
            redirect_to root_url
        else
  		    render 'new'
        end
    end

    def update
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:id])
        if @milestone.update_attributes(milestone_params)
            flash[:success] = "Milestone updated."
            redirect_to root_url
        else
            render 'edit'
        end
    end

    def edit
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
        @project = Project.find(params[:project_id])
        @milestone = Milestone.find(params[:id])
    end


    private

        def milestone_params
  		    params.require(:milestone).permit(:name, :start_date, :end_date, :estimate, :user_id, :project_id, :milestone_type)
        end

        def create_checkpoints
            case @milestone.milestone_type
                when "Print Design"
                    Checkpoint.create("name" => "Internal Review", "end_date" => set_end_date(3), "project_id" => @project.id, "milestone_id" => @milestone.id)
                    Checkpoint.create("name" => "Refinements", "start_date" => set_end_date(2), "end_date" => @milestone.end_date - 1.day, "project_id" => @project.id, "milestone_id" => @milestone.id)
                when "Interface Design"
                    Checkpoint.create("name" => "Internal Review", "end_date" => set_end_date(3), "project_id" => @project.id, "milestone_id" => @milestone.id)
                    Checkpoint.create("name" => "Refinements", "start_date" => set_end_date(2), "end_date" => @milestone.end_date - 1.day, "project_id" => @project.id, "milestone_id" => @milestone.id)
                when "Web Development"
                    Checkpoint.create("name" => "Set up framework", "end_date" => set_end_date(30), "project_id" => @project.id, "milestone_id" => @milestone.id)
                    Checkpoint.create("name" => "Set up staging site", "start_date" => set_end_date(14), "end_date" => @milestone.end_date - 14.day, "project_id" => @project.id, "milestone_id" => @milestone.id)
                    Checkpoint.create("name" => "Testing", "start_date" => set_end_date(7), "end_date" => @milestone.end_date - 7.day, "project_id" => @project.id, "milestone_id" => @milestone.id)
            end
        end

        def set_end_date(distance)
            if @milestone.end_date
                @milestone.end_date - distance.days
            else
                nil
            end
        end

        def create_assets
            case @milestone.milestone_type
                when "Print Design"
                    Asset.create("name" => "Content", "milestone_id" => @milestone.id)
                when "Interface Design"
                    Asset.create("name" => "Website copy", "milestone_id" => @milestone.id)
                    Asset.create("name" => "Website images", "milestone_id" => @milestone.id)
                when "Web Development"
                    Asset.create("name" => "Domain / Hosting info", "milestone_id" => @milestone.id)
            end
        end

    
end
