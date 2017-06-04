# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :integer
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  position    :integer
#  is_public   :boolean          default(TRUE)
#

class Product < ApplicationRecord

  belongs_to :category

  has_many :cart_items
  has_many :cart, through: :cart_items, :dependent => :destroy

  has_many :comments

  has_many :favours
  has_many :collectors, through: :favours, source: :user

  mount_uploader :image, ImageUploader
  acts_as_list

  scope :published, -> { where(is_public: true) }

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates_numericality_of :discount, :greater_than => 0, :less_than => 100, :allow_blank => true

  def publish!
    self.is_public = true
    self.save
  end

  def hide!
    self.is_public = false
    self.save
  end

end
