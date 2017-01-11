def update_quality(items)
  items.each do |item|
    updater = ItemUpdater.build_updater_for(item)
    updater.update!
  end
end

# --------- This could be an alternative approach to ItemUpdater hierarchy

# class SellableItem
#   def initialize(item)
#     @item = item
#   end

#   def name
#     @item.name
#   end

#   def sell_in
#     @item.sell_in
#   end

#   def quality
#     @item.quality
#   end

#   def sell_in=(sell_in)
#     @item.sell_in = sell_in
#     @item.sell_in = 50 if @item.sell_in > 50
#   end

#   def quality=(quality)
#     @item.quality = quality
#   end
# end

# ---------

class ItemUpdater
  def self.build_updater_for(item)
    updaters = {
      "Aged Brie" => AgedBrieUpdater,
      "Backstage passes to a TAFKAL80ETC concert" => BackstagePassesUpdater,
      "Sulfuras, Hand of Ragnaros" => SulfurasUpdater,
      "Conjured Mana Cake" => ConjuredUpdater
    }
    return updaters[item.name].new(item) if updaters[item.name]
    new(item)
  end

  def initialize(item)
    @item = item
  end

  def update!
    update_sell_in!
    update_quality!
  end

  protected

  def item
    @item
  end

  def update_quality!
    item.quality -= 1
    item.quality -= 1 if outdated?
    item.quality = 0 if item.quality < 0
  end

  def update_sell_in!
    item.sell_in -= 1
  end

  def outdated?
    item.sell_in < 0
  end
end

class ConjuredUpdater < ItemUpdater
  def update_quality!
    item.quality -= 2
    item.quality -= 2 if outdated?
    item.quality = 0 if item.quality < 0
  end
end

class AgedBrieUpdater < ItemUpdater
  def update_quality!
    item.quality += 1
    item.quality += 1 if outdated?
    item.quality = 50 if item.quality > 50
  end
end

class BackstagePassesUpdater < ItemUpdater
  def update_quality!
    item.quality += 1
    item.quality += 1 if early_bid?
    item.quality += 1 if regular_bid?
    item.quality = 0 if outdated?
    item.quality = 50 if item.quality > 50
  end

  private

  def early_bid?
    item.sell_in < 10
  end

  def regular_bid?
    item.sell_in < 5
  end
end

class SulfurasUpdater < ItemUpdater
  def update_quality!
  end

  def update_sell_in!
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
