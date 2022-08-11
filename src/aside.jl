export aside

"""
Displays text on right hand side of Pluto notebook.
Optional v_offset allows shifting up or down.
"""
function aside(x; v_offset=0)
    @htl("""
     <style>
     @media (min-width: calc(700px + 30px + 300px)) {
     	aside.plutoui-aside-wrapper {
     		position: absolute;
     		right: -11px;
     		width: 0px;
     	}
     	aside.plutoui-aside-wrapper > div {
     		width: 300px;
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

