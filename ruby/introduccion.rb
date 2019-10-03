puts("Hola mundo!")


# Variables locales
mi_nombre = "Ángel"
puts("Hola " + mi_nombre)

# Constantes
NUM_MAX = 4
NUM_MAX = 5
Num_max = 4

puts NUM_MAX

# Variable global
$nombre_aplicacion = 'introduccion.rb'

# Strings
mensaje = "Bienvenido 'Angel'"
mensaje = "Bienvenido \"Angel\""

nombre = "Charly"
apellido = "Falco"
trabajo = "Infiltrado en club ilegal"

puts "Soy " + nombre + " " + apellido + " y trabajo como " + trabajo
puts "Soy #{nombre} #{apellido} y trabajo como #{trabajo}"
puts "Soy #{nombre} #{apellido.nil? ? 'Desconocido' : apellido} y trabajo como #{trabajo}"
puts "Soy #{nombre} #{apellido.empty? ? 'Desconocido' : apellido} y trabajo como #{trabajo}"
puts 'Soy #{nombre} #{apellido.empty? ? "Desconocido" : apellido} y trabajo como #{trabajo}'

pelicula = "The Expendables"
pelicula_minus = pelicula.downcase
puts(pelicula)
pelicula_minus = pelicula.downcase!
puts(pelicula)
puts(pelicula_minus)

puts "root".gsub('o', '0')

puts 'Penny...' * 3

# Numericos

puts 4/3
puts Float(4)
puts 4.to_f
puts 4/3.0
puts "4.2".to_i # Pasa el string 4.2 a numero entero

puts 4.68.round(3)


# IF

n = 4
if n > 4
  puts "Es mayor "
elsif n < 4
  puts "Es menor"
else
  puts "Es 4"
end

msg = if n > 4
  "Es mayor "
elsif n < 4
  "Es menor"
else
  "Es 4"
end
puts(msg)

x = 4

if true
  x = 2
end

x = 2 if true


mascota = 'Periquito'

tipo_mascota = case mascota
when -> (m) {m.length > 3}
  'Mascota con mas de 3 caracteres'
when 'Periquito', 'Canario'
  'Es un pajaro'
when 'Gato'
  'Es un gato'
else
  'Es otro'
end
puts tipo_mascota

es_verdad = false

unless es_verdad
  puts 'No es verdad'
end

for i in [1, 2, 3]
  puts i
end

for i in 1..4
  puts i
end

i = 2
while i != -1
  puts i
  i -= 1
end

i = -1
until i != -1
  puts i
  i += 1
end

# loop do

# end

# Funciones
def saludo
  puts "Hola"
end

saludo

def saluda_a_persona(nombre = "Mundo")
  puts "Hola " + nombre
end

saluda_a_persona("Angel")
saluda_a_persona


def suma n1, n2
  # if (n1.even?)
  #   return 0
  # end
  n1 + n2
end

def get_sorteo_loteria(sorteo, *nums, n)
  puts n
  "Sorteo #{sorteo}: #{nums.join(', ')}"
end

puts get_sorteo_loteria('Primitiva', 1, 2, 3, 4, 5)

def info_persona(nombre, apellidos, *opt,  **attrs)
  puts nombre
  puts apellidos
  puts opt.join(', ')
  puts attrs
end

info_persona('Angel', 'Villalba', 1, 2, 3, dni: '00000000T')

# Array

# nums = Array.new
nums = [1, 2, 3]

nums.push(4)
nums << 5
puts nums

nums.unshift(0)
puts nums

primero = nums.shift
ultimo = nums.pop
puts "P: #{primero}"
puts "U: #{ultimo}"
puts "-> #{nums[2..3]}"
# puts "-> #{nums.second}"
puts "-> #{nums.last}"
puts "-> #{nums[-2]}"
puts nums


nums1 = [1, 2, 3, 4]
nums2 = [3, 4, 5]

puts "#{nums1 + nums2}"
puts "#{nums1 - nums2}"
puts "#{nums1 & nums2}"
puts "#{nums1 | nums2}"


n1 = nums1[0]
n2 = nums1[1]

# n1, n2, *_ = nums
*_, n1, n2 = nums
puts n1
puts n2
puts "#{_}"

# Iteradores

nums2.each do |num|
  puts num
end

nums2.each{|num| puts num}
nums2.each.with_index{|num, i| puts "#{i}: #{num}"}
nums2.each_with_index{|num, i| puts "#{i}: #{num}"}

nums2_dobles = nums2.map{|num| num * 2}
puts nums2_dobles
nums2.map!{|num| num * 2}
puts nums2

nums_impares = nums1.select{|num| num.odd?}
puts nums_impares
nums_pares = nums1.reject{|num| num.odd?}
puts nums_pares

suma_nums1 = nums1.inject(10){|acc, num| acc += num}
suma_nums1 = nums1.inject(0) do |acc, num|
  acc += num
end
puts suma_nums1

# 'La casa de papel' => 'La Casa De Papel'
def fn(n)
  n.capitalize
end

def titlecase(str)
  # str.split(' ').map(&:capitalize).join(' ')
  # str.split(' ').map(&method(:fn)).join(' ')
  str.split(' ').map{|p| p.capitalize}.join(' ')
end

puts titlecase('La casa de papel')

def hide_words(str, palabras, c='*')
  # palabras.reduce(str){|acc, p| acc.gsub(p, c*p.length)}
  palabras.reduce(str) do |acc, palabra|
    acc.gsub(palabra, c*palabra.length)
  end
end

puts hide_words('Hola mundo', ['Hola']) # => '**** mundo'
puts hide_words('Hola mundo', ['Hola'], '-') # => '---- mundo'

# Hash

# coche = {
#   'marca' => 'Seat',
#   'modelo' => 'Ibiza',
#   # 7 => 'Siete'
# }

coche = {
  :marca => 'Seat',
  modelo: 'Ibiza', # Esta forma mejor que la de la flecha
  # 7 => 'Siete'
}

# puts :marca
# puts 'str'.to_sym.is_a? Symbol
# coche[:marca]
# puts coche['marca']
# puts coche[7]

puts coche.has_key?(:modelo)
puts coche.has_value?('Tesla')
puts "#{coche.keys}"
puts "#{coche.values}"

puts coche.merge!({matricula: '3473TRD', modelo: 'Leon'})

coche.each do |k, v|
  puts "#{k}: #{v}"
end

coche.each.with_index do |(k, v), i|
  puts "(#{i}) #{k}: #{v}"
end
# coche.each.with_index do |arr, i|
#   k, v = arr
#   puts "(#{i}) #{k}: #{v}"
# end

# [1, 2, 3].select{}.each{}


series = {
  twd: 4,
  got: 5,
  banshee: 2
}

series_gt3 = series.select{|k, v| v > 3}
puts series_gt3

puts "#{series.map{|k, v| {k => v.to_s + ' temporadas'}}}"

class Serie
  # attr_reader :titulo
  # attr_writer :num_episodios, :finalizada
  attr_accessor :episodios_vistos, :finalizada,  :titulo, :num_episodios
  @@total_series = 0

  def initialize(titulo, num_episodios, finalizada, episodios_vistos = 0)
    @titulo = titulo
    @num_episodios = num_episodios
    @finalizada = finalizada
  end

  def self.total_series
    @@total_series
  end

  def vista?
    info()
    @num_episodios == @episodios_vistos
  end

  # def num_episodios()
  # end
  # def num_episodios=(val)
  # end

  private
  def info
    puts "Es privado"
  end

  # protected

end

twd = Serie.new('The Walking Dead', 100, false)
puts Serie.total_series
puts twd.class.total_series
# puts twd.titulo
# twd.finalizada = true
puts twd.vista?
# puts twd.info



class Persona
  attr_reader :nombre, :apellidos, :fecha_nacimiento, :dni
  def initialize nombre, apellido, dni, fecha_nacimiento = Time.now
    @nombre = nombre
    @apellido = apellido
    @dni = dni
    @fecha_nacimiento = fecha_nacimiento
  end
  def nombre_completo
    "#{@nombre} #{@apellido}"
  end
  protected
    def info
      "#{@nombre} #{@apellido}\nEdad: #{get_age} años\nDni: #{@dni}\n"
    end
  private
    def get_age
      Time.now.year - @fecha_nacimiento.year
    end
end
falco = Persona.new('Charly', 'Falco', '00000000T', Time.new(1983, 3, 19))
puts falco.nombre
puts falco.nombre_completo

class PersonaTrabajadora < Persona
  def initialize nombre, apellido, dni, fecha_nacimiento, puesto_trabajo
    super(nombre, apellido, dni, fecha_nacimiento)
    @puesto_trabajo = puesto_trabajo
  end
  def info
    super + "Puesto de trabajo: #{@puesto_trabajo}"
  end
end
koz = PersonaTrabajadora.new('Mike', 'Kozinski', '00000000T', Time.new(1979, 7, 2), 'ATF special agent and undercover Mongols Sargent-at-Arms')
puts koz.info

module Disponible
  def esta_disponible?
    @disponible
  end
end

class HabitacionHotel
  attr_accessor :disponible
  include Disponible

  def initialize(num_habitacion, disponible = true)
    @num_habitacion = num_habitacion
    @disponible = disponible
  end
end

h = HabitacionHotel.new(2)
puts h.esta_disponible?

# Namespace

module MiValidator

  def self.minima_long_4? str
    str.length >= 4
  end

  class Validator
    def self.minima_long_3? str
      str.length >= 3
    end
  end
end

puts "Valido?: #{MiValidator::Validator.minima_long_3?('Ee')}"
puts "Valido?: #{MiValidator::Validator.minima_long_3?('Eeii')}"
puts "Valido?: #{MiValidator.minima_long_4?('Eeii')}"

module Traductor
  @@traducciones = {
    EN: {
      hola: 'hello'
    },
    FR: {
      hola: 'salut'
    }
  }

  def self.traducir(texto, lang='EN')
    tenemos_la_traduccion = @@traducciones.has_key?(lang.to_sym) && @@traducciones[lang.to_sym].has_key?(texto.to_sym)
    # @@traducciones[lang.to_sym][texto.to_sym] if tenemos_la_traduccion
    # 'No podemos traducirlo' unless tenemos_la_traduccion

    # begin

    # rescue => exception

    # end

    tenemos_la_traduccion ? @@traducciones[lang.to_sym][texto.to_sym] : 'No podemos traducirlo'
    # case lang
    # when 'EN'
    #   return EN[texto.to_sym]
    # when 'FR'
    #   return FR[texto.to_sym]
    # else
    #   return 'No conocemos el idioma'
    # end
  end
end

puts Traductor.traducir('hola')
puts Traductor.traducir('hola', 'FR')
puts Traductor.traducir('hola', 'IT')