class HomesController < ApplicationController

  def index
    @images = Image.all
  end
end
