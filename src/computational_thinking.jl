import Markdown

text_to_content(x) = x
text_to_content(x::String) = @static(isdefined(Markdown, :parse) ? getfield(Markdown, :parse)(x) : x)


"""
Wraps rendered content in a `lang="xx"` div, so that assistive technology uses the
correct voice/pronunciation for localized admonition titles instead of the
surrounding document's language (WCAG 3.1.2 Language of Parts).

The `Admonition` method renders via `Markdown.html` directly rather than going
through `MD(admonition)` first, so the wrapper doesn't introduce a redundant nested
`div.markdown` around the admonition.
"""
function wrap_lang(content, lang::AbstractLanguage)
    lang_code = get_language_code(lang)
    inner_html = repr(MIME"text/html"(), content)
    return MD(@htl("""<div lang=$(isempty(lang_code) ? nothing : lang_code)>$(HTML(inner_html))</div>"""))
end
function wrap_lang(admonition::Admonition, lang::AbstractLanguage)
    lang_code = get_language_code(lang)
    inner_html = sprint(Markdown.html, admonition)
    return MD(@htl("""<div lang=$(isempty(lang_code) ? nothing : lang_code)>$(HTML(inner_html))</div>"""))
end

"Hint box with arguement as text."
function hint(text, lang::AbstractLanguage=default_language[])
    return wrap_lang(Admonition("hint", hint_str(lang), [text_to_content(text)]), lang)
end

"Tip box with arguement as text."
function tip(text, lang::AbstractLanguage=default_language[])
    return wrap_lang(Admonition("tip", tip_str(lang), [text_to_content(text)]), lang)
end

"Tip box with arguement as text."
function protip(
    text;
    lang::AbstractLanguage=default_language[],
    invite=protip_invite_str(lang),
    boxlabel=protip_boxlabel_str(lang),
)
    return wrap_lang(Foldable(invite, MD(Admonition("tip", boxlabel, [text_to_content(text)]))), lang)
end
function protip(
    text,
    invite,
    lang::AbstractLanguage=default_language[];
    boxlabel=protip_boxlabel_str(lang),
)
    return protip(text; lang, invite, boxlabel)
end

"Answer box with arguement as text."
function answer_box(
    text;
    lang::AbstractLanguage=default_language[],
    invite=answer_invite_str(lang),
    boxlabel=answer_boxlabel_str(lang),
)
    return wrap_lang(Foldable(invite, MD(Admonition("answer", boxlabel, [text_to_content(text)]))), lang)
end
function answer_box(
    text,
    invite,
    lang::AbstractLanguage=default_language[];
    boxlabel=answer_boxlabel_str(lang),
)
    return answer_box(text; lang, invite, boxlabel)
end

"Admonition box labeled a warning with arguement as text."
function almost(text, lang::AbstractLanguage=default_language[])
    return wrap_lang(Admonition("warning", almost_str(lang), [text_to_content(text)]), lang)
end

"Warning box with arguement as text."
function warning_box(text, lang::AbstractLanguage=default_language[])
    return wrap_lang(Admonition("warning", warning_box_str(lang), [text_to_content(text)]), lang)
end

"Question box with arguement as text."
function question_box(text, lang::AbstractLanguage=default_language[])
    return wrap_lang(Admonition("question", question_box_str(lang), [text_to_content(text)]), lang)
end

"Key concept box with concept name and description as input arguments."
function keyconcept(concept, text, lang::AbstractLanguage=default_language[])
    return wrap_lang(Admonition("key-concept", keyconcept_str(lang), [md"**$concept**", text_to_content(text)]), lang)
end

"Danger box with arguement as text."
function danger(text, lang::AbstractLanguage=default_language[])
    return wrap_lang(Admonition("danger", danger_str(lang), [text_to_content(text)]), lang)
end

"""
Wraps rendered admonition HTML in an ARIA live region, so that assistive
technology announces feedback boxes as they appear/change (WCAG 4.1.3
Status Messages) instead of requiring the user to notice them visually.

Also carries the `lang` attribute for the localized title inside (WCAG 3.1.2
Language of Parts) on the same element, rather than nesting a second wrapper div.
"""
function aria_live_status(content, lang::AbstractLanguage)
    inner_html = repr(MIME"text/html"(), content)
    lang_code = get_language_code(lang)
    return @htl("""<div lang=$(isempty(lang_code) ? nothing : lang_code) role="status" aria-live="polite" aria-atomic="true">$(HTML(inner_html))</div>""")
end

"Admonition box with reminder to replace missing."
function still_missing(;
    lang::AbstractLanguage=default_language[], text=still_missing_text_str(lang)
)
    return aria_live_status(MD(Admonition("warning", still_missing_str(lang), [text_to_content(text)])), lang)
end
still_missing(text, lang::AbstractLanguage=default_language[]) = still_missing(; lang, text)

"Admonition box with reminder to replace nothing."
function still_nothing(;
    lang::AbstractLanguage=default_language[], text=still_nothing_text_str(lang)
)
    return aria_live_status(MD(Admonition("warning", still_nothing_str(lang), [text_to_content(text)])), lang)
end
still_nothing(text, lang::AbstractLanguage=default_language[]) = still_nothing(; lang, text)

function wrong_type(lang::AbstractLanguage=default_language[])
    return aria_live_status(MD(Admonition("danger", wrong_type_str(lang), [wrong_type_text_str(lang)])), lang)
end

function wrong_type(
    var::Symbol,
    type::Type,
    lang::AbstractLanguage=default_language[];
    text=wrong_type_text_str(lang, var, type),
)
    return aria_live_status(MD(Admonition("danger", wrong_type_str(lang), [text_to_content(text)])), lang)
end

"Admonition box with reminder that function name passed is not defined."
function func_not_defined(func_name, lang::AbstractLanguage=default_language[])
    return wrap_lang(
        Admonition(
            "danger",
            func_not_defined_str(lang),
            [func_not_defined_text_str(func_name, lang)],
        ),
        lang,
    )
end

"Admonition box with reminder that variable name passed is not defined."
function var_not_defined(variable_name, lang::AbstractLanguage=default_language[])
    return wrap_lang(
        Admonition(
            "danger",
            var_not_defined_str(lang),
            [var_not_defined_text_str(variable_name, lang)],
        ),
        lang,
    )
end

"Admonition box with reminder that variable name passed is not defined. (deprecated)"
function not_defined(variable_name, lang::AbstractLanguage=default_language[])
    return var_not_defined(variable_name, lang)
end

"Admonition box warning that the answer isn't quite right."
function keep_working(;
    lang::AbstractLanguage=default_language[], text=keep_working_text_str(lang)
)
    return aria_live_status(MD(Admonition("danger", keep_working_str(lang), [text_to_content(text)])), lang)
end
keep_working(text, lang::AbstractLanguage=default_language[]) = keep_working(; lang, text);

function keep_working_if_var_contains_substr(
    var::Symbol, str::String, substr::String, lang::AbstractLanguage=default_language[]
)
    # I had to remove !@isdefined(var) due to how Pluto puts variables into different modules
    # not exported, so provide function with same name in notebook
    if ismissing(var)
        still_missing(; lang)
    elseif isnothing(var)
        still_nothing(; lang)
    else
        if occursin(substr, str)
            keep_working(keep_working_update_str(var, lang))
        end
    end
end
function keep_working_if_var_contains_substr(
    var::Symbol, str::MD, substr::String, lang::AbstractLanguage=default_language[]
)
    return keep_working_if_var_contains_substr(var, @static(isdefined(Markdown, :plain) ? getfield(Markdown, :plain)(str) : str), substr, lang)
end

type_isa(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .<: t))
type_eq(var, t::Union{Type,Vector{Type},Vector{DataType}}) = (any(typeof(var) .== t))

# To use functions in notebook, run eval(Meta.parse(code_for_check_type_funcs)) 
const code_for_check_type_funcs = """
begin
function check_type_isa(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}}, lang::AbstractLanguage = PlutoTeachingTools.default_language[])
    if ismissing(var)
        passed = false
        text = PlutoTeachingTools.check_type_isa_missing_text_str(sym, lang)
        msg = still_missing(text, lang)
    elseif !type_isa(var,t) # (any(typeof(var) .<: t))
        passed = false
        text = PlutoTeachingTools.check_type_isa_wrong_type_text_str(sym, lang)
        if typeof(t) <: Type
           text = text * "\$t."
        else
           text = text * PlutoTeachingTools.check_type_isa_wrong_type_one_of_text_str(lang) * " "
           for tt in t
              if tt == last(t)
                 text = text * " " * PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang) * " \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        msg = PlutoTeachingTools.wrap_lang(Markdown.Admonition("danger", PlutoTeachingTools.check_type_isa_type_error_str(sym, lang), [Markdown.parse(text)]), lang)
    else
        passed = true
        msg = PlutoTeachingTools.check_type_isa_not_missing_text_str(sym, lang)
    end
    return (;passed, msg)
end
function check_type_eq(sym::Symbol, var, t::Union{Type,Vector{Type},Vector{DataType}}, lang::AbstractLanguage = PlutoTeachingTools.default_language[])
    if ismissing(var)
        passed = false
        text = PlutoTeachingTools.check_type_eq_missing_text_str(sym, lang)
        msg = PlutoTeachingTools.still_missing(text, lang)
    elseif !type_eq(var, t) # (any(typeof(var) == t))
        passed = false
        if typeof(t) <: Type
           text = PlutoTeachingTools.check_type_eq_wrong_type_single_text_str(sym, type, lang)
        else
           text = PlutoTeachingTools.check_type_eq_wrong_type_multi_text_str(sym, lang)
           for tt in t
              if tt == last(t)
                 text = text * " " * PlutoTeachingTools.check_type_isa_wrong_type_or_text_str(lang) * " \$t."
              else
                 text = text * " \$t,"
              end
           end
        end
        #text = md"The type of \$sym should be \$t."
        msg = PlutoTeachingTools.wrap_lang(Markdown.Admonition("danger", PlutoTeachingTools.check_type_eq_type_error_str(lang), [Markdown.parse(text)]), lang)
    else
        passed = true
        msg = PlutoTeachingTools.check_type_eq_correct_str(sym, lang)
    end
    return (;passed, msg)
end
end
"""

"Box with random positive message."
function correct(; lang::AbstractLanguage=default_language[], text=rand(yays(lang)))
    return aria_live_status(MD(Admonition("correct", correct_str(lang), [text_to_content(text)])), lang)
end
correct(text, lang::AbstractLanguage=default_language[]) = correct(; lang, text)

#TODO_str = html"<span style='display: inline; font-size: 2em; color: purple; font-weight: 900;'>TODO</span>"
#TODO() = TODO_str

"""
Displays nice TODO graphic inline as an H1 heading (so will show up in PlutoUI's table of contents). 
Useful for demarcating work-in-progress sections or parts that could be imporved or will be worked on later, etc.
"""
function TODO end

function TODO(text, lang::AbstractLanguage=default_language[]; heading=todo_str(lang))
    return TODO(; lang, text, heading)
end

function TODO(; lang::AbstractLanguage=default_language[], text="", heading=todo_str(lang))
    @htl("""
    <div class="ptt-todo-tape">
    </div> 
    <div class="ptt-todo-content">
    <h1><span aria-hidden="true">&#9888;</span> $heading <span aria-hidden="true">&#9888;</span></h1>
    <p>$text</p>
    </div> 
    <div class="ptt-todo-tape">
    </div> 


    <style> 
    div.ptt-todo-tape {
        padding: 1rem;
        background: repeating-linear-gradient(
        45deg,
        #FFE41E,
        #FFE41E 12px,
        #141617 12px,
        #141617 24px
        );
    }

    div.ptt-todo-content {
        padding:1.2rem;
        background-color: var(--white);
    }
    </style>
    """)
end

# Useful strings for embedding in markdown
const nbsp = html"&nbsp;"

function display_msg_if_fail(x; msg_pass=nothing)
    if !x.passed
        x.msg
    else
        msg_pass
    end
end

"""
Displays a nice blockquote. Useful for including quotes by well known figures or useful nuggets of wisdom.  
"""
function blockquote(text, author="")
    @htl("""
    <div class="nice-blockquote nice-blockquote__bordered nice-blockquote--quoted">
    <p class="nice-blockquote__text">
    <span class="nice-blockquote__quote-mark nice-blockquote__quote-mark--open" aria-hidden="true">&ldquo;</span>
    $text
    <span class="nice-blockquote__quote-mark nice-blockquote__quote-mark--close" aria-hidden="true">&rdquo;</span>
    </p>
    <div class="nice-blockquote__text nice-blockquote__text--author">
    $author
    </div>
    </div>
    <style>
    .nice-blockquote{
    padding: 25px;
    border: 0.5px solid color-mix(in srgb, currentColor 40%, transparent);
    box-sizing:border-box;
    overflow-y:hidden;
    }
    .nice-blockquote__bordered{
    border-left-width: 14px;
    }
    .nice-blockquote__quote-mark{
        font-size: 70px;
        font-family: Arial;
        font-weight: bold;
        color: color-mix(in srgb, currentColor 40%, transparent);
        display: block;
        /* margin-top: -20px; */
        /* margin-bottom: -40px; */
        font-family: Arial;
        float: left;
        /* padding: 0.1ch 1ch; */
    }

    .nice-blockquote__quote-mark--open{
        padding-inline-end: .2ch;
        line-height: 0.5;
    }
    .nice-blockquote__quote-mark--close{
        float: right;
        padding-inline-start: .2ch;
            line-height: .7;
    }

    .nice-blockquote__text{
    font-family: Arial;
    font-style: italic;
    margin:0;
    line height: 1.5;
    text-align:left;
    }
    .nice-blockquote__text:not(:last_child){
    margin-bottom:10px;
    }
    .nice-blockquote__text--author{
        font-weight:bold;
        font-style: normal;
        text-align:right;
        margin-block-start: 3em;
    }
    
    </style>
    """)
end


"""
A clear visual indicator of a section, with a colored outline. You use this function at the start of a section.

The outline extends below the cell, which makes it useful to visually group multiple cells together.

```julia
section_outline(
    section_type::String,
    section_title::String;
    color::String="green", # this can be any valid CSS color
    big::Bool=false, # if true, the outline will be larger
    header_level::Int=2, # the level of the header to use. 2 means a ## header, 3 means a ### header, etc.
)
```

`color` is mixed with black (light theme) or white (dark theme) via CSS `color-mix()` to derive the text color, rather than used directly, so that the text reads darker/lighter than the outline itself. Because of this, a light `color` (e.g. `"yellow"`, `"lime"`) can still mix into low-contrast text against a light background, and a dark `color` can do the same against a dark background. Choose a `color` that stays legible after this mixing in both themes (see [WCAG 1.4.3](https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html)); the package cannot verify contrast for an arbitrary user-supplied color.


# Example

```julia
section_outline("Example:", "Finding the roots of a polynomial"; color="red")
```

```julia
md"\""
Let's find the roots of the polynomial ``x^2 - 4x + 4 = 0``.
""\"
```

```julia
f(x) = x^2 - 4x + 4
```

```julia
f(2.0)
```

> This looks like:
> 
> ![Screenshot of the section outline from the code above](https://i.imgur.com/2cYDNiv.png)

"""
function section_outline(
	section_text,
	title; 
	color="green",
	big::Bool=false,
	header_level::Int=2,
)
	header_contents = repr(MIME"text/html"(), @htl "$section_text $title")
	id = replace(header_contents, " " => "-") # see https://github.com/fonsp/Pluto.jl/pull/3243
	
	h = @htl("""
<$("h$header_level") id=$id class="ptt-section $(big ? "big" : "")" style="--ptt-accent: $(color);"><span>$(section_text)</span> $(title)</$("h$header_level")>
	
<style>
.ptt-section::before {
	content: "";
	display: block;
	position: absolute;
	left: -25px;
	right: -6px;
	top: -4px;
	height: 200px;
	border: 4px solid salmon;
	border-bottom: none;
	border-image-source: linear-gradient(to bottom, var(--ptt-accent), transparent);
	border-image-slice: 1;
	opacity: .7;
	pointer-events: none;
}

.big.ptt-section::before {
	height: 500px;
}
	

.ptt-section > span {
	color: color-mix(in hwb, var(--ptt-accent) 60%, black);
	@media (prefers-color-scheme: dark) {
		color: color-mix(in hwb, var(--ptt-accent) 30%, white);
	}
	font-style: italic;
}

	
</style>
""")

    # wrap it in a Markdown.MD object so that it can use the header ID copy feature: https://github.com/fonsp/Pluto.jl/pull/3264
	Markdown.MD(h)
end

