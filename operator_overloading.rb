# Como todo es un objeto, los operadores tambien lo son y por lo tanto, podemos redefinirlos
class MagicString < String
  def +@
    upcase
  end

  def -@
    downcase
  end

  def !
    swapcase
  end
end

str = MagicString.new("This is my string!")
p +str         # => "THIS IS MY STRING!"
p !str         # => "tHIS IS MY STRING!"
p (not str)    # => "tHIS IS MY STRING!"
p -str    # => "this is my!"