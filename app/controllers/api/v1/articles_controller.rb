class Api::V1::ArticlesController < ApplicationController
        before_action :set_article, only: [:show, :update, :destroy]
        skip_before_action :verify_authenticity_token
         def index
          articles = Article.all
          render json: articles
        end
      
        def show
          render json: @article
        end
      
        def create
          article = Article.new(article_params)
          if article.save
            render json: article, status: :created
          else
            render json: article.errors, status: :unprocessable_entity
          end
        end
      
        def update
          if @article.update(article_params)
            render json: @article
          else
            render json: @article.errors, status: :unprocessable_entity
          end
        end
      
        def destroy
          @article.destroy
          head :no_content
        end
      
        private
      
        def set_article
          @article = Article.find_by(id: params[:id])
          unless @article
            render json: { error: 'Articles not found' }, status: :not_found
          end
        end
      
        def article_params
          params.require(:article).permit(:title, :body,:status)
        end
        def authenticate_model!
          authenticate_or_request_with_http_basic do |email, password|
            model = Model.find_by(email: email)
            model && model.valid_password?(password)
          end
      end
end
