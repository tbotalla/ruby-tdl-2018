# https://www.sitepoint.com/understanding-scope-in-ruby/
# Local variables
p 'Local variables'
if false # este codigo no se ejecuta
  a = 'hello' # el interprete ve esto, entonces la variable local a esta en el scope a partir de ahora
end
p a # nil, como ese codigo no se ejecuto, la variable no esta inicializada


# Si ahora hacemos que se ejecute ese codigo
if true # este codigo se ejecuta
  a = 'hello' # el interprete ve esto, entonces la variable local a esta en el scope a partir de ahora
end
p a # hello, el codigo se ejecuto, por lo tanto la variable fue inicializada

# Local variables conflicts
p 'Local variables conflicts'
def something
  'hello'
end

p something
something = 'Ruby'
p something # imprime el valor por fuera del metodo. Cuidado!
p something() # imprime el valor dentro del metodo