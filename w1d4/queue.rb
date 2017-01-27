# Queue class
class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    queue.unshift(el)
  end

  def dequeue
    queue.pop
  end

  def show
    self
  end

  private

  attr_reader :queue
end
