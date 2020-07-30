class BoardsController < ApplicationController
  

  def index
    @boards = Board.where(deleted_at: nil)
  end

  def show
      @board = Board.find(params[:id])  
  end

  def new
    @board = Board.new
  end
  def create
    # render html: params
    @board = Board.new(params_board)
    if @board.save
      redirect_to boards_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    @board = Board.find_by(id: params[:id])
  end

  def update
    @board = Board.find_by(id: params[:id])
    if @board.update(params_board)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find_by(id: params[:id])
    # @board.destroy
    @board.update(deleted_at: Time.now)
    redirect_to boards_path , notice: "刪除成功"
    
  end

  private
  def params_board
    params.require(:board).permit(:title, :intro, :state)
  end
end
