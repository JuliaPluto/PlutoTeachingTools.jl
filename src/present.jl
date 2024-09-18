
# Borrowed/adapted from https://andreaskroepelin.de/blog/plutoslides/

function present_button(lang::AbstractLanguage=default_language[])
    txt = present_str(lang)
    htl"<button onclick='present()'>$txt</button>"
end

struct Foldable{C}
    title::String
    content::C
end

function Base.show(io, mime::MIME"text/html", fld::Foldable)
    write(io, "<details><summary>$(fld.title)</summary><p>")
    show(io, mime, fld.content)
    write(io, "</p></details>")
    return nothing
end

function Columns(cols...; widths=nothing, gap = 2)
    ncols = length(cols)
    ngaps = ncols - 1
    if isnothing(widths)
        widths = fill(100/ncols, ncols)
    end
    if gap > 0 # adjust widths if gaps are desired
        widths = widths / sum(widths) * (100 - gap*ngaps)
    end
    
    columns = [
        DivElement(children=[cols[i]], style="display: flex; flex: 0 1 $(widths[i])%") for i ∈ 1:ncols
    ]
    the_gap = DivElement(children = [], style="display: flex; flex: 0 0 $gap%" )

    # insert gaps between columns
    # i.e. [a, b, c] ==> [a, gap, b, gap, c]
    children = vec([reshape(columns, 1, :); fill(the_gap, 1, ncols)])[1:end-1]
    
    DivElement(; children,
          style="display: flex; flex-direction: row;"
    )
end

# for backwards compatibility
TwoColumn(a, b; kwargs...) = Columns(a, b; kwargs...)

ThreeColumn(a, b, c; kwargs...) = Columns(a, b, c; kwargs...)

TwoColumnWideLeft(a, b; kwargs...) = Columns(a, b; widths = [66, 34], kwargs...)

TwoColumnWideRight(a, b; kwargs...) = Columns(a, b; widths = [34, 66], kwargs...)

""" Provides checkbox to toggle full width and present mode. """
function ChooseDisplayMode(;
    wide::Bool=false, present::Bool=false, lang::AbstractLanguage=default_language[]
)  # Adapted from PlutoThemes.jl
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
