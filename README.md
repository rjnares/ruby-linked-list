# Ruby Linked List

This is my implementation of the [Linked List](https://www.theodinproject.com/lessons/ruby-linked-lists) project assigned in the [Computer Science](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby#a-bit-of-computer-science) section of the [Ruby](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) course which is part of the [Full Stack Ruby on Rails](https://www.theodinproject.com/paths/full-stack-ruby-on-rails) curriculum from [The Odin Project](https://www.theodinproject.com/).

## Project Description

Since Ruby does not provide support for linked lists, the main goal of this project was to implement this basic yet fundamental data structure.

My implementation includes the following classes:
* A `Node` class representing a unit of data which consists of a value and a link to the next node
* A `LinkedList` class consisting of an ordered list of `Node` objects

The `Node` class contains simple `#value` and `#next_node` instance methods allowing read/write access to the respective instance variables.

The `LinkedList` class is more involved and contains the following instance variables and methods:
* `#head`, `#tail`, and `#size` instance methods allowing read/write access to the  instance variables for the first node, last node, and list size respectively
* `#append(value)` which adds a new `Node` containing the `value` to the end of the list
* `#prepend(value)` which adds a new `Node` containing the `value` to the beginning of the list
* `#at(index)` which returns the node at a given 0-based `index`
* `#pop` which removes the last node from the list
* `#contains?(value)` which returns `true` if there is a `Node` with the given `value` in the list, or  `false` otherwise
* `#find(value)` which returns the 0-based index of the node with the given `value` in the list, or `nil` if it is not found
* `#to_s` which overrides the inherited method to return a string representation of the linked list in the following format: `( value ) -> ( value ) -> ( value ) -> nil`
* `#insert_at(value, index)` which inserts a new node with the given `value` at the given `index` if it is in the range `(0..size)`
* `#remove_at(index)` which removes a node at a given `index` if it is in the range `(0...size)`