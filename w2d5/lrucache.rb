# LRU cache class
class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.size
  end

  def add(el)
    @cache.delete(el)
    @cache.push(el)
    @cache = @cache.last(@size)
  end

  def show
    p @cache
  end
end
