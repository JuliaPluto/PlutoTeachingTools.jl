
aside_has_been_setup = false
get_aside_has_been_setup()::Bool = aside_has_been_setup
set_aside_has_been_setup(b::Bool=true) = aside_has_been_setup = b

aside_width = 300
get_aside_width()::Int64 = aside_width
"""
Changes width of all aside's
"""
function set_aside_width(width::Integer)
    aside_width = width
    set_aside_has_been_setup(true)
    @htl("""
      <style>
       @media (min-width: calc(700px + 30px + $(width)px)) {
          aside.plutoui-aside-wrapper {
                  position: absolute;
                  right: -11px;
                  width: 0px;
          }
          aside.plutoui-aside-wrapper > div {
                  width: $(width)px;
          }
       }
       </style>
    """)
end

"""
Displays text on right hand side of Pluto notebook.
Optional `v_offset` allows shifting down (positive) or up (negative).
Optional integer parameter `width` defaults to 300px.
Often combined with `tip(md"text")`.

Since the `<aside>` is absolutely positioned outside the normal document
flow (to float it beside the main content for sighted readers), assistive
technology that walks the page in linear reading order may not encounter
it where a sighted reader would expect. An `aria-label` is included so
that a screen reader user who reaches it via a landmarks list still gets
a clear description of the region. Because of this, content passed to
`aside` should be supplementary/non-critical: don't put anything here
that a reader needs in order to follow the main flow of the notebook.
"""
function aside(x; v_offset::Integer=0)
    width = get_aside_width()
    if get_aside_has_been_setup()
        @htl("""
      <aside class="plutoui-aside-wrapper" aria-label="Aside" style="top: $(v_offset)px">
      	<div>
      	$(x)
      	</div>
      </aside>
      """)
    else
        set_aside_has_been_setup(true)
        @htl("""
     <style>
      @media (min-width: calc(700px + 30px + $(width)px)) {
         aside.plutoui-aside-wrapper {
                 position: absolute;
                 right: -11px;
                 width: 0px;
         }
         aside.plutoui-aside-wrapper > div {
                 width: $(width)px;
         }
      }
      </style>
      <aside class="plutoui-aside-wrapper" aria-label="Aside" style="top: $(v_offset)px">
      	<div>
      	$(x)
      	</div>
      </aside>
      """)
    end
end
