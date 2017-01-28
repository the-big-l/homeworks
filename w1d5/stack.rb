# Stack class
class Stack
  def initialize
    @stack = []
  end

  def add(el)
    stack.push(el)
  end

  def remove
    stack.pop
  end

  def show
    self
  end

  private

  attr_reader :stack
end
