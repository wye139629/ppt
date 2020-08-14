class Api::V2::BoardsController < ApplicationController
  def index
    @board = Board.all
  end
  
end
