class ItemsController < ApplicationController
  
  def index
    @items = Item.includes(:user)
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
