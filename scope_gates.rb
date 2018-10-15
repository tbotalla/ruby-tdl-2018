###################
# Scope Gates
# Se crea un scope nuevo cada vez que se ejecuta uno de los siguientes:
# Definicion de una clase (class SomeClass)
# Definicion de un modulo (module SomeModule)
# Definicion de un metodo (def some_method)
p 'Scope Gates'
v0 = 0
class SomeClass # Scope gate
  v1 = 1
  p local_variables # As the name says, it gives you all local variables in scope

  def some_method # Scope gate
    v2 = 2
    p local_variables
  end # end of def scope gate
end # end of class scope gate

some_class = SomeClass.new
some_class.some_method
# Notar que v0 no aparece ni en el scope de la clase ni del metodo!