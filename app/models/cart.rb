class Cart < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id, quantity: 1)
    end
    line_item
  end

  def checkout
    self.status = "submitted"
    remove_item 
    self.save
  end

  private 
  
  def remove_item
    self.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end

end
