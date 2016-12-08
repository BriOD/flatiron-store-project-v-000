class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(item_id)
      # 3) Cart#add_item updates existing line_item instead of making new when adding same item
      # check to see if line_item already exist, if it does add to quantity
    line_item_exists = self.line_items.find_by(item_id: item_id)
    if line_item_exists
      line_item_exists.quantity +=1
      line_item_exists
    else
      self.line_items.build(item_id: item_id)
    end
  end





end
