class ArticlesController < ApplicationController
    def show
        # binding.break
        @article = Article.find(params[:id])
    end
end