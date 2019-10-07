# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# # inflect.singular /^carcamonias$/i, 'carcamonia'
# # inflect.plural /^carcamonia$/i, 'carcamonias'
  inflect.singular /^saludos$/i, 'saludo'
  inflect.plural /^saludo$/i, 'saludos'
  inflect.singular /^categorias$/i, 'categoria'
  inflect.plural /^categoria$/i, 'categorias'
  inflect.plural /^receta$/i, 'recetas'
  inflect.singular /^recetas$/i, 'receta'
  inflect.plural /^ingredientes_receta$/i, 'ingredientes_recetas'
  inflect.singular /^ingredientes_recetas$/i, 'ingredientes_receta'
  inflect.plural /^usuario$/i, 'usuarios'
  inflect.singular /^usuarios$/i, 'usuario'
  # inflect.singular /^ingredientes$/i, 'ingrediente'
  # inflect.plural /^ingrediente$/i, 'ingredientes'
end


# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
