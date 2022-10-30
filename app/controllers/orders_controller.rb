class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :seller_confirmation, only: [:index]
  before_action :seller_confirmation2, only: [:index]

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def seller_confirmation
    redirect_to root_path if current_user == @item.user
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end

  def seller_confirmation2
    redirect_to root_path unless @item.record.nil?
  end
end
