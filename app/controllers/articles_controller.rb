class ArticlesController < ApplicationController
  before_filter :load_article, except: [:index, :create, :new]
  
  def index
     @articles = Article.all
     respond_to do |format|
        format.html {}
        format.json { 
          render json: @articles
        }
     end
  end
  
  def new
    @article = Article.new
  end
  
  def edit
  end
  
  def create
    @article = Article.create(article_param)
    if @article.errors.empty?
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @comments = @article.comments
  end

  def update
    if @article.update(article_param)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end
  
  private 
  
  def load_article
    @article = Article.find(params[:id])
  end
  
  def article_param
    params.require(:article).permit(:title, :text)
  end
end
