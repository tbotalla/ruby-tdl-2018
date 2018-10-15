########################
# Romper los Scope Gates
# Si por ejemplo queremos acceder desde un metodo de una clase a una variable de la misma
# Reemplazar:
# definiciones de clases por Class.new
# definiciones de modulos por Module.new
# definiciones de metodos por define_method
p 'Break Scope Gates'
v0 = 0
SomeClass = Class.new do
  v1 = 1
  p local_variables

  define_method(:some_method) do
    v2 = 2
    p local_variables
  end
end

some_class = SomeClass.new
some_class.some_method