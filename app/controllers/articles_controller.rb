class ArticlesController < ApplicationController
  before_action :access_control, only: %i[new show create edit]
  def index; end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to user_path(current_user), notice: 'Article was successfully updated.'
    else
      str = 'Article not saved!'
      new_line = '<br/>'
      @article.errors.full_messages.each do |msg|
        str << new_line
        str << msg
      end
      respond_to do |format|
        format.html { redirect_to edit_article_path(@article), alert: str }
      end
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.valid? && @article.save
      if params[:category].nil?
        Tag.create(article_id: @article.id, category_id: 5)
      else
        params[:category].each do |cid|
          Tag.create(article_id: @article.id, category_id: cid)
        end
      end
      redirect_to new_article_path, notice: 'article Created Successfully'
    else
      render 'new'
    end
  end

  def search
    if params[:q].nil? || params[:q].empty?
      redirect_to articles_path, alert: 'Empty search'
    else
      @articles = Article.search(params[:q])
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
