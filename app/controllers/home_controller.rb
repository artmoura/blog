class HomeController < ApplicationController
  def index
    @articles = Article.order(published_at: :asc)
  end
end
