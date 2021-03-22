class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_root_path, only: [:edit, :update, :destroy]
  before_action :search_product, only: [:index, :search]

  def index
    @items = Item.order("created_at DESC")
    @itemlist = Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @itemlist = Item.all
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order("created_at DESC")
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    @results = @p.result  # 検索条件にマッチした商品の情報を取得
    @itemlist = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_root_path
    if current_user.id != @item.user.id || @item.card.present?
      redirect_to root_path
    end
  end

  def search_product
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
  end
  
end
