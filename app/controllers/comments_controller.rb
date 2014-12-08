class CommentsController < ApplicationController
  before_filter :laod_article
  
  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  private
  
  def laod_article
    @article = Article.find(params[:article_id])
  end
  
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
    
end
