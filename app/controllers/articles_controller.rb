class ArticlesController < ApplicationController

  before_action :require_login, except:[:index]

  def index
    @articles = Article.all.order(created_at: :desc)
    @article = Article.new
  end

  def show
    begin
      @article = Article.find(params[:id])
      unless session[:user_id] == @article.user_id
        redirect_to article_path
        return
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to article_path
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = check_current_user.id
    return redirect_to article_path if @article.save
    redirect_to article_path
  end

  def edit
    begin
      @article = Article.find(params[:id])
      unless session[:user_id] == @article.user_id
        redirect_to article_path
        return
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to article_path
    end
  end

  def update
    @article = Article.find(params[:id])
    return redirect_to article_path if @article.update(article_params)
    render :edit
  end

  def delete
    @article = Article.find(params[:id])
    return redirect_to article_path if @article.delete
    render :index
  end

  private

  def article_params
    params.require(:article).permit(:name, :body)
  end

end
