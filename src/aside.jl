"""
Displays text on right hand side of Pluto notebook.
Optional `v_offset` allows shifting down (positive) or up (negative).
Optional integer parameter `width` defaults to 300px.
Often combined with `tip(md"text")`.
"""
function aside(x; width=300, v_offset = 0)

    id = String(rand('a':'z', 10))
    PlutoUI.ExperimentalLayout.Div([
        @htl("""
        <style>
        @media (min-width: calc(700px + 30px + $(width)px)) {
            .plutoui-aside-wrapper.id-$(id) {
                position: absolute;
                right: -11px;
                width: 0px;
                top: $(v_offset)px;
                transform: translate(0, -40%);
            }
            .plutoui-aside-wrapper.id-$(id) > div {
                width: $(width)px;
            }
        }
        </style>
        """),
        
        PlutoUI.ExperimentalLayout.Div([
            PlutoUI.ExperimentalLayout.Div([
                x
            ])
        ]; class="plutoui-aside-wrapper id-$(id)")
    ])
end
