module PTTRussian

using Markdown

using ..PlutoTeachingTools

abstract type Russian  <: AbstractLanguage end
struct RussianRU <: Russian end

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang <: Russian} = "Подсказка"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang <: Russian} = "Совет"
PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang <: Russian} = "Хотите узнать больше?"
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang <: Russian} = "Совет профессионала"
PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang <: Russian} = "Хотите посмотреть ответ?"
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang <: Russian} = "Ответ"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang <: Russian} = "Почти правильно!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang <: Russian} = "Внимание:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang <: Russian} = "Вопрос:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang <: Russian} = "Осторожно!"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang <: Russian} = "🎯 Ключевое понятие"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang <: Russian} = "Отсутствующий ответ"
PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang <: Russian} = md"Замените `missing` на ваш ответ."
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang <: Russian} = "Начинаем!"
PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang <: Russian} = md"Замените `nothing` на ваш ответ."
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang <: Russian} = "Ошибка типа"
PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang <: Russian} = md"Проверьте тип вашего ответа."
PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang <: Russian} = md"Тип $var должен быть $type"
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang <: Russian} = "Ой!"
PlutoTeachingTools.func_not_defined_text_str(func_name, lang::Lang) where {Lang <: Russian} = md"Убедитесь, что вы определили функцию под названием **$(Markdown.Code(string(func_name)))**"
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang <: Russian} = "Ой!"
PlutoTeachingTools.var_not_defined_text_str(variable_name, lang::Lang) where {Lang <: Russian} = md"Убедитесь, что вы определили переменную под названием **$(Markdown.Code(string(variable_name)))**"
PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang <: Russian} = "Продолжайте работу!"
PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang <: Russian} = md"Ответ не вполне правильный."
PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang <: Russian} = md"Обязательно обновите параметр ячейки $var."
PlutoTeachingTools.yays(lang::Lang) where {Lang <: Russian} =  [md"Отлично!", md"Ура ❤", md"Здорово! 🎉", md"Молодец!", md"Продолжайте в том же духе!", md"Хорошая работа!", md"Здорово!", md"Получен правильный ответ!", md"Переходим к следующему разделу"]
PlutoTeachingTools.correct_str(lang::Lang) where {Lang <: Russian} = "Получилось!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang <: Russian} = "НУЖНО СДЕЛАТЬ"

PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang::Lang) where {Lang <: Russian} = md"Переменная $sym по-прежнему имеет значение `missing`."
PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang::Lang) where {Lang <: Russian} = "Тип $sym задан неверно.  Он должен быть <: "
PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang::Lang) where {Lang <: Russian} = "один из"
PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang::Lang) where {Lang <: Russian} = "или"
PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang::Lang) where {Lang <: Russian} = md"тип переменной $sym правильный."
PlutoTeachingTools.check_type_isa_type_error_str(sym, lang::Lang) where {Lang <: Russian} = "Ошибка типа"

PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang::Lang) where {Lang <: Russian} = md"Переменная $sym по-прежнему имеет значение `missing`."
PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(sym, type, lang::Lang) where {Lang <: Russian} = "Тип переменной $sym должен быть $type."
PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang::Lang) where {Lang <: Russian} = "Тип переменной $sym должен быть один из "
PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang <: Russian} = "Ошибка типа"
PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang <: Russian} = md"тип переменной $sym правилен."

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang <: Russian} = "Режим полной ширины"

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang <: Russian} = "презентация"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang <: Russian} = "Режим презентации"

end
