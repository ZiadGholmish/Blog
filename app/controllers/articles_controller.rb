class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  #this for create an article
  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_show(@article)
  end

  private
  def article_params
    params.require(:article).permit(:title, :desc)
  end

end