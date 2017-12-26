def resolve_locale(str)
  str = str.gsub(/\s/, '.')
  I18n.t(str)
end

def resolve_path(str)
  str.gsub(' ', '_') + '_path'
end

def resolve_ivar(str)
  model = str.gsub(' ', '_')
  instance_variable_get("@#{model}")
end

def set_ivar(str, value)
  model = str.gsub(' ', '_')
  instance_variable_set("@#{model}", value)
end


def resolve_class(str)
  str.singularize.titleize.gsub(' ', '').constantize
end
