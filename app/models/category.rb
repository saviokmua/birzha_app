class Category < ActiveRecord::Base
  has_one :auction
  validates :name, presence: true
  before_destroy :is_use_auction?

  def is_use_auction?
      if Auction.find_by(category_id: id).present?
      self.errors[:base] << "Знищення неможливе. Існує аукціон, який використовує данну категорію"
      return false
    end
  end

end
