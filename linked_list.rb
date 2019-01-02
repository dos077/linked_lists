class Node
    attr_accessor :value, :next

    def initialize(value = nil, next_node = nil )
        @value = value
        @next = next_node
    end

end

class LinkedList
    def initialize(*values)
        @head = ( (values)? Node.new(values.slice!(0)) : nil )
        values.each { |value| append(value) } if values
    end

    def append(value)
        return @head = Node.new(value) unless @head
        node = @head
        while node.next
            node = node.next
        end
        node.next = Node.new(value)
    end

    def prepend(value)
        node = Node.new(value, @head)
        @head = node
    end

    def size
        count = 0
        node = @head
        while node
            count+=1
            node = node.next   
        end
        count
    end

    def head
        @head.value if @head
    end

    def tail
        return nil unless @head
        node = @head
        while node.next
            node = node.next
        end
        node.value
    end

    def at(index)
        return nil unless size > index
        node = @head
        index.times { node = node.next }
        node.value
    end

    def pop
        return nil unless @head
        parent = @head
        while parent.next
            node = parent.next
            return parent.next = nil unless node.next
            parent = node
        end
    end

    def contains?(value)
        node = @head
        while node
            return true if node.value == value
            node = node.next
        end
        false
    end

    def find(data)
        index = 0
        node = @head
        while node
            return index if node.value == data
            node = node.next
            index+=1
        end
        nil
    end

    def to_s
        screen = ""
        node = @head
        while node
            screen << "( #{node.value} ) -> "
            node = node.next
        end
        screen << "nil"
    end

    def insert_at(index, value)
        return "out of range" unless size > index
        node = @head
        index.times { node=node.next }
        insertion = Node.new(value, node.next)
        node.next = insertion
    end

    def remove_at(index)
        return "out of range" unless size > index
        return pop if index == 0
        parent = @head
        (index-1).times { parent=parent.next }
        node = parent.next
        parent.next = node.next
    end
end

my_list = LinkedList.new("1", "2", "!")

puts my_list.to_s

my_list.remove_at(1)

puts my_list.to_s