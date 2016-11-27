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

    # GET /projects/1
    # GET /projects/1.json
    def show
    end

    # GET /projects/new
    def new
      @project = Project.new
    end

    # GET /projects/1/edit
    def edit
    end

    # POST /projects
    # POST /projects.json
    def create
      @project = Project.new(project_params)

      respond_to do |format|
        if @project.save
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
        else
          flash[:error] = "Unable to create Project."
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /projects/1
    # PATCH/PUT /projects/1.json
    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /projects/1
    # DELETE /projects/1.json
    def destroy
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      end
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
