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
        @milestones = Milestone.all.order(:deadline)
    end

    def show
        @milestone = Milestone.find(params[:id])
    end


    private

        def milestone_params
  		    params.require(:milestone).permit(:name, :deadline, :user_id, :estimate, :project_id, :milestone_type)
        end

        def create_checkpoints
            if @milestone.deadline
                case @milestone.milestone_type
                when "design_print"
                    @milestone.checkpoints.create("name" => "Internal Review", "end" => @milestone.deadline - 3.days)
                    @milestone.checkpoints.create("name" => "Refinements", "start" => @milestone.deadline - 2.days, "end" => @milestone.deadline - 1.day)
                when "dev_web"
                    @milestone.checkpoints.create("name" => "Set up framework", "end" => @milestone.deadline - 30.days)
                    @milestone.checkpoints.create("name" => "Set up staging site", "start" => @milestone.deadline - 14.days, "end" => @milestone.deadline - 1.day)
                    @milestone.checkpoints.create("name" => "Testing", "start" => @milestone.deadline - 7.days, "end" => @milestone.deadline - 1.day)
                end
            end
        end
    
end
