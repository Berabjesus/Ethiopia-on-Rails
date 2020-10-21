class ArticlesController < ApplicationController
  before_action :logged_in?

  def index
    @article = Article.find_by(id: 11)
    # @article = Article.last
    # create_session 7
  end

  def new
    @article = Article.new
  end

  def show
  end

  def create
    # @article = Article.new(article_params)
    # @article.AuthorId = current_user.id
    @article = current_user.articles.build(article_params)
    if @article.valid? && @article.save
      redirect_to articles_path, notice: 'article Created Successfully'
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
