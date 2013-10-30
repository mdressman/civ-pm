class MilestonesController < ApplicationController

    def new
        @milestone = Milestone.new
    end

    def create
        @milestone = Milestone.new(milestone_params)
        if @milestone.save 
  		    flash[:success] = "New milestone created."
            create_checkpoints
            redirect_to milestones_url
        else
  		    render 'new'
        end
    end

    def update
        if @milestone.update_attributes(milestone_params)
            flash[:success] = "Milestone updated."
            redirect_to @milestone
        else
            render 'edit'
        end
    end

    def edit
    end

    def destroy
        Milestone.find(params[:id]).destroy
        flash[:success] = "Milestone removed."
        redirect_to milestones_url
    end

    def index
        @milestones = Milestone.all.order(:end)
    end

    def show
        @milestone = Milestone.find(params[:id])
    end


    private

        def milestone_params
  		    params.require(:milestone).permit(:name, :start, :end, :estimate, :user_id, :project_id, :milestone_type)
        end

        def create_checkpoints
            if @milestone.end
                case @milestone.milestone_type
                when "design_print"
                    @milestone.checkpoints.create("name" => "Internal Review", "end" => @milestone.end - 3.days)
                    @milestone.checkpoints.create("name" => "Refinements", "start" => @milestone.end - 2.days, "end" => @milestone.end - 1.day)
                when "dev_web"
                    @milestone.checkpoints.create("name" => "Set up framework", "end" => @milestone.end - 30.days)
                    @milestone.checkpoints.create("name" => "Set up staging site", "start" => @milestone.end - 14.days, "end" => @milestone.end - 14.day)
                    @milestone.checkpoints.create("name" => "Testing", "start" => @milestone.end - 7.days, "end" => @milestone.end - 7.day)
                end
            end
        end
    
end
