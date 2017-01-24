def update_quality(items)
  items.each do |item|
    updater = ItemUpdater.build_updater_for(item)
    updater.update!
  end
end

class ItemUpdater
  STANDARD_VARIATION = 1
  MAXIMUM_QUALITY = 50
  def self.build_updater_for(item)
    updaters = {
      "Aged Brie" => AgedBrieUpdater,
      "Backstage passes to a TAFKAL80ETC concert" => BackstagePassesUpdater,
      "Sulfuras, Hand of Ragnaros" => SulfurasUpdater,
      "Conjured Mana Cake" => ConjuredUpdater
    }
    return updaters[item.name].new(item) if updaters[item.name]
    RegularUpdater.new(item)
  end

  def initialize(item)
    @item = item
  end

  def update!
    update_sell_in!
    update_quality!
    on_outdated if outdated?
  end

  def on_outdated
    raise "Implementing subclass"
  end

  def increase_quality(variation)
    item.quality += variation
    item.quality = MAXIMUM_QUALITY if item.quality > MAXIMUM_QUALITY
  end

  def decrease_quality(variation)
    item.quality -= variation
    item.quality = 0 if item.quality < 0
  end

  protected

  def item
    @item
  end

  def update_quality!
    raise "Implementing subclass"
  end

  def update_sell_in!
    item.sell_in -= 1
  end

  def outdated?
    item.sell_in < 0
  end
end

class RegularUpdater < ItemUpdater
  def update_quality!
    decrease_quality(quality_variation)
  end

  def on_outdated
    decrease_quality(quality_variation)
  end

  private

  def quality_variation
    quality_variation = STANDARD_VARIATION
    quality_variation    
  end
end

class ConjuredUpdater < ItemUpdater
  def update_quality!
    decrease_quality(quality_variation)
  end

  def on_outdated
    decrease_quality(quality_variation)
  end

  private

  def quality_variation
    quality_variation = 2 * STANDARD_VARIATION
    quality_variation  
  end
end

class AgedBrieUpdater < ItemUpdater
  def update_quality!
    increase_quality(quality_variation)
  end

  def on_outdated
    increase_quality(quality_variation)
  end

  private

  def quality_variation
    quality_variation = STANDARD_VARIATION
    quality_variation
  end
end

class BackstagePassesUpdater < ItemUpdater
  def update_quality!
    increase_quality(quality_variation)
  end

  def on_outdated
    reset_quality
  end

  private

  def quality_variation
    quality_variation = STANDARD_VARIATION
    quality_variation += STANDARD_VARIATION if early_bid?
    quality_variation += STANDARD_VARIATION if regular_bid?
    quality_variation
  end

  def reset_quality
    item.quality = 0
  end

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
  def on_outdated
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)
