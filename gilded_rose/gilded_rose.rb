def update_quality(items)
  items.each do |item|
    degrade!(item)
    if aged_brie_or_backstage_passes?(item)
      upgrade!(item)
      upgrade!(item) if backstage_early_bid?(item)
      upgrade!(item) if backstage_regular_bid?(item)
    end
    age!(item)
    if outdated?(item)
      upgrade!(item) if aged_brie?(item)
      make_worthless!(item) if backstage_passes?(item)
      degrade!(item)
    end
  end
end

# ---------

def aged_brie_or_backstage_passes?(item)
  item.name == 'Aged Brie' || item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def not_aged_brie_nor_backstage_passes?(item)
  !aged_brie_or_backstage_passes?(item)
end

def degradable?(item)
  return false if sulfuras?(item) || aged_brie_or_backstage_passes?(item)
  item.quality > 0
end

def sulfuras?(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def degrade!(item)
  return nil if !degradable?(item)
  item.quality -= 1
end

def upgradable?(item)
  item.quality < 50
end

def upgrade!(item)
  return nil if !upgradable?(item)
  item.quality += 1
end

def backstage_passes?(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def aged_brie?(item)
  item.name == "Aged Brie"
end

def backstage_early_bid?(item)
  backstage_passes?(item) && item.sell_in < 11
end

def backstage_regular_bid?(item)
  backstage_passes?(item) &&  item.sell_in < 6
end

def outdated?(item)
  item.sell_in < 0
end

def age!(item)
  return nil if sulfuras?(item)
  item.sell_in -= 1
end

def make_worthless!(item)
  item.quality = item.quality - item.quality
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
