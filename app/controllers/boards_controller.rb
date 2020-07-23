class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
  def new
    @board = Board.new
  end
  def create
    render html: params
    # @board = Board.new(params_board)
    # if @board.save
    #   redirect boards_path, notice: "新增成功"
    # else
    #   render :new
    # end
  end

  def edit
    @board = Board.find_by(params[:id])
  end

  private
  def params_board
    params.require(:board).permit(:title, :intro, :state)
  end
end
