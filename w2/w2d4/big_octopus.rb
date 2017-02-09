fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  biggest = fish.first
  fish.each do |fish1|
    fish.each do |fish2|
      bigger = [fish1, fish2].max_by(&:size)
      biggest = bigger if biggest.size < bigger.size
    end
  end

  biggest
end

def dominant_octopus(fish)
  merge_sort(fish).last
end

def clever_octopus(fish)
  biggest = fish.first
  fish.each { |fish| biggest = fish if fish.size > biggest.size }

  biggest
end

def merge_sort(array)
  return array if array.size <= 1
  mid = array.size / 2
  left, right = array[0...mid], array[mid..-1]

  merge(merge_sort(left), merge_sort(right))
end

def merge(arr1, arr2)
  return arr1 + arr2 if arr1.empty? || arr2.empty?

  if arr1.first.size < arr2.first.size
    [arr1.shift] + merge(arr1, arr2)
  else
    [arr2.shift] + merge(arr1, arr2)
  end
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up"]

def slow_dance(find, tiles_array)
  tiles_array.each_with_index { |dir, i| return i if dir == find }
end

tiles_hash = Hash[tiles_array.zip(0...tiles_array.size)]

def slow_dance(find, tiles_hash)
  tiles_hash[find]
end
