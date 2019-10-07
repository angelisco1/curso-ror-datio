# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nombres_categorias = ['Desconocida', 'Verdura', 'Carne', 'Pescado', 'Lácteo', 'Legumbre', 'Especia', 'Fruta', 'Moluscos', 'Otro']

nombres_categorias.each do |nombre|
  Categoria.create(:nombre => nombre)
end

ingredientes_verduras = ['Pimiento verde', 'Cebolla', 'Berenjena']
ingredientes_carnes = ['Solomillo de cerdo ibérico', 'Panceta', 'Pechuga de pollo']
ingredientes_pescados = ['Lubina', 'Salmón']
ingredientes_lacteos = ['Queso Edam', 'Leche', 'Queso de cabra']
ingredientes_legumbres = ['Lentejas', 'Garbanzos']
ingredientes_especias = ['Oregano', 'Pimenton', 'Pimienta negra']
ingredientes_frutas = ['Platano', 'Naranja']
ingredientes_moluscos = ['Calamares', 'Chopitos']
ingredientes_otros = ['Pan rallado', 'Pan de molde', 'Aceite', 'Sal', 'Ajo', 'Patata', 'Limón', 'Huevo']

categoria = Categoria.find_by(:nombre => 'Desconocida')

nombres_ingredientes = {
  2 => ingredientes_verduras,
  3 => ingredientes_carnes,
  4 => ingredientes_pescados,
  5 => ingredientes_lacteos,
  6 => ingredientes_legumbres,
  7 => ingredientes_especias,
  8 => ingredientes_frutas,
  9 => ingredientes_moluscos,
  10 => ingredientes_otros
}

nombres_ingredientes.each do |categoria, nombres|
  nombres.each do |nombre|
    Ingrediente.create(:nombre => nombre, :categoria_id => categoria)
  end
end


usuarios = [
  {:nombre => 'Charly', :apellidos => 'Falco', :username => 'cfalco', :email => 'charlyfalco@gmail.com', :admin => true},
  {:nombre => 'Malia', :apellidos => 'Tate', :username => 'malita', :email => 'malita@gmail.com'},
  {:nombre => 'Mike', :apellidos => 'Kozinski', :username => 'koz', :email => 'mikekoz@gmail.com'}
  # {:nombre => 'Charly', :apellidos => 'Falco', :username => 'cfalco', :admin => true},
  # {:nombre => 'Malia', :apellidos => 'Tate', :username => 'malita'},
  # {:nombre => 'Mike', :apellidos => 'Kozinski', :username => 'koz'}
]

usuarios.each_with_index do |usuario, i|
  u = Usuario.create(usuario)

  # Asignamos el usuario a una receta (AHORA SE ASIGNA AL CREAR LA RECETA)
  # Forma 1
  # Receta.find(i+1).update_attribute(:usuario_id, u.id)

  # Forma 2
  # u.recetas << Receta.find(i+1)
end


pimiento = Ingrediente.find_by(:nombre => 'Pimiento verde')
berenjena = Ingrediente.find_by(:nombre => 'Berenjena')
cebolla = Ingrediente.find_by(:nombre => 'Cebolla')
aceite = Ingrediente.find_by(:nombre => 'Aceite')
huevo = Ingrediente.find_by(:nombre => 'Huevo')
patata = Ingrediente.find_by(:nombre => 'Patata')
sal = Ingrediente.find_by(:nombre => 'Sal')
solomillo = Ingrediente.find_by(:nombre => 'Solomillo de cerdo ibérico')
ajo = Ingrediente.find_by(:nombre => 'Ajo')
queso_cabra = Ingrediente.find_by(:nombre => 'Queso de cabra')
pan_molde = Ingrediente.find_by(:nombre => 'Pan de molde')
limon = Ingrediente.find_by(:nombre => 'Limón')
lubina = Ingrediente.find_by(:nombre => 'Lubina')

# https://www.mundorecetas.com/foro-cocina/topic/77491-escalicabra/
# https://www.directoalpaladar.com/recetario/ajoatao
# https://saborgourmet.com/solomillo-con-queso-de-cabra-y-cebolla-caramelizada/
recetas = [
  { :nombre => 'Ajoatao',
    :descripcion => "Paso 1: ...\nPaso 2: ...\nPaso 3: ...\nY esto es todo. A probarla.",
    :puntuacion => 4,
    :publica => true,
    :ingredientes => [
      {:i => ajo, :q => "3 dientes"}, {:i => aceite, :q => "2 cucharadas"}, {:i => sal, :q => "Al gusto"}, {:i => huevo, :q => "1"}, {:i => patata, :q => "1KG"}, {:i => limon, :q => "1"}
    ]
  },
  {
    :nombre => 'Escalicabra',
    :descripcion => "Paso 1: ...\nPaso 2: ...\nPaso 3: ...\nY esto es todo. A probarla.",
    :puntuacion => 8,
    :publica => true,
    :ingredientes => [
      {:i => pan_molde, :q => "1 rebanada"}, {:i => queso_cabra, :q => "1 trozo"}, {:i => sal, :q => "Al gusto"}, {:i => pimiento, :q => "1/4"}, {:i => cebolla, :q => "1/4"}, {:i => aceite, :q => "1 cucharada"}, {:i => berenjena, :q => "1/4"}
    ]
  },
  {
    :nombre => 'Solomillo encabramelizado',
    :descripcion => "Paso 1: ...\nPaso 2: ...\nPaso 3: ...\nY esto es todo. A probarla.",
    :puntuacion => 10,
    :publica => false,
    :ingredientes => [
      {:i => solomillo, :q => "2 medallones/persona"}, {:i => queso_cabra, :q => "2 medallones/persona"}, {:i => cebolla, :q => "1"}, {:i => aceite, :q => "Una chispa"}, {:i => sal, :q => "Al gusto"}
    ]
  }
]

recetas.each_with_index do |receta, i|
  r = Receta.create(:nombre => receta[:nombre], :descripcion => receta[:descripcion], :puntuacion => receta[:puntuacion], :publica => receta[:publica], :usuario => Usuario.find(i+1))
  # r = Receta.create(:nombre => receta[:nombre], :descripcion => receta[:descripcion], :puntuacion => receta[:puntuacion], :publica => receta[:publica])

  # Forma 1
  r.ingredientes_recetas << receta[:ingredientes].map do |ingrediente|
    IngredientesReceta.new(:ingrediente => ingrediente[:i], :cantidad => ingrediente[:q])
  end

  # Forma 2
  # receta[:ingredientes].each do |ingrediente|
  #   IngredientesReceta.create(:receta => r, :ingrediente => ingrediente[:i], :cantidad => ingrediente[:q])
  # end
end
