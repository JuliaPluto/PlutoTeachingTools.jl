module PTTSpanish

using Markdown

using ..PlutoTeachingTools

abstract type Spanish <: AbstractLanguage end
struct SpanishFormal <: Spanish end
struct SpanishColloquial <: Spanish end
SpanishES = SpanishFormal

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang<:Spanish} = "Pista"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang<:Spanish} = "Consejo"
PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:SpanishColloquial} = "¿Quieres aprender más?"
PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:SpanishFormal} = "¿Quiere aprender más?"
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang<:Spanish} = "Pinta Avanzada"
PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:SpanishColloquial} = "¿Quieres ver la respuesta?"
PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:SpanishFormal} = "¿Quiere ver la respuesta?"
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang<:Spanish} = "Respuesta"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang<:Spanish} = "¡Casi!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang<:Spanish} = "Aviso:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang<:Spanish} = "Pregunta:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang<:Spanish} = "¡Cuidado!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang <: Spanish} = "🎯 Concepto clave"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang<:Spanish} = "Falta Respuesta"
PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:SpanishColloquial} = md"Cambia `missing` con tu respuesta."
PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:SpanishFormal} = md"Cambie `missing` con su respuesta."
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang<:Spanish} = "¡Ahí Vamos!"
PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:SpanishColloquial} = md"Cambia `nothing` con tu respuesta."
PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:SpanishFormal} = md"Cambie `nothing` con su respuesta."
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang<:Spanish} = "Error de Tipo"
PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:SpanishColloquial} = md"Comprueba el tipo de tu respuesta."
PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:SpanishFormal} = md"Compruebe el tipo de su respuesta."
PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang<:Spanish} = md"El tipo de $var debería de ser $type"
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang<:Spanish} = "¡Ups!"
PlutoTeachingTools.func_not_defined_text_str(func_name, lang::Lang) where {Lang<:SpanishColloquial} = md"Debes definir una función llamada **$(Markdown.Code(string(func_name)))**"
PlutoTeachingTools.func_not_defined_text_str(func_name, lang::Lang) where {Lang<:SpanishFormal} = md"Debe definir una función llamada **$(Markdown.Code(string(func_name)))**"
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang<:Spanish} = "¡Ups!"
PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::Lang) where {Lang<:SpanishColloquial} = md"Debes definir una variable llamada **$(Markdown.Code(string(variable_name)))**"
PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::Lang) where {Lang<:SpanishFormal} = md"Debe definir una variable llamada **$(Markdown.Code(string(variable_name)))**"
PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:SpanishColloquial} = "¡Sigue trabajando en ello!"
PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:SpanishFormal} = "¡Siga trabajando en ello!"
PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang<:Spanish} = md"La respuesta no es del todo correcta."
PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang<:SpanishColloquial} = md"Asegúrate de actualizar la celda que define $var."
PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang<:SpanishFormal} = md"Asegúrese de actualizar la celda que define $var."
PlutoTeachingTools.yays(lang::Lang) where {Lang<:SpanishColloquial} = [md"¡Genial!", md"Perfecto ❤", md"¡Genial! 🎉", md"¡Bien hecho!", md"¡Sigue así!", md"¡Buen trabajo!", md"¡Asombroso!", md"¡Tienes la respuesta correcta!", md"Avancemos a lo siguiente."]
PlutoTeachingTools.yays(lang::Lang) where {Lang<:SpanishFormal} = [md"¡Genial!", md"Perfecto ❤", md"¡Genial! 🎉", md"¡Bien hecho!", md"¡Siga así!", md"¡Buen trabajo!", md"¡Asombroso!", md"¡Tiene la respuesta correcta!", md"Avancemos a lo siguiente."]
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:SpanishColloquial} = "¡Lo tienes!"
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:SpanishFormal} = "¡Lo tiene!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang<:Spanish} = "PENDIENTE"

PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang::Lang) where {Lang<:Spanish} = md"La variable `$sym` sigue estando `missing`."
PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang::Lang) where {Lang<:Spanish} = "El tipo de `$sym` no es correcto.  Debería de ser <: "
PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang::Lang) where {Lang<:Spanish} = "uno de"
PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang::Lang) where {Lang<:Spanish} = "o"
PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang::Lang) where {Lang<:Spanish} = md"`$sym` tiene el tipo correcto."
PlutoTeachingTools.check_type_isa_type_error_str(sym, lang::Lang) where {Lang<:Spanish} = "Error de Tipo"

PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang::Lang) where {Lang<:Spanish} = md"La variable `$sym` aún es `missing`."
PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(sym, type, lang::Lang) where {Lang<:Spanish} = "El tipo de `$sym` debería de ser $type."
PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang::Lang) where {Lang<:Spanish} = "El tipo de `$sym` debería de ser uno de "
PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang<:Spanish} = "Error de Tipo"
PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang<:Spanish} = md"`$sym` tiene el tipo correcto."

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang<:Spanish} = "Modo Pantalla Completa"

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang<:Spanish} = "presentación"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang<:Spanish} = "Modo Presentación"

end
