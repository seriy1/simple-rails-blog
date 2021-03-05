class ArticlesController < ApplicationController
  def blank?
    !self.attributes.find do |key, value|
      case (key)
        when 'id', 'created_at', 'updated_at'
          false
      else
        value.present?
      end
    end
  end
  def index
    @articles = Article.all
  end
  def new
  end

  def create
    @article= Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render action: "new"
    end

  end
  def show
    @article = Article.find(params[:id])
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render action: "edit"
    end
  end
  def destroy
    @article = Article.find(params[:id])
    if @article
      if @article.destroy
        redirect_to articles_path
      end
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
