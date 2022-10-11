class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all.order('created_at DESC')
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

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :content, :category_id, :condition_id, :postage_type_id, :prefecture_id,
                                 :preparation_day_id, :price)
          .merge(user_id: current_user.id)
  end
end
