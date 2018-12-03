x = 10
$x = 10
puts defined? x
puts defined? $x

class TestClass
  @@class_variable = "class var"
  def self.class_variable
    @@class_variable
  end
  def test
    @instance_var = 'instance var'
    puts @instance_var
  end
end

puts TestClass.class_variable # "class var"
puts TestClass.new.test # "instance var"