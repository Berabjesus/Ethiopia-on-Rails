class ArticlesController < ApplicationController
  before_action :access_control, only: %i[new show create]
  def index
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
        format.html { redirect_back(fallback_location: root_path)}
      end
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.valid? && @article.save
      params[:category].each do |cid|
        Tag.create(article_id: @article.id, category_id: cid)
      end
      redirect_to new_article_path, notice: 'article Created Successfully'
    else 
      errors = '<div class= "border-bottom pb-3">error</div>'
      errors << custom_errors(@article.errors)
      respond_to do |format|
        format.html { redirect_to new_article_path, alert: errors.html_safe }
      end 
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
