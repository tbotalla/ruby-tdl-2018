# closed
# bundled
# stateful
module Dictionary
  class Node
    attr_reader :key, :value, :left, :right
    include Enumerable
    def initialize(key, value)
      @key, @value = key, value
    end
    def left()
      return @left
    end
    def right()
      return @right
    end
    def key()
      return @key
    end
    def value()
      return @value
    end
    def insert(node)
      case @key <=> node.key
      when 1
        insert_into(:left, node)
      when 0
        @value = node.value
      when -1
        insert_into(:right, node)
      end
    end
    def get(key_to_find)
      case @key <=> key_to_find
      when 1
        @left.get(key_to_find)
      when 0
        return @value
      when -1
        @right.get(key_to_find)
      end
    end
    def keys
      claves = []
      if @key != nil
        claves.push(@key)
      end
      if @left != nil
        claves.push(@left.keys)
      end
      if @right != nil
        claves.push(@right.keys)
      end
      return claves
    end
    def values
      entries.map {|e| e.value}
    end
    def insert_into(destination, another_one)
      var = destination.to_s
      eval(%Q{
        if @#{var}.nil?
          @#{var} = another_one
        else
          @#{var}.insert(another_one)
        end
      })
    end
    protected :insert_into
  end

  class Dict
    attr_reader :root
    def initialize()
      @root = nil
    end
    def root
      return @root
    end
    def put(key, value)
      if @root == nil
        @root = Node.new(key, value)
      else
        @root.insert(Node.new(key, value))
      end
    end
    def get(key)
      if @root == nil
        0
      else
        if @root.key == key
          return @root.value
        else if @root.key > key
                @root.left.get(key)
               else
                @root.right.get(key)
             end
        end
      end
    end
    def keys()
      claves = []
      if @root.key != nil
        claves.push(@root.key)
      end
      if @root.left != nil
        claves.push(@root.left.keys)
      end
      if @root.right != nil
        claves.push(@root.right.keys)
      end
      return claves
    end
    def values()
      values = Array.new()
      if @root.value != nil
        values.push(@root.value)
      end
      if @root.left != nil
        values.push(Array(@root.left.values))
      end
      if @root.right != nil
        values.push(Array(@root.right.values))
      end
      return values
    end
    def equals(dict)
      return @root == dict
    end
  end
  # Pruebas
  dict1 = Dict.new
  dict2 = Dict.new
  dict1.put("a", 1)
  dict1.put("b", 2)
  dict1.put("c", 3)
  dict2.put("b", 2)
  dict2.put("a", 1)
  dict2.put("c", 3)
  puts dict1.get("a") # 1
  puts dict1.get("c") # 3
  puts dict1.get("b") # 2
  puts dict1.equals(dict2)
end