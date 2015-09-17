class HomeController < ApplicationController
  def index
    @random_initiatives = Initiative.random_initiatives
  end
end
