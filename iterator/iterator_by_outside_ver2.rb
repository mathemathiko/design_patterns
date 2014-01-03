def merge(array1, array2)
  merged = []

  iterator1 = ArrayIterator.new(array1)
  iterator2 = ArrayIterator.new(array2)

  while iterator1.has_next? && iterator2.has_next?
    if iterator1.item < iterator2.item
      merged << iterator1.next_item
    else
      merged << iterator2.next_item
    end
  end

  while iterator1.has_next?
    merged << iterator1.next_item
  end

  while iterator2.has_next?
    merged << iterator2.next_item
  end

  merged
end

array1 = %w[1 123 12345]
array2 = %w[1 12 123]

puts merge(array1, array2)
