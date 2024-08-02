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
    if size == 1
      self.head = nil
      self.tail = nil
    elsif size > 1
      new_last_node = head
      new_last_node = new_last_node.next_node until new_last_node.next_node == tail
      new_last_node.next_node = nil
      self.tail = new_last_node
    end

    decrement_size
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

    if index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      insert_between(value, at(index - 1))
    end
  end

  def remove_at(index)
    return unless (0...size).include?(index)

    if index.zero?
      shift
    elsif index == size - 1
      pop
    else
      remove_between(at(index - 1))
    end
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

  private

  def decrement_size
    self.size -= 1 if size.positive?
  end

  def insert_between(value, previous)
    return if previous.nil?

    previous.next_node = Node.new(value, previous.next_node)

    self.size += 1
  end

  def remove_between(previous)
    return if previous.nil? || previous.next_node.nil?

    previous.next_node = previous.next_node.next_node

    decrement_size
  end

  def shift
    return unless size.positive?

    if size == 1
      self.head = nil
      self.tail = nil
    else
      self.head = head.next_node
    end

    decrement_size
  end
end
