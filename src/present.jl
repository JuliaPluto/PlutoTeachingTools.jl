
# Borrowed/adapted from https://andreaskroepelin.de/blog/plutoslides/
export present_button
export Foldable
export TwoColumn, ThreeColumn

# My Minimal tweaks
export TwoColumnWideLeft, TwoColumnWideRight
export ChooseDisplayMode # combines present_button and WidthOverDocs

function present_button(lang::AbstractLanguage = default_language[]) 
    txt = present_str(lang)
    htl"<button onclick='present()'>$txt</button>"
end

struct Foldable{C}
    title::String
    content::C
end

function Base.show(io, mime::MIME"text/html", fld::Foldable)
    write(io,"<details><summary>$(fld.title)</summary><p>")
    show(io, mime, fld.content)
    write(io,"</p></details>")
end

struct TwoColumn{L, R}
    left::L
    right::R
end

function Base.show(io, mime::MIME"text/html", tc::TwoColumn)
    write(io, """<div style="display: flex;"><div style="flex: 50%;">""")
    show(io, mime, tc.left)
    write(io, """</div><div style="flex: 50%;">""")
    show(io, mime, tc.right)
    write(io, """</div></div>""")
end

struct TwoColumnWideLeft{L, R}
    left::L
    right::R
end

function Base.show(io, mime::MIME"text/html", tc::TwoColumnWideLeft)
    write(io, """<div style="display: flex;"><div style="flex: 66%;">""")
    show(io, mime, tc.left)
    write(io, """</div><div style="flex: 34%;">""")
    show(io, mime, tc.right)
    write(io, """</div></div>""")
end

struct TwoColumnWideRight{L, R}
    left::L
    right::R
end

function Base.show(io, mime::MIME"text/html", tc::TwoColumnWideRight)
    write(io, """<div style="display: flex;"><div style="flex: 34%;">""")
    show(io, mime, tc.left)
    write(io, """</div><div style="flex: 66%;">""")
    show(io, mime, tc.right)
    write(io, """</div></div>""")
end

struct ThreeColumn{L, C, R}
    left::L
    center::C
    right::R
end

function Base.show(io, mime::MIME"text/html", tc::ThreeColumn)
    write(io, """<div style="display: flex;"><div style="flex: 33%;">""")
    show(io, mime, tc.left)
    write(io, """</div><div style="flex: 34%;">""")
    show(io, mime, tc.center)
    write(io, """</div><div style="flex: 33%;">""")
    show(io, mime, tc.right)
    write(io, """</div></div>""")
end

""" Provides checkbox to toggle full width and present mode. """
function ChooseDisplayMode(;wide::Bool=false, present::Bool = false, lang::AbstractLanguage = default_language[])  # Adapted from PlutoThemes.jl
        checked = wide ? "checked" : ""
        checked_present_mode = present ? "checked" : ""
        init = wide ? "toggle_width(document.getElementById('width-over-livedocs'))" : ""
        return HTML("""
<!-- https://github.com/fonsp/Pluto.jl/issues/400#issuecomment-695040745 -->
<input
        type="checkbox"
        id="width-over-livedocs"
        name="width-over-livedocs"
    onclick="window.plutoOptIns.toggle_width(this)"
        $(checked)>
<label for="width-over-livedocs">
        $(full_width_mode_str(lang))
</label>
<style>
        body.width-over-docs #helpbox-wrapper {
        display: none !important;
        }
        body.width-over-docs main {
               max-width: none !important;
               margin: 0 !important;
                #max-width: 1100px;
                #max-width: calc(100% - 4rem);
                #align-self: flex-star;
                #margin-left: 50px;
                #margin-right: 2rem;
        }
</style>
<script>
        const toggle_width = function(t) {
                t.checked
                ? document.body.classList.add("width-over-docs")
                : document.body.classList.remove("width-over-docs") }
        window.plutoOptIns = window.plutoOptIns || {}
        window.plutoOptIns.toggle_width = toggle_width
        $(init)
</script>
&nbsp; &nbsp; &nbsp;
<input
        type="checkbox"
        id="present-mode"
        name="present-mode"
        onclick="present()"
        $(checked_present_mode)>
<label for="present_mode">
        $(present_mode_str(lang))
</label>

""")
end


