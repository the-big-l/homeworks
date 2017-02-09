# Dictionary class
class Dictionary
  def initialize
    @dictionary = []
  end

  def assign(key, value)
    if lookup(key)
      remove(key)
      assign([key, value])
    else
      dictionary << [key, value]
    end
  end

  def lookup(key)
    dictionary.assoc(key).last
  end

  def remove(key)
    pair = dictionary.assoc(key)
    dictionary.delete(pair)
  end

  def show
    self
  end

  private

  attr_reader :dictionary
end
