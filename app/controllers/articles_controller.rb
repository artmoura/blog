class ArticlesController < ApplicationController
  def index
    @articles = params[:category_name] ? Category.find_by(name: params[:category_name].gsub("_", " ").titleize)&.articles : Article
    @articles = @articles ? @articles.order(published_at: :asc) : []
  end

  def show
    begin
      @articles = Category.find_by(name: params[:category_name]).articles.order(published_at: :asc)
      @article = @articles.find_by(id: params[:id])
      @options = {
        next: @articles[@articles.index(@article) + 1],
        previous: @articles[@articles.index(@article) - 1],
      }
    rescue
      redirect_to "/", notice: "Erro ao abrir esse artigo"
    end
  end
end
