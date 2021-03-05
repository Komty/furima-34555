class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @card_address = CardAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @card_address = CardAddress.new(card_params)
    # binding.pry
    if @card_address.valid?
      @card_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def card_params
    params.require(:card_address).permit(:card_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end

