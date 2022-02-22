class TransphotosController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]

  def index
    @transphotos = Transphoto.all.order("created_at DESC")
  end

  def new
    @transphoto = Transphoto.new
  end

  def create
    @transphoto = Transphoto.create(transphoto_params)
    if @transphoto.save
      redirect_to root_path
    else
      @transphoto = Transphoto.new(transphoto_params) 
      render :new
    end
  end

  def show
    @transphoto = Transphoto.find(params[:id])
    @comment = Comment.new
    @comments = @transphoto.comments.includes(:user)
  end

  def edit
    @transphoto = Transphoto.find(params[:id])
    unless @transphoto.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    @transphoto = Transphoto.find(params[:id])
    if @transphoto.update_attributes(transphoto_params)
      redirect_to transphoto_path
    else
      render :edit
    end
  end

  def destroy
    @transphoto = Transphoto.find(params[:id])
    if @transphoto.destroy
      redirect_to transphotos_path
    end
  end

  private

  def transphoto_params
    params.require(:transphoto).permit(:title, :from_to, :message, :image).merge(user_id: current_user.id)
  end

end
