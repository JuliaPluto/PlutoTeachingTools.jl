
function i18n(s::String)
  return s
end

function i18n(s::Markdown.MD)
  return s
end

macro __str(s::String)
  return i18n(s)
end