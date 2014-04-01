class PocketItemPundit
  def self.stale?(items)
    items.select { |item| new(item).stale? }
  end

  attr_accessor :item

  def initialize(item)
    @item = item
  end

  def stale?
    item.time_added < 14.days.ago
  end
end
