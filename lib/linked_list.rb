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
      self.head = Node.new(value)
      self.tail = head
    else
      tail.next_node = Node.new(value)
      self.tail = tail.next_node
    end
    self.size += 1
  end

  def prepend(value)
    if size.zero?
      self.head = Node.new(value)
      self.tail = head
    else
      self.head = Node.new(value, head)
    end
    self.size += 1
  end

  def at(index)
    return nil unless (0...size).include?(index)

    current = head
    i = 0

    until i == index
      current = current.next_node
      i += 1
    end

    current
  end

  def pop
    return unless size.positive?

    if size == 1
      self.head = nil
      self.tail = nil
    else
      self.tail = head
      self.tail = tail.next_node until tail.next_node.next_node.nil?
      tail.next_node = nil
    end

    self.size -= 1
  end

  def contains?(value)
    current = head
    until current.nil?
      return true if current.value == value

      current = current.next_node
    end
    false
  end

  def find(value)
    index = 0
    current = head
    until current.nil?
      return index if current.value == value

      current = current.next_node
      index += 1
    end
    nil
  end

  def insert_at(value, index)
    return unless index.between?(0, size)
    return prepend(value) if index.zero?
    return append(value) if index == size

    current = head
    i = 1

    until i == index
      current = current.next_node
      i += 1
    end

    current.next_node = Node.new(value, current.next_node)
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
