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
            create_deliverables
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
        @projects = Project.all
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
                    milestones = [
                                                ['Kickoff', 1, 3, 'Discovery'],
                                                ['Branding Exercise', 2, 2, 'Discovery'],
                                                ['Mood Board 1 Design', 3, 4, 'Discovery'],
                                                ['Mood Board 1 Internal Review', 3, 1, 'Discovery'],
                                                ['Mood Board 1 Refinement', 4, 2, 'Discovery'],
                                                ['Mood Board 1 Presentation', 4, 2, 'Discovery'],
                                                ['Sketches', 5, 20, 'Discovery'],
                                                ['Sketches Internal Review', 5, 2, 'Discovery'],
                                                ['Mood Board 2 Design', 5, 4, 'Discovery'],
                                                ['Mood Board 2 Internal Review', 6, 2, 'Discovery'],
                                                ['Mood Board 2 Refinement', 6, 2, 'Discovery'],
                                                ['Mood Board 2 Presentation', 6, 2, 'Discovery'],
                                                ['Logo Round 1 Design', 6, 20, 'Design'],
                                                ['Logo Round 1 Internal Review', 7, 2, 'Design'],
                                                ['Logo Round 1 Refinement', 8, 2, 'Design'],
                                                ['Logo Round 1 Presentation', 8, 2, 'Design'],
                                                ['Logo Round 2 Design', 9, 16, 'Refine'],
                                                ['Logo Round 2 Internal Review', 10, 2, 'Refine'],
                                                ['Logo Round 2 Refinement', 10, 2, 'Refine'],
                                                ['Logo Round 2 Presentation', 10, 2, 'Refine'],
                                                ['Send Final Logo Package', 11, 8, 'Finalize'],
                                                ['Style Guide Development', 11, 16, 'Finalize'],
                                                ['Style Guide Internal Review', 12, 2, 'Finalize'],
                                                ['Style Guide Refinement', 12, 2, 'Finalize'],
                                                ['Send Style Guide', 12, 2, 'Finalize']
                                        ]
                    milestones.each do |ms| 
                        Milestone.create("name" => ms[0], "estimated_date" => set_estimated_deadline(ms[1]), "estimated_time" => ms[2], "client_id" => @client.id, "project_id" => @project.id, "phase" =>ms[3])
                    end                

                when "Branding 2"
                    milestones = [
                                                ['Kickoff', 1, 3, 'Discovery'],
                                                ['Branding Exercise', 2, 2, 'Discovery'],
                                                ['Mood Board Design', 3, 4, 'Discovery'],
                                                ['Mood Board Internal Review', 3, 1, 'Discovery'],
                                                ['Mood Board Refinement', 4, 2, 'Discovery'],
                                                ['Mood Board Presentation', 4, 2, 'Discovery'],
                                                ['Sketches', 5, 20, 'Discovery'],
                                                ['Sketches Internal Review', 5, 2, 'Discovery'],
                                                ['Logo Round 1 Design', 6, 20, 'Design'],
                                                ['Logo Round 1 Internal Review', 7, 2, 'Design'],
                                                ['Logo Round 1 Refinement', 8, 2, 'Design'],
                                                ['Logo Round 1 Presentation', 8, 2, 'Design'],
                                                ['Logo Round 2 Design', 9, 16, 'Refine'],
                                                ['Logo Round 2 Internal Review', 10, 2, 'Refine'],
                                                ['Logo Round 2 Refinement', 10, 2, 'Refine'],
                                                ['Logo Round 2 Presentation', 10, 2, 'Refine'],
                                                ['Send Final Logo Package', 11, 8, 'Finalize']
                                        ]
                    milestones.each do |ms| 
                        Milestone.create("name" => ms[0], "estimated_date" => set_estimated_deadline(ms[1]), "estimated_time" => ms[2], "client_id" => @client.id, "project_id" => @project.id, "phase" =>ms[3])
                    end
                
                when "Print"
                    milestones = [
                                                ['Kickoff', 1, 3, 'Discovery'],
                                                ['Mood Board 1 Design', 2, 4, 'Discovery'],
                                                ['Mood Board 1 Internal Review', 3, 1, 'Discovery'],
                                                ['Mood Board 1 Refinement', 3, 2, 'Discovery'],
                                                ['Mood Board 1 Presentation', 4, 2, 'Discovery'],
                                                ['Vendor Quotes and sample requests', 6, 8, 'Discovery'],
                                                ['Sketches', 6, 20, 'Discovery'],
                                                ['Sketches Internal Review', 7, 2, 'Discovery'],
                                                ['Round 1 Design', 7, 20, 'Design'],
                                                ['Round 1 Internal Review', 8, 2, 'Design'],
                                                ['Round 1 Refinement', 8, 2, 'Design'],
                                                ['Round 1 Presentation', 9, 2, 'Design'],
                                                ['Round 2 Design', 9, 16, 'Refine'],
                                                ['Round 2 Internal Review', 10, 2, 'Refine'],
                                                ['Round 2 Refinement', 10, 2, 'Refine'],
                                                ['Round 2 Presentation', 11, 2, 'Refine'],
                                                ['Prepare print-ready files', 12, 8, 'Finalize'],
                                                ['Send to vendor', 12, 2, 'Finalize'],
                                                ['Press Check', 13, 2, 'Finalize'],
                                                ['Delivery', 13, 1, 'Finalize']
                                                
                                        ]
                    milestones.each do |ms| 
                        Milestone.create("name" => ms[0], "estimated_date" => set_estimated_deadline(ms[1]), "estimated_time" => ms[2], "client_id" => @client.id, "project_id" => @project.id, "phase" =>ms[3])
                    end      

                when "Web Design"
                    milestones = [
                                                ['Kickoff', 1, 3, 'Discovery'],
                                                ['Personae Development', 2, 6, 'Discovery'],
                                                ['Information Architecture', 2, 10, 'Discovery'],
                                                ['Mood Board Design', 2, 4, 'Discovery'],
                                                ['Mood Board Internal Review', 3, 1, 'Discovery'],
                                                ['Mood Board Refinement', 3, 2, 'Discovery'],
                                                ['Mood Board Presentation', 4, 2, 'Discovery'],
                                                ['Internal wireframe exercise', 4, 2, 'Discovery'],
                                                ['Wireframe design', 5, 16, 'Design'],
                                                ['Wireframe internal review', 5, 2, 'Design'],
                                                ['Wireframe refinement', 5, 2, 'Design'],
                                                ['Discovery doc design', 6, 8, 'Design'],
                                                ['Discovery doc internal review', 6, 2, 'Design'],
                                                ['Discovery doc refinement', 6, 2, 'Design'],
                                                ['Discovery doc presentation', 7, 2, 'Design'],
                                                ['Round 1 Design', 7, 20, 'Design'],
                                                ['Round 1 Internal Review', 8, 2, 'Design'],
                                                ['Round 1 Refinement', 8, 2, 'Design'],
                                                ['Round 1 Presentation', 9, 2, 'Design'],
                                                ['Round 2 Design', 9, 16, 'Refine'],
                                                ['Round 2 Internal Review', 10, 2, 'Refine'],
                                                ['Round 2 Refinement', 10, 2, 'Refine'],
                                                ['Round 2 Presentation', 11, 2, 'Refine'],
                                                ['Prepare print-ready files', 12, 8, 'Finalize'],
                                                ['Client signoff', 12, 2, 'Finalize'],
                                                ['Redline files', 13, 8, 'Finalize']
                                        ]
                    milestones.each do |ms| 
                        Milestone.create("name" => ms[0], "estimated_date" => set_estimated_deadline(ms[1]), "estimated_time" => ms[2], "client_id" => @client.id, "project_id" => @project.id, "phase" =>ms[3])
                    end 

                
                when "Web Development"
                    milestones = [
                                                ['Kickoff', 1, 3, 'Discovery'],
                                                ['Technology planning', 1, 4, 'Discovery'],
                                                ['Infrastructure', 2, 8, 'Development'],
                                                ['Build', 6, 60, 'Development'],
                                                ['Test', 8, 20, 'Refine'],
                                                ['Launch', 9, 8, 'Finalize']
                                        ]
                    milestones.each do |ms| 
                        Milestone.create("name" => ms[0], "estimated_date" => set_estimated_deadline(ms[1]), "estimated_time" => ms[2], "client_id" => @client.id, "project_id" => @project.id, "phase" =>ms[3])
                    end 
                
            end
        end

        def set_estimated_deadline(distance)
            if @project.start_date
                @project.start_date + distance.weeks
            else
                Date.today + distance.weeks
            end
        end

        def create_assets
            case @project.project_type
                when "Branding 1"
                    assets = [
                                                ['Creative Brief'],
                                                ['Inspiration'],
                                                ['Mood Board 1 Feedback'],
                                                ['Mood Board 2 Feedback'],
                                                ['Mood Board Signoff'],
                                                ['Round 1 Feedback'],
                                                ['Round 2 Feedback'],
                                                ['Final Signoff']
                                        ]
                    
                    assets.each do |as| 
                        Asset.create("name" => as[0], "project_id" => @project.id)
                    end                    

                when "Branding 2"
                    assets = [
                                                ['Creative Brief'],
                                                ['Inspiration'],
                                                ['Mood Board Feedback'],
                                                ['Mood Board Signoff'],
                                                ['Round 1 Feedback'],
                                                ['Round 2 Feedback'],
                                                ['Final Signoff']
                                        ]
                    
                    assets.each do |as| 
                        Asset.create("name" => as[0], "project_id" => @project.id)
                    end 
                
                when "Print"
                    assets = [
                                                ['Creative Brief'],
                                                ['Inspiration'],
                                                ['Photos'],
                                                ['Final Copy'],
                                                ['Mood Board Feedback'],
                                                ['Round 1 Feedback'],
                                                ['Round 2 Feedback'],
                                                ['Final Signoff'],
                                                ['Billing info to vendor'],
                                                ['Delivery Address']
                                        ]
                    
                    assets.each do |as| 
                        Asset.create("name" => as[0], "project_id" => @project.id)
                    end

                when "Web Design"
                    assets = [
                                                ['Site requirements'],
                                                ['Inspiration'],
                                                ['Photos / Budget'],
                                                ['Final Copy'],
                                                ['Mood board feedback'],
                                                ['Discovery document feedback'],
                                                ['Round 1 Feedback'],
                                                ['Round 2 Feedback'],
                                                ['Final Signoff']
                                        ]
                    
                    assets.each do |as| 
                        Asset.create("name" => as[0], "project_id" => @project.id)
                    end
                
                when "Web Development"  
                    assets = [
                                                ['Server info'],
                                                ['External account info']
                                        ]
                    
                    assets.each do |as| 
                        Asset.create("name" => as[0], "project_id" => @project.id)
                    end
                
            end
        end

        def create_deliverables
            case @project.project_type
                when "Branding 1"
                    deliverables = [
                                                ['Mood Board 1'],
                                                ['Mood Board 2'],
                                                ['Logo Round 1'],
                                                ['Logo Round 2'],
                                                ['Final Logo Package'],
                                                ['Style Guide']
                                        ]
                    
                    deliverables.each do |dv| 
                        Deliverable.create("name" => dv[0], "project_id" => @project.id)
                    end                    

                when "Branding 2"
                    deliverables = [
                                                ['Mood Board 1'],
                                                ['Logo Round 1'],
                                                ['Logo Round 2'],
                                                ['Final Logo Package']
                                        ]
                    
                    deliverables.each do |dv| 
                        Deliverable.create("name" => dv[0], "project_id" => @project.id)
                    end    
                
                when "Print"
                    deliverables = [
                                                ['Mood Board 1'],
                                                ['Round 1'],
                                                ['Round 2'],
                                                ['Samples'],
                                                ['Final Product']
                                        ]
                    
                    deliverables.each do |dv| 
                        Deliverable.create("name" => dv[0], "project_id" => @project.id)
                    end 

                when "Web Design"
                    deliverables = [
                                                ['Discovery document'],
                                                ['Mood board'],
                                                ['Round 1'],
                                                ['Round 2'],
                                                ['Redlined design'],
                                        ]
                    
                    deliverables.each do |dv| 
                        Deliverable.create("name" => dv[0], "project_id" => @project.id)
                    end 
                
                when "Web Development"
                    deliverables = [
                                                ['Staging site'],
                                                ['Website'],
                                                ['External resources'],
                                                ['Training']
                                        ]
                    
                    deliverables.each do |dv| 
                        Deliverable.create("name" => dv[0], "project_id" => @project.id)
                    end 
                
            end
        end

        
end
