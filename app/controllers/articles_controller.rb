class ArticlesController < ApplicationController
  before_action :access_control, only: %i[new show create]

  def index
    # @article = Article.find_by(id: 11)
    @article = Article.last
    # create_session 7
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def show
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.valid? && @article.save
      Tag.create(article_id: @article.id, category_id: params[:article][:category])
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
