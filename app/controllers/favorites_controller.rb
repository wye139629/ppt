class FavoritesController < ApplicationController
  def index
    @boards = current_user.my_boards
  end
  
end