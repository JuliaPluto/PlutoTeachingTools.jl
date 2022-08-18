export WidthOverDocs

""" Provides checkbox to toggle full width versus narrow with column for LiveDocs """
function WidthOverDocs(enabled::Bool=false, wide::Bool=false)  # From PlutoThemes.jl
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
	Full Width Mode 
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
