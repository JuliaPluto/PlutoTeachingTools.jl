
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
"""
function aside(x; v_offset::Integer=0)
    width = get_aside_width()
    if get_aside_has_been_setup()
        @htl("""
      <aside class="plutoui-aside-wrapper" style="top: $(v_offset)px">
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
      <aside class="plutoui-aside-wrapper" style="top: $(v_offset)px">
      	<div>
      	$(x)
      	</div>
      </aside>
      """)
    end
end
