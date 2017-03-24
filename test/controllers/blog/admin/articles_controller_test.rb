require 'test_helper'


module Blog
  class Admin::ArticlesControllerTest < ActionController::TestCase

    setup do
      @article = blog_articles(:one)

      # Set routes to the engine's routes.
      @routes = Engine.routes

      # Set up dummy routes for routes that are commonly needed from the host
      # application, so that tests will pass.
      [:root_path, :destroy_user_session_path].each do |m|
        main_app.class.send :define_method, m do |arg|
          return "/"
        end
      end
    end

    test "get index success" do
      get :index
      assert_response :success
    end

    test "get new success" do
      get :new
      assert_response :success
    end

    test "post create success" do
      article_attributes = @article.attributes
      article_attributes[:title] = "Test Title FASDF2345"
      assert_difference('Article.count') do
        post :create, admin_article: article_attributes
      end
    end

    test "get show success" do
      get :show, id: @article
      assert_response :success
    end

    test "get edit success" do
      get :edit, id: @article
      assert_response :success
    end

    test "patch update success" do
      patch :update, id: @article, admin_article: {  }
    end

    test "delete destroy success" do
      assert_difference('Article.count', -1) do
        delete :destroy, id: @article
      end

      assert_redirected_to admin_articles_path
    end
  end
end
