class ArticlesController < ApplicationController
    before_action :set_article, only:[:show, :edit, :update, :destroy]

    def show
      puts "Inside show action"
        # binding.break
        
    end

    def index
      puts "Inside index action"
      @articles = Article.all # inorder to be available at the views file!!
    end

    def new
      puts "Inside new action"
      @article = Article.new
      puts @article.errors.any?
    end

    def create
      puts "Inside create action"
      # flash[:notice] = params[:article] # flash are also like hash- two common keys notice and alert
      # redirect_to articles_path
      @article = Article.new(article_params) # chaining 
      #whitelisting the fields which are coming from web -> strong parameter ( security feature )
      @article.user = User.first
      if @article.save
        flash[:notice] = "Article was created successfully!"
        redirect_to article_path(@article)   # since we need to redirect to the show action we must corresponding prefixname_path then the corresponding arrtribute
        # redirect_to @article # short form for the above line i.e we can skip the article_path
      else
        @errors = @article.errors.full_messages
        puts @errors
        render 'new' # if some validation errors occurs we need to reload the same page and display the errors
      end
    end

    def edit
      
    end

    def update
      
      if @article.update(article_params) # to
        flash[:notice] = "Article was updated successfully"
        redirect_to @article
      else
        @errors = @article.errors.full_messages
        render 'edit'
      end
    end
    
    def destroy
      puts "Inside Destroy action"
      
      @article.destroy
      redirect_to articles_path , status: :see_other
    end

    private # anything below this is an private method
      def set_article
        @article = Article.find(params[:id]) 
      end
      
      def article_params
        params.require(:article).permit(:title, :description)
      end
end