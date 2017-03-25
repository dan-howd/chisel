module Blog
  class Admin::ProjectsController < Admin::ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    # GET /projects
    # GET /projects.json
    def index
      @page_title = "Projects"

      if params[:all]
        @admin_projects = Project.all
      else
        @admin_projects = Project.where(published: true)
      end

      @admin_projects = @admin_projects.order(created_at: :desc).page(params[:page])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def project_params
        params.require(:project).permit(:name, :description, :published, :url)
      end
  end
end
