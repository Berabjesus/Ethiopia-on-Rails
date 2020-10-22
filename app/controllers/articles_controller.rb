class ArticlesController < ApplicationController
  before_action :access_control, only: %i[new show create]
  def index
  end

  def new
    @article = Article.new
  end

  def show
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

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

 

end
