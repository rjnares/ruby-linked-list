# frozen_string_literal: true

# Class for a node consisting of a value and link to another node
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end
