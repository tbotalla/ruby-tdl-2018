class Tester2
  def initialize ary
    @ary = ary
  end
  attr_reader :ary
  def ==(y)
    @ary.length == y.ary.length
  end
end
b = Tester2.new([3,4,5])
puts b == Tester2.new([6,7,8])
