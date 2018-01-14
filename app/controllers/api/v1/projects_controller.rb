module Api
    module V1
        class ProjectsController < Api::V1::ApplicationController

        def index
            render json: decorated_projects, each_serializer: ProjectsSerializer 
        end        
        
        def show
            render json: project, serializer: ProjectSerializer,tasks_count: project.tasks_count
        end

        def destroy
            @project = @current_user.projects.find_by(params[:id])
            if @project.tasks.length == null
                @project.destroy
            else
              render json: {post: "not found"}, status: :not_found
            end
        end

        def create
            project= Project.new(project_params)
            project.user = @current_user

            project.save

            render json: project
        end

        private
            def project_params
                params.require(:project).permit(:name)
            end

            def decorated_projects
                projects = @current_user.projects
                projects.map {|project| ProjectDecorator.new(project) }
            end

            def project
                ProjectDecorator.new(Project.find(params[:id]))
            end
        end
    end
end