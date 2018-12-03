# Sin duck typing
class Duck
  def prepare(workers)
    workers.each do |worker|
      case worker
      when Moulder
        worker.pour_mold(self)
      when Cooker
        worker.cook_duck(self)
      when Painter
        worker.paint_duck(self)
      when QualityAssurance
        worker.test_duck(self)
      when Packager
        worker.package_duck(self)
      end
    end
  end
end


# Our prepare method can now accept workers of any type as long as
# it can respond to prepare_duck. Without strict type restrictions
# we add a huge amount of flexibility to our application. Adding a more
# workers is trivial.

class Duck
  def prepare(workers)
    workers.each{ |worker|
      worker.prepare_duck(self) }
  end
end

class Cooker
  def prepare_duck(duck)
    puts "cook_for('15min')"
  end
end

class Painter
  def prepare_duck(duck)
    puts "paint_body('yellow')"
  end
end

# All of our classes share the same prepare_duck method signature, but they
# all have different implementations. However, in cases where you need to
# share some code across this interface you can break your duck type into a module.

d = Duck.new
d.prepare([Moulder.new, Cooker.new, Painter.new, QualityAssurance.new, Packager.new])
