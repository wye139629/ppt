class BoardsController < ApplicationController
  # include UsersHelper
  before_action :authenticate_user, except: [:index, :show]

  def index
    @boards = Board.normal.page(params[:page]).per(2)
  end

  def show
      @board = Board.noraml.find(params[:id]) 
      @posts = @board.posts.includes(:user) 
  end

  def favorite
    @board = Board.normal.find(params[:id]) 
    # current_user.favorite_boards << @board
    current_user.toggle_favorite(@board)

    respond_to do |format|
      format.html { redirect_to favorites_path, notice: 'ok' }
      format.json { render json: {status: @board.favorited_by?(current_user)}}
      
    end
   
  end
  

  def new
    if user_sign_in?
      @board = Board.new
      authorize @board, :new?
    else
      redirect_to root_path, notice: '請先登入'
    end
  end

  def create
    # render html: params
    @board = Board.new(params_board)
    @board.users << current_user
    authorize @board, :create?
    if @board.save
      redirect_to boards_path, notice: "新增成功"
    else
      render :new
    end
  end

  def edit
    @board = Board.normal.find_by(id: params[:id])
  end

  def update
    @board = Board.normal.find_by(id: params[:id])
    if @board.update(params_board)
      redirect_to boards_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @board = Board.normal.find_by(id: params[:id])
    # @board.destroy
    @board.update(deleted_at: Time.now)
    redirect_to boards_path , notice: "刪除成功"
    
  end

  def hide
    @board= Board.normal.find_by(id: params[:id])
    @board.hide! if @board.may_hide?
    redirect_to boards_path, notice: '看版已隱藏'
  end


  private
  def params_board
    params.require(:board).permit(:title, :intro, :state)
  end
end
