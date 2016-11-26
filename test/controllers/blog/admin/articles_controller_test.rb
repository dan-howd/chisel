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

    test "get index successful" do
      get :index
      assert_response :success
      assert_not_nil assigns(:admin_articles)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create admin_article" do
      article_attributes = @article.attributes
      article_attributes[:title] = "Test Title FASDF2345"
      assert_difference('Article.count') do
        post :create, admin_article: article_attributes
      end

      assert_redirected_to article_path(assigns(:admin_article))
    end

    test "should show article" do
      get :show, id: @article
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @article
      assert_response :success
    end

    test "should update admin_article" do
      patch :update, id: @article, admin_article: {  }
      assert_redirected_to article_path(assigns(:admin_article))
    end

    test "should destroy admin_article" do
      assert_difference('Article.count', -1) do
        delete :destroy, id: @article
      end

      assert_redirected_to admin_articles_path
    end
  end
end
