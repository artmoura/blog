class HomeController < ApplicationController
  def index
    @articles = params[:category_name] ? Category.find_by(name: params[:category_name].gsub("_", " ").titleize)&.articles : Article
    @articles = @articles ? @articles.order(published_at: :asc) : []
  end
end
