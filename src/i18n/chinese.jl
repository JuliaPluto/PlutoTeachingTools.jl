module PTTChinese

using Markdown: @md_str, Code
using ..PlutoTeachingTools: PlutoTeachingTools, AbstractLanguage

abstract type Chinese <: AbstractLanguage end
struct ChineseZH <: Chinese end

# computational_thinking.jl
PlutoTeachingTools.hint_str(lang::Lang) where {Lang<:Chinese} = "提示"
PlutoTeachingTools.tip_str(lang::Lang) where {Lang<:Chinese} = "提醒"
PlutoTeachingTools.protip_invite_str(lang::Lang) where {Lang<:Chinese} = "想了解更多?"
PlutoTeachingTools.protip_boxlabel_str(lang::Lang) where {Lang<:Chinese} = "提醒"
PlutoTeachingTools.answer_invite_str(lang::Lang) where {Lang<:Chinese} = "想要看答案?"
PlutoTeachingTools.answer_boxlabel_str(lang::Lang) where {Lang<:Chinese} = "答案"
PlutoTeachingTools.almost_str(lang::Lang) where {Lang<:Chinese} = "差不多了!"
PlutoTeachingTools.warning_box_str(lang::Lang) where {Lang<:Chinese} = "警告:"
PlutoTeachingTools.question_box_str(lang::Lang) where {Lang<:Chinese} = "问题:"
PlutoTeachingTools.danger_str(lang::Lang) where {Lang<:Chinese} = "危险:"
PlutoTeachingTools.keyconcept_str(lang::Lang) where {Lang<:Chinese} = "🎯 核心概念"
PlutoTeachingTools.still_missing_str(lang::Lang) where {Lang<:Chinese} = "缺少回应"
function PlutoTeachingTools.still_missing_text_str(lang::Lang) where {Lang<:Chinese}
    md"把`missing`替换为你的答案."
end
PlutoTeachingTools.still_nothing_str(lang::Lang) where {Lang<:Chinese} = "让我们开始吧!"
function PlutoTeachingTools.still_nothing_text_str(lang::Lang) where {Lang<:Chinese}
    md"把 `nothing` 替换为你的答案."
end
PlutoTeachingTools.wrong_type_str(lang::Lang) where {Lang<:Chinese} = "类型错误"
PlutoTeachingTools.wrong_type_text_str(lang::Lang) where {Lang<:Chinese} = md"检查你的响应的类型."
function PlutoTeachingTools.wrong_type_text_str(lang::Lang, var, type) where {Lang<:Chinese}
    md"$var 的类型应该是 $type"
end
PlutoTeachingTools.func_not_defined_str(lang::Lang) where {Lang<:Chinese} = "糟糕!"
function PlutoTeachingTools.func_not_defined_text_str(
    func_name, lang::Lang
) where {Lang<:Chinese}
    fn = Code(string(func_name))
    md"请确定你定义了一个名为 **$(fn)** 的函数。"
end
PlutoTeachingTools.var_not_defined_str(lang::Lang) where {Lang<:Chinese} = "糟糕!"
function PlutoTeachingTools.var_not_defined_text_str(
    variable_name, lang::Lang
) where {Lang<:Chinese}
    vn = Code(string(variable_name))
    md"请确定你定义了一个名为 **$(vn)** 的变量。"
end
PlutoTeachingTools.keep_working_str(lang::Lang) where {Lang<:Chinese} = "继续加油！"
PlutoTeachingTools.keep_working_text_str(lang::Lang) where {Lang<:Chinese} = md"答案还不太对."
function PlutoTeachingTools.keep_working_update_str(var, lang::Lang) where {Lang<:Chinese}
    md"确保更新单元格设置 $var."
end
function PlutoTeachingTools.yays(lang::Lang) where {Lang<:Chinese}
    return [
        md"很棒!",
        md"耶 ❤",
        md"很棒! 🎉",
        md"干得好",
        md"继续保持!",
        md"干得不错!",
        md"帅呆了",
        md"你做对了!",
        md"继续往下看吧.",
    ]
end
PlutoTeachingTools.correct_str(lang::Lang) where {Lang<:Chinese} = "懂了!"
PlutoTeachingTools.todo_str(lang::Lang) where {Lang<:Chinese} = "待办"

function PlutoTeachingTools.check_type_isa_missing_text_str(
    sym, lang::Lang
) where {Lang<:Chinese}
    md"变量 $sym 仍然被设置为 missing."
end
function PlutoTeachingTools.check_type_isa_wrong_type_text_str(
    sym, lang::Lang
) where {Lang<:Chinese}
    return "$sym 的类型不对. 它应该是 <: "
end
function PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(
    lang::Lang
) where {Lang<:Chinese}
    return "一个"
end
function PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(
    lang::Lang
) where {Lang<:Chinese}
    return "或者"
end
function PlutoTeachingTools.check_type_isa_not_missing_text_str(
    sym, lang::Lang
) where {Lang<:Chinese}
    md"$sym 类型正确."
end
function PlutoTeachingTools.check_type_isa_type_error_str(
    sym, lang::Lang
) where {Lang<:Chinese}
    return "类型错误"
end

function PlutoTeachingTools.check_type_eq_missing_text_str(
    sym, lang::Lang
) where {Lang<:Chinese}
    md"变量 $sym 仍被置为 missing."
end
function PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(
    sym, type, lang::Lang
) where {Lang<:Chinese}
    return "$sym 的类型应该是 $type."
end
function PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(
    sym, lang::Lang
) where {Lang<:Chinese}
    return "$sym 应该是一个 "
end
PlutoTeachingTools.check_type_eq_type_error_str(lang::Lang) where {Lang<:Chinese} = "类型错误"
function PlutoTeachingTools.check_type_eq_correct_str(sym, lang::Lang) where {Lang<:Chinese}
    md"$sym 类型正确."
end

# other.jl
PlutoTeachingTools.full_width_mode_str(lang::Lang) where {Lang<:Chinese} = "全屏模式"

# present.jl
PlutoTeachingTools.present_str(lang::Lang) where {Lang<:Chinese} = "演示"
PlutoTeachingTools.present_mode_str(lang::Lang) where {Lang<:Chinese} = "演示模式"

end
