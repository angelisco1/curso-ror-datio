# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Categoria.delete_all
# Ingrediente.delete_all
# Receta.delete_all

# categorias = Categoria.create([{nombre: 'Desconocida'}, {nombre: 'Carne'}, {nombre: 'Fruta'}, {nombre: 'Pescado'}, {nombre: 'Lacteo'}])

# ingredientes = Ingrediente.create([{nombre: 'Leche', categoria: categorias.last}, {nombre: 'Tomate', categoria: categorias.third}, {nombre: 'Solomillo', categoria: categorias.second}, {nombre: 'Queso de cabra', categoria: categorias.last}])

# recetas = [
#   {
#     nombre: 'Solomillo con queso de cabra',
#     descripcion: 'Descripcion del Solomillo con queso de cabra',
#     publica: true,
#     puntuacion: 3,
#     # ingredientes: ingredientes[2..3]
#   },
#   {
#     nombre: 'Solomillo con tomate',
#     descripcion: 'Descripcion del Solomillo con tomate',
#     publica: true,
#     puntuacion: 3,
#     # ingredientes: ingredientes[1..2]
#   }
# ]

# recetas = Receta.create(recetas)
# recetas.first.ingredientes_receta = [IngredientesReceta.new(ingrediente_id: 2, cantidad: "1"), IngredientesReceta.new(ingrediente_id: 3, cantidad: "1")]
# recetas.first.save



# IngredientesReceta.create([{recetas: , ingrediente: }])


categorias = ['Desconocida', 'Verdura', 'Carne', 'Pescado', 'Lácteo', 'Legumbre', 'Especias', 'Fruta']

Categoria.create(categorias.map{ |cat| {nombre: cat} })

ingredientes = ['Leche', 'Tomate', 'Pechuga de pollo', 'Salmón', 'Cebolla', 'Oregano', 'Solomillo de cerdo', 'Pimiento verde', 'Berenjena', 'Lubina', 'Queso de cabra', 'Garbanzos', 'Oregano', 'Platano', 'Naranja', 'Calamares']

Ingrediente.create(ingredientes.map{ |ing| {nombre: ing} })

recetas = [
  { nombre: 'Ajoatao',
    descripcion: "Paso 1: ...\nPaso 2: ...\nPaso 3: ...\nY esto es todo. A probarla.",
    puntuacion: 4,
    publica: true
  },
  {
    nombre: 'Escalicabra',
    descripcion: "Paso 1: ...\nPaso 2: ...\nPaso 3: ...\nY esto es todo. A probarla.",
    puntuacion: 8,
    publica: true
  },
  {
    nombre: 'Solomillo encabramelizado',
    descripcion: "Paso 1: ...\nPaso 2: ...\nPaso 3: ...\nY esto es todo. A probarla.",
    puntuacion: 10,
    publica: false
  }
]

Receta.create(recetas)

ingredientes_recetas = [
  {
    receta_id: 2,
    ingrediente_id: 9,
    cantidad: '1/2',
  },
  {
    receta_id: 2,
    ingrediente_id: 8,
    cantidad: '1/2',
  },
  {
    receta_id: 2,
    ingrediente_id: 5,
    cantidad: '1/2',
  },
  {
    receta_id: 2,
    ingrediente_id: 11,
    cantidad: '1 trozo',
  },
  {
    receta_id: 3,
    ingrediente_id: 11,
    cantidad: '2 medallones/persona',
  },
  {
    receta_id: 3,
    ingrediente_id: 7,
    cantidad: '2 medallones/persona',
  }
]

IngredientesReceta.create(ingredientes_recetas);