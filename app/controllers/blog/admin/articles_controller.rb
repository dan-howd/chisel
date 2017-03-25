require_dependency "blog/application_controller"

module Blog
  class Admin::ArticlesController < Admin::ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # GET /admin/articles
    def index
      @articles = Article.all.order(created_at: :desc).page(params[:page])
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def article_params
        params[:article].permit(:title, :body, :published)
      end
  end
end
