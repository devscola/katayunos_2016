def update_quality(items)
  items.each do |item|
    if not_aged_brie_nor_backstage_passes?(item)
      if degradable?(item)
        if not_sulfuras?(item)
          degrade!(item)
        end
      end
    else
      if upgradable?(item)
        upgrade!(item)
        if backstage_passes?(item)
          if early_bid?(item)
            if upgradable?(item)
              upgrade!(item)
            end
          end
          if regular_bid?(item)
            if upgradable?(item)
              upgrade!(item)
            end
          end
        end
      end
    end
    if not_sulfuras?(item)
      age!(item)
    end
    if outdated?(item)
      if not_aged_brie?(item)
        if not_backstage_passes?(item)
          if degradable?(item)
            if not_sulfuras?(item)
              degrade!(item)
            end
          end
        else
          make_worthless!(item)
        end
      else
        if upgradable?(item)
          upgrade!(item)
        end
      end
    end
  end
end

# ---------

def not_aged_brie_nor_backstage_passes?(item)
  item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
end

def degradable?(item)
  item.quality > 0
end

def not_sulfuras?(item)
  item.name != 'Sulfuras, Hand of Ragnaros'
end

def degrade!(item)
  item.quality -= 1
end

def upgradable?(item)
  item.quality < 50
end

def upgrade!(item)
  item.quality += 1
end

def backstage_passes?(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def not_backstage_passes?(item)
  !backstage_passes?(item)
end

def not_aged_brie?(item)
  item.name != "Aged Brie"
end

def early_bid?(item)
  item.sell_in < 11
end

def regular_bid?(item)
  item.sell_in < 6
end

def outdated?(item)
  item.sell_in < 0
end

def age!(item)
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
