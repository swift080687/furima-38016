class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_type
  belongs_to :prefecture
  belongs_to :preparation_day

  validates :image, :product_name, :content, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price, presence: true
  validates :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

end
