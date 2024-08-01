# frozen_string_literal: true

require_relative 'node'

# Class for a linked list of nodes
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    if size.zero?
      self.head = Node.new(value: value)
      self.tail = head
    else
      tail.next_node = Node.new(value: value)
      self.tail = tail.next_node
    end
    self.size += 1
  end

  def to_s
    node_strings = Array.new(size + 1)
    index = 0
    current = head
    until current.nil?
      node_strings[index] = "( #{current.value} )"
      current = current.next_node
      index += 1
    end
    node_strings[index] = 'nil'
    node_strings.join(' -> ')
  end
end
