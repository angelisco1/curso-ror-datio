# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:

# ActiveSupport::Inflector.inflections(:es) do |inflect|
#   # inflect.clear :all
#   inflect.plural /^carcamonia$/i, 'carcamonias'
#   inflect.singular /^carcamonias$/i, 'carcamonia'
#   inflect.plural /([taeiou])([A-Z]|_|\$)/i, '\1s\2'
#   inflect.plural /([rlnd])([A-Z]|_|$)/i, '\1es\2'
#   inflect.singular /([taeiou])s([A-Z]|_|$)/i, '\1\2'
#   inflect.singular /([rlnd])es([A-Z]|_|$)/i, '\1\2'
# end

I18n.available_locales = [:en, :es]
I18n.locale = :es

# puts "JEJEJEJEJEJEJ1 #{I18n.locale}"
ActiveSupport::Inflector.inflections(:es) do |inflect|
  # puts "JEJEJEJEJEJEJ2"
  inflect.plural(/$/, 's')
  inflect.plural(/([^aeéiou])$/i, '\1es')
  inflect.plural(/([aeiou]s)$/i, '\1')
  inflect.plural(/z$/i, 'ces')
  inflect.plural(/á([sn])$/i, 'a\1es')
  inflect.plural(/é([sn])$/i, 'e\1es')
  inflect.plural(/í([sn])$/i, 'i\1es')
  inflect.plural(/ó([sn])$/i, 'o\1es')
  inflect.plural(/ú([sn])$/i, 'u\1es')

  inflect.singular(/s$/, '')
  inflect.singular(/es$/, '')

  inflect.irregular('el', 'los')
end

ActiveSupport::Inflector.inflections(:en) do |inflect|
  # puts "JEJEJEJEJEJEJ3"
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
  # inflect.plural /^(ox)$/i, '\1en'
  # inflect.singular /^(ox)en/i, '\1'
  #   inflect.irregular 'person', 'people'
  #   inflect.uncountable %w( fish sheep )
  inflect.singular /^categorias/i, 'categoria'
  inflect.plural /^categoria/i, 'categorias'
  inflect.singular /^recetas/i, 'receta'
  inflect.plural /^receta/i, 'recetas'
  inflect.singular /^ingredientes_recetas$/i, 'ingredientes_receta'
  inflect.plural /^ingredientes_receta$/i, 'ingredientes_recetas'
  # inflect.singular /^ingredientes_recetas$/i, 'ingredientes_receta'
  # inflect.plural /^ingredientes_receta$/i, 'ingredientes_recetas'

  # inflect.plural(/$/, 's')
  # inflect.plural(/([^aeéiou])$/i, '\1es')
  # inflect.plural(/([aeiou]s)$/i, '\1')
  # inflect.plural(/z$/i, 'ces')
  # inflect.plural(/á([sn])$/i, 'a\1es')
  # inflect.plural(/é([sn])$/i, 'e\1es')
  # inflect.plural(/í([sn])$/i, 'i\1es')
  # inflect.plural(/ó([sn])$/i, 'o\1es')
  # inflect.plural(/ú([sn])$/i, 'u\1es')

  # inflect.singular(/s$/, '')
  # inflect.singular(/es$/, '')

  # inflect.irregular('el', 'los')
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
