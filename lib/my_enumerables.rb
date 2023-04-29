# frozen-string-literal: true

module Enumerable
  # Your code goes here
  def my_each_with_index
    to_enum(:my_each_with_index) unless block_given?

    for i in 0..length-1 do
      yield(self[i], i)
    end

    self
  end

  def my_select(&block)
    array = []

    to_enum(:my_select) unless block_given?

    my_each { |item| array.push(item) if block.call(item) }

    array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    to_enum(:my_each) unless block_given?

    for item in self
      yield(item)
    end
  end

  self
end
