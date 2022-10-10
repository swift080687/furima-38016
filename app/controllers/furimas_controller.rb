class FurimasController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end
end
