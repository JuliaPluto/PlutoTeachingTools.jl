export WidthOverDocs

""" Provides checkbox to toggle full width versus narrow with column for LiveDocs """
function WidthOverDocs(enabled::Bool=false, wide::Bool=false, lang::AbstractLanguage = default_language[])  # From PlutoThemes.jl
	checked = wide ? "checked" : ""
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
	       # max-width: calc(100% - 4rem);
               # margin-right: 2rem;
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
""")
end


"""
Display a full-screen confetti animation! The confetti will disappear automatically, and it will be fired every time the cell is re-run.

# Example

You can trigger this to celebrate a correct answer:

```julia
# make x a very large number
x = 5
```

The next cell would be hidden:
```julia
if x > 1000000
	confetti()
end
```

Note that `confetti()` "returns the confetti launcher", which should be the output value of a cell. So this will work:

```julia
let
	x = 1
	y = x + 2
	if y == 3
		confetti()
	end
end
```

But this will not:

```julia
let
	x = 1
	y = x + 2
	if y == 3
		confetti()
	end
	y
end
```
"""
function confetti()
	HTML("""
	<script>
	const {default: confetti} = await import( 'https://cdn.skypack.dev/canvas-confetti');
	confetti();
	// next line is unique on each render, to ensure that rendering is triggered each time.
	let hello = $(rand());
	</script>
	""")
end

export confetti

