module PTTSpanish

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type Spanish <: AbstractLanguage end
struct SpanishFormal <: Spanish end
struct SpanishColloquial <: Spanish end
SpanishES = SpanishFormal

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang<:Spanish} = "Pista"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang<:Spanish} = "Consejo"
function PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:SpanishColloquial}
    return "¿Quieres aprender más?"
end
function PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:SpanishFormal}
    return "¿Quiere aprender más?"
end
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang<:Spanish} = "Pinta Avanzada"
function PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:SpanishColloquial}
    return "¿Quieres ver la respuesta?"
end
function PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:SpanishFormal}
    return "¿Quiere ver la respuesta?"
end
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang<:Spanish} = "Respuesta"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang<:Spanish} = "¡Casi!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang<:Spanish} = "Aviso:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang<:Spanish} = "Pregunta:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang<:Spanish} = "¡Cuidado!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang<:Spanish} = "🎯 Concepto clave"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang<:Spanish} = "Falta Respuesta"
function PlutoTeachingTools.still_missing_text_str(
    lang::Lang
) where {Lang<:SpanishColloquial}
    md"Cambia `missing` con tu respuesta."
end
function PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:SpanishFormal}
    md"Cambie `missing` con su respuesta."
end
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang<:Spanish} = "¡Ahí Vamos!"
function PlutoTeachingTools.still_nothing_text_str(
    lang::Lang
) where {Lang<:SpanishColloquial}
    md"Cambia `nothing` con tu respuesta."
end
function PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:SpanishFormal}
    md"Cambie `nothing` con su respuesta."
end
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang<:Spanish} = "Error de Tipo"
function PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:SpanishColloquial}
    md"Comprueba el tipo de tu respuesta."
end
function PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:SpanishFormal}
    md"Compruebe el tipo de su respuesta."
end
function PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang<:Spanish}
    md"El tipo de $var debería de ser $type"
end
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang<:Spanish} = "¡Ups!"
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::Lang
) where {Lang<:SpanishColloquial}
    fn = Code(string(func_name))
    md"Debes definir una función llamada **$(fn)**"
end
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::Lang
) where {Lang<:SpanishFormal}
    fn = Code(string(func_name))
    md"Debe definir una función llamada **$(fn)**"
end
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang<:Spanish} = "¡Ups!"
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::Lang
) where {Lang<:SpanishColloquial}
    vn = Code(string(variable_name))
    md"Debes definir una variable llamada **$(vn)**"
end
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::Lang
) where {Lang<:SpanishFormal}
    vn = Code(string(variable_name))
    md"Debe definir una variable llamada **$(vn)**"
end
function PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:SpanishColloquial}
    return "¡Sigue trabajando en ello!"
end
function PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:SpanishFormal}
    return "¡Siga trabajando en ello!"
end
function PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang<:Spanish}
    md"La respuesta no es del todo correcta."
end
function PlutoTeachingTools.keep_working_update_str(
    var, lang::Lang
) where {Lang<:SpanishColloquial}
    md"Asegúrate de actualizar la celda que define $var."
end
function PlutoTeachingTools.keep_working_update_str(
    var, lang::Lang
) where {Lang<:SpanishFormal}
    md"Asegúrese de actualizar la celda que define $var."
end
function PlutoTeachingTools.yays(lang::Lang) where {Lang<:SpanishColloquial}
    return [
        md"¡Genial!",
        md"Perfecto ❤",
        md"¡Genial! 🎉",
        md"¡Bien hecho!",
        md"¡Sigue así!",
        md"¡Buen trabajo!",
        md"¡Asombroso!",
        md"¡Tienes la respuesta correcta!",
        md"Avancemos a lo siguiente.",
    ]
end
function PlutoTeachingTools.yays(lang::Lang) where {Lang<:SpanishFormal}
    return [
        md"¡Genial!",
        md"Perfecto ❤",
        md"¡Genial! 🎉",
        md"¡Bien hecho!",
        md"¡Siga así!",
        md"¡Buen trabajo!",
        md"¡Asombroso!",
        md"¡Tiene la respuesta correcta!",
        md"Avancemos a lo siguiente.",
    ]
end
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:SpanishColloquial} = "¡Lo tienes!"
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:SpanishFormal} = "¡Lo tiene!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang<:Spanish} = "PENDIENTE"

function PlutoTeachingTools.check_type_isa_missing_text_str(
    sym, lang::Lang
) where {Lang<:Spanish}
    md"La variable $sym sigue estando `missing`."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(
    sym, lang::Lang
) where {Lang<:Spanish}
    return "El tipo de $sym no es correcto.  Debería de ser <: "
end
function PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(
    lang::Lang
) where {Lang<:Spanish}
    return "uno de"
end
function PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(
    lang::Lang
) where {Lang<:Spanish}
    return "o"
end
function PlutoTeachingTools.check_type_isa_not_missing_text_str(
    sym, lang::Lang
) where {Lang<:Spanish}
    md"$sym tiene el tipo correcto."
end
function PlutoTeachingTools.check_type_isa_type_error_str(
    sym, lang::Lang
) where {Lang<:Spanish}
    return "Error de Tipo"
end

function PlutoTeachingTools.check_type_eq_missing_text_str(
    sym, lang::Lang
) where {Lang<:Spanish}
    md"La variable $sym aún es `missing`."
end
function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::Lang
) where {Lang<:Spanish}
    return "El tipo de $sym debería de ser $type."
end
function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(
    sym, lang::Lang
) where {Lang<:Spanish}
    return "El tipo de $sym debería de ser uno de "
end
function PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang<:Spanish}
    return "Error de Tipo"
end
function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang<:Spanish}
    md"$sym tiene el tipo correcto."
end

# other.jl
function PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang<:Spanish}
    return "Modo Pantalla Completa"
end

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang<:Spanish} = "presentación"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang<:Spanish} = "Modo Presentación"

end
