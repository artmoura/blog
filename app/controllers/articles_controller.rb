class ArticlesController < ApplicationController
  def index
    @articles = params[:category_name] ? Category.find_by(name: params[:category_name].gsub("_", " ").titleize)&.articles : Article
    @articles = @articles ? @articles.order(published_at: :asc) : []
  end

  def show
    @articles = Category.find_by(name: params[:category_name]).articles.order(published_at: :asc)
    @article = @articles.find_by(metadata: params[:metadata])
    @options = {
      next: @articles[@articles.index(@article) + 1],
      previous: @articles[@articles.index(@article) - 1],
    }
  end
end
