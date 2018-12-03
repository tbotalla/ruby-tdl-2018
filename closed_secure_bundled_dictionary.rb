# secure: encapsulado
# stateful: tiene estado mediante el atributo @dict
# bundled: no recibe el diccionario por parametro
class Dict
  @dict

  def initialize()
    @dict = Hash.new
  end
  def put(key, value)
    @dict[key] = value
  end
  def get(key)
    return @dict[key]
  end
  def get_dict()
      return @dict
  end
  def equals(d2)
    return @dict == d2.get_dict()
  end
end

dict1 = Dict.new
dict1.put('a', 1)
puts dict1.get_dict # {"a"=>1}
puts dict1.get('a') # 1
dict2 = Dict.new
dict2.put('a', 1)
puts dict2.equals(dict1) # true
dict3 = Dict.new
dict3.put('b', 2)
puts dict3.equals(dict1) # false
