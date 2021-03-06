class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @card_address = CardAddress.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @card_address = CardAddress.new(order_params)
    if @card_address.valid?
      pay_item
      @card_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:card_address).permit(:card_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_c11c46077c46c2e098fdf369"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],   # カードトークン
      currency: 'jpy'               # 通貨の種類（日本円）
    )
  end


end

