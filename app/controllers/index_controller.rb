class IndexController < ApplicationController
  def index
    @articles = Article.all.page(params[:page]).per(5)
  end
end
