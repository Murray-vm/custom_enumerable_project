module Enumerable
  # Your code goes here
  def my_find 
    self.each do |elem|
      return elem if yield(elem)
    end
    nil 
  end

  def my_each_with_index 
    i = 0
    my_each do |item|
      yield(item, i)
      i += 1
    end
  end

  def my_select 
    selected = []
    my_each do |item|
      selected << item if yield(item)
    end
    selected 
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end  
    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end
    false
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end
      true
  end

  def my_count 
    count = 0
    my_each do |item|
    count += 1 if !block_given? || yield(item) 
    end
    count
  end

  def my_map 
    mapped_array = []
    my_each do |item|
      mapped_array << yield(item)
    end
    mapped_array
  end

  def my_inject(initial_value)
    total = initial_value
    my_each do |item|
      total = yield(total, item)
    end
    total 
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    if block_given?
      self.each do |item|
        yield(item)
      end
    end
  end

end

