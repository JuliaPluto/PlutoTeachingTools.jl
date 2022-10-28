### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ e9f1efa1-b3ee-4153-99e9-52233a8ad47e
using HypertextLiteral

# ╔═╡ 89469f3b-cb71-4143-a749-36ba8d39690b
using PlutoUI

# ╔═╡ f457888e-433a-4459-9723-725a1bd02ed4


# ╔═╡ 2308c8f3-72eb-4987-9df1-1dca91a856e0
#TableOfContents(include_definitions=true)

# ╔═╡ 3e7fddb1-5a9f-412c-a5b1-2bbba5b87d2f
TableOfContents()

# ╔═╡ aabf9f1b-5f6f-4862-ba4f-f4beaded8722
md"""
# Footnotes/Citations and Referneces
"""

# ╔═╡ 973a6460-2aa9-4d6b-b952-e9d66796cec2


# ╔═╡ aca85a13-53fe-4fc4-89e1-c3f1130714a3
#=
as found and discussed here
- https://hub.gke2.mybinder.org/user/fonsp-pluto-on-binder-o5onajv8/pluto/edit?id=f001628e-4bfb-11ed-04d7-892b7e9b1fe3&token=OG86wPs6Tn2cc0wPePWTPw#footnote-what_is_this
- https://github.com/JuliaPluto/PlutoUI.jl/issues/44
=#
footnoteSuperScript()=@htl("""
<style> 
pluto-notebook {
  counter-reset:  footnote footnote-title;
} 

a.footnote {
	font-weight: normal !important;
	font-size: 2 !important;
	vertical-align: super;
}
a.footnote::before {
	counter-increment: footnote;
	content: "" counter(footnote) "";
	font-size: 10px;
}


.footnote-title {
	font-size: 0 !important;
}
.footnote-title::before {
	counter-increment: footnote-title !important;
	content: "[" counter(footnote-title) "]" !important;
	font-size: 0.75rem !important;
}

</style>
""")

# ╔═╡ 85e01302-ac51-406d-9f0b-6e79cdd50305
footnoteSuperScript()

# ╔═╡ 72118d42-b732-4e7c-b48a-f4afb521de77


# ╔═╡ 7766c63b-1d79-4b5c-b91a-c44f74d8b9bb


# ╔═╡ c2e267f7-c52a-40f1-9168-e679215eff62
md"""
footnotes(useIEEE=false)=useIEEE ? footnoteIEEE() : 
"""

# ╔═╡ adfe06e8-7db6-406e-bd10-04521761f015
html"""
<a.footnote> asdsd </a.footnote>
"""

# ╔═╡ ead04ff2-14e1-44dc-8fe2-4ef23850b7d4


# ╔═╡ 033e5ccd-5257-4c95-be67-879bfea0b3f8
md"""
some words and [^Name2017] then [^steve2003] and more words
"""

# ╔═╡ b068e0ff-7afd-4449-b9bc-dc7177f7788a
md"""
asdasd [^Name2017]
"""

# ╔═╡ 338ee6a1-4e67-43fa-80cb-cf4e270afeac
md"""
asdasd [^footnote3]
"""

# ╔═╡ 63231aa8-01ca-484d-9298-9542bd9baf82
md"""
# look
"""

# ╔═╡ 913d2900-ab5c-4455-b521-12f3cf84be1e
md"""
[^Name2017]:words about name2017 footnote
[^steve2003]: some more words about academic 

[^footnote3]:3

"""

# ╔═╡ 31afeacc-c488-4807-a553-91ca2b4f9860


# ╔═╡ 1c855cb5-feea-4780-8271-e584683e291d


# ╔═╡ c305186e-8194-40ff-855b-3e69137f6038
md"""
hhhhhhhhhhh[^footnote6]
"""

# ╔═╡ 9b63216f-50fc-4b83-9d19-32d957de4a33
md"""
hhhhhhhhhhh[^footnote4]
"""

# ╔═╡ efa91bfd-f5fd-45d3-9030-58bfdacabda3
md"""
[^fn3]:some details about footnote1

[^footnote4]:academic writingasddddddddddd
"""

# ╔═╡ 8efaaf00-9099-4668-8e3f-0773eb1dbf47
const fotnotz_js = fotnotz -> @htl """
<script>
	
const indent = $(fotnotz.indent)
const aside = $(fotnotz.aside)
const title_text = $(fotnotz.title)
const include_definitions = $(fotnotz.include_definitions)
const fotnotzNode = html`<nav class="plutoui-fotnotz">
	<header>
	 <span class="fotnotz-toggle open-fotnotz"></span>
	 <span class="fotnotz-toggle closed-fotnotz"></span>
	 \${title_text}
	</header>
	<section></section>
</nav>`
fotnotzNode.classList.toggle("aside", aside)
fotnotzNode.classList.toggle("indent", indent)
const getParentCell = el => el.closest("pluto-cell")

const getHeaders = () => {
	const depth = Math.max(1, Math.min(6, $(fotnotz.depth))) // should be in range 1:6

	const range = Array.from({length: depth}, (x, i) => i+1) // [1, ..., depth]
	
	const selector = [
		...(include_definitions ? [
			`pluto-notebook pluto-cell .pluto-docs-binding`, 
			`pluto-notebook pluto-cell assignee:not(:empty)`, 
		] : []),
		...range.map(i => `pluto-notebook pluto-cell p.footnote-title`)
		].join(",")

		return Array.from(document.querySelectorAll(selector)).filter(el => 
		
		// exclude headers inside of a pluto-docs-binding block
		!(el.nodeName.startsWith("H") && el.closest(".pluto-docs-binding"))
	)
}
const document_click_handler = (event) => {
	const path = (event.path || event.composedPath())
	const fotnotz = path.find(elem => elem?.classList?.contains?.("fotnotz-toggle"))
	if (fotnotz) {
		event.stopImmediatePropagation()
		fotnotz.closest(".plutoui-fotnotz").classList.toggle("hide")
	}
}



document.addEventListener("click", document_click_handler)
const header_to_index_entry_map = new Map()
const currently_highlighted_set = new Set()
const last_fotnotz_element_click_time = { current: 0 }

const intersection_callback = (ixs) => {
	let on_top = ixs.filter(ix => ix.intersectionRatio > 0 && ix.intersectionRect.y < ix.rootBounds.height / 2)
	if(on_top.length > 0){
		currently_highlighted_set.forEach(a => a.classList.remove("in-view"))
		currently_highlighted_set.clear()
		on_top.slice(0,1).forEach(i => {
			let div = header_to_index_entry_map.get(i.target)
			div.classList.add("in-view")
			currently_highlighted_set.add(div)
			
			/// scroll into view
			/*
			const fotnotz_height = fotnotzNode.offsetHeight
			const div_pos = div.offsetTop
			const div_height = div.offsetHeight
			const current_scroll = fotnotzNode.scrollTop
			const header_height = fotnotzNode.querySelector("header").offsetHeight
			
			const scroll_to_top = div_pos - header_height
			const scroll_to_bottom = div_pos + div_height - fotnotz_height
			
			// if we set a scrollTop, then the browser will stop any currently ongoing smoothscroll animation. So let's only do this if you are not currently in a smoothscroll.
			if(Date.now() - last_fotnotz_element_click_time.current >= 2000)
				if(current_scroll < scroll_to_bottom){
					fotnotzNode.scrollTop = scroll_to_bottom
				} else if(current_scroll > scroll_to_top){
					fotnotzNode.scrollTop = scroll_to_top
				}
			*/
		})
	}
}

let intersection_observer_1 = new IntersectionObserver(intersection_callback, {
	root: null, // i.e. the viewport
  	threshold: 1,
	rootMargin: "-15px", // slightly smaller than the viewport
	// delay: 100,
})

let intersection_observer_2 = new IntersectionObserver(intersection_callback, {
	root: null, // i.e. the viewport
  	threshold: 1,
	rootMargin: "15px", // slightly larger than the viewport
	// delay: 100,
})

const render = (elements) => {
	header_to_index_entry_map.clear()
	currently_highlighted_set.clear()
	intersection_observer_1.disconnect()
	intersection_observer_2.disconnect()
		let last_level = `H1`
	return html`\${elements.map(h => {
	const parent_cell = getParentCell(h)
		let [className, title_el] = h.matches(`.pluto-docs-binding`) ? ["pluto-docs-binding-el", h.firstElementChild] : [h.nodeName, h]
	
	const a = html`<a 
		class="\${className}" 
		title="\${title_el.innerText}"
		href="#\${parent_cell.id}"
	>\${title_el.innerHTML}this is on the table</a>`

		
		
	a.onclick=(e) => {
		e.preventDefault();
		last_fotnotz_element_click_time.current = Date.now()
		h.scrollIntoView({
			behavior: 'smooth', 
			block: 'start'
		})
	}
	const row =  html`<div class="fotnotz-row \${className} after-\${last_level}">\${a}</div>`
		intersection_observer_1.observe(title_el)
		intersection_observer_2.observe(title_el)
		header_to_index_entry_map.set(title_el, row)
	if(className.startsWith("F"))
		last_level = className
		
	return row
})}`
}

const invalidated = { current: false }
const updateCallback = () => {
	if (!invalidated.current) {
		fotnotzNode.querySelector("section").replaceWith(
			html`<section>\${render(getHeaders())}</section>`
		)
	}
}
updateCallback()
setTimeout(updateCallback, 100)
setTimeout(updateCallback, 1000)
setTimeout(updateCallback, 5000)
const notebook = document.querySelector("pluto-notebook")
// We have a mutationobserver for each cell:
const mut_observers = {
	current: [],
}
const createCellObservers = () => {
	mut_observers.current.forEach((o) => o.disconnect())
	mut_observers.current = Array.from(notebook.querySelectorAll("pluto-cell")).map(el => {
		const o = new MutationObserver(updateCallback)
		o.observe(el, {attributeFilter: ["class"]})
		return o
	})
}
createCellObservers()

// And one for the notebook's child list, which updates our cell observers:
const notebookObserver = new MutationObserver(() => {
	updateCallback()
	createCellObservers()
})
notebookObserver.observe(notebook, {childList: true})

// And finally, an observer for the document.body classList, to make sure that the fotnotz also works when it is loaded during notebook initialization
const bodyClassObserver = new MutationObserver(updateCallback)
bodyClassObserver.observe(document.body, {attributeFilter: ["class"]})



// Hide/show the fotnotz when the screen gets small
let m = matchMedia("(max-width: 1000px)")
let match_listener = () => 
	fotnotzNode.classList.toggle("hide", m.matches)
match_listener()
m.addListener(match_listener)
invalidation.then(() => {
	invalidated.current = true
	intersection_observer_1.disconnect()
	intersection_observer_2.disconnect()
	notebookObserver.disconnect()
	bodyClassObserver.disconnect()
	mut_observers.current.forEach((o) => o.disconnect())
	document.removeEventListener("click", document_click_handler)
	m.removeListener(match_listener)
})
return fotnotzNode
</script>
""";

# ╔═╡ a38cf0fd-aca2-4ac0-b10a-90ee8ddbcf54
#\36 3231aa8-01ca-484d-9298-9542bd9baf82 > pluto-output > div > div > h1

# ╔═╡ 387a04f1-74ba-47cf-98ac-b3295971ca6e
const fotnotz_css = @htl """
<style>
@media not print {
.plutoui-fotnotz {
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Cantarell, Helvetica, Arial, "Apple Color Emoji",
		"Segoe UI Emoji", "Segoe UI Symbol", system-ui, sans-serif;
	--main-bg-color: #fafafa;
	--pluto-output-color: hsl(0, 0%, 36%);
	--pluto-output-h-color: hsl(0, 0%, 21%);
	--sidebar-li-active-bg: rgb(235, 235, 235);
	--icon-filter: unset;
}
@media (prefers-color-scheme: dark) {
	.plutoui-fotnotz {
		--main-bg-color: #303030;
		--pluto-output-color: hsl(0, 0%, 90%);
		--pluto-output-h-color: hsl(0, 0%, 97%);
		--sidebar-li-active-bg: rgb(82, 82, 82);
		--icon-filter: invert(1);
	}
}
.plutoui-fotnotz.aside {
	color: var(--pluto-output-color);
	position: fixed;
	right: 1rem;
	top: 17rem;
	width: min(80vw, 300px);
	padding: 0.5rem;
	padding-top: 0em;
	/* border: 3px solid rgba(0, 0, 0, 0.15); */
	border-radius: 10px;
	/* box-shadow: 0 0 11px 0px #00000010; */
	max-height: calc(100vh - 5rem - 90px);
	overflow: auto;
	z-index: 40;
	background-color: var(--main-bg-color);
	transition: transform 300ms cubic-bezier(0.18, 0.89, 0.45, 1.12);
}
.plutoui-fotnotz.aside.hide {
	transform: translateX(calc(100% - 28px));
}
.plutoui-fotnotz.aside.hide section {
	display: none;
}
.plutoui-fotnotz.aside.hide header {
	margin-bottom: 0em;
	padding-bottom: 0em;
	border-bottom: none;
}
}  /* End of Media print query */
.plutoui-fotnotz.aside.hide .open-fotnotz,
.plutoui-fotnotz.aside:not(.hide) .closed-fotnotz,
.plutoui-fotnotz:not(.aside) .closed-fotnotz {
	display: none;
}
@media (prefers-reduced-motion) {
  .plutoui-fotnotz.aside {
	transition-duration: 0s;
  }
}
.fotnotz-toggle {
	cursor: pointer;
    padding: 1em;
    margin: -1em;
    margin-right: -0.7em;
    line-height: 1em;
    display: flex;
}
.fotnotz-toggle::before {
    content: "";
    display: inline-block;
    height: 1em;
    width: 1em;
    background-image: url("https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.5.1/src/svg/list-outline.svg");
	/* generated using https://dopiaza.org/tools/datauri/index.php */
    background-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MTIiIGhlaWdodD0iNTEyIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiI+PHRpdGxlPmlvbmljb25zLXY1LW88L3RpdGxlPjxsaW5lIHgxPSIxNjAiIHkxPSIxNDQiIHgyPSI0NDgiIHkyPSIxNDQiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlOiMwMDA7c3Ryb2tlLWxpbmVjYXA6cm91bmQ7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZS13aWR0aDozMnB4Ii8+PGxpbmUgeDE9IjE2MCIgeTE9IjI1NiIgeDI9IjQ0OCIgeTI9IjI1NiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2U6IzAwMDtzdHJva2UtbGluZWNhcDpyb3VuZDtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlLXdpZHRoOjMycHgiLz48bGluZSB4MT0iMTYwIiB5MT0iMzY4IiB4Mj0iNDQ4IiB5Mj0iMzY4IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZTojMDAwO3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2Utd2lkdGg6MzJweCIvPjxjaXJjbGUgY3g9IjgwIiBjeT0iMTQ0IiByPSIxNiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2U6IzAwMDtzdHJva2UtbGluZWNhcDpyb3VuZDtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlLXdpZHRoOjMycHgiLz48Y2lyY2xlIGN4PSI4MCIgY3k9IjI1NiIgcj0iMTYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlOiMwMDA7c3Ryb2tlLWxpbmVjYXA6cm91bmQ7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZS13aWR0aDozMnB4Ii8+PGNpcmNsZSBjeD0iODAiIGN5PSIzNjgiIHI9IjE2IiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZTojMDAwO3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2Utd2lkdGg6MzJweCIvPjwvc3ZnPg==");
    background-size: 1em;
	filter: var(--icon-filter);
}
.aside .fotnotz-toggle.open-fotnotz:hover::before {
    background-image: url("https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.5.1/src/svg/arrow-forward-outline.svg");
	/* generated using https://dopiaza.org/tools/datauri/index.php */
    background-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MTIiIGhlaWdodD0iNTEyIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiI+PHRpdGxlPmlvbmljb25zLXY1LWE8L3RpdGxlPjxwb2x5bGluZSBwb2ludHM9IjI2OCAxMTIgNDEyIDI1NiAyNjggNDAwIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZTojMDAwO3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2Utd2lkdGg6NDhweCIvPjxsaW5lIHgxPSIzOTIiIHkxPSIyNTYiIHgyPSIxMDAiIHkyPSIyNTYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlOiMwMDA7c3Ryb2tlLWxpbmVjYXA6cm91bmQ7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZS13aWR0aDo0OHB4Ii8+PC9zdmc+");
}
.aside .fotnotz-toggle.closed-fotnotz:hover::before {
    background-image: url("https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.5.1/src/svg/arrow-back-outline.svg");
	/* generated using https://dopiaza.org/tools/datauri/index.php */
    background-image: url("data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MTIiIGhlaWdodD0iNTEyIiB2aWV3Qm94PSIwIDAgNTEyIDUxMiI+PHRpdGxlPmlvbmljb25zLXY1LWE8L3RpdGxlPjxwb2x5bGluZSBwb2ludHM9IjI0NCA0MDAgMTAwIDI1NiAyNDQgMTEyIiBzdHlsZT0iZmlsbDpub25lO3N0cm9rZTojMDAwO3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1saW5lam9pbjpyb3VuZDtzdHJva2Utd2lkdGg6NDhweCIvPjxsaW5lIHgxPSIxMjAiIHkxPSIyNTYiIHgyPSI0MTIiIHkyPSIyNTYiIHN0eWxlPSJmaWxsOm5vbmU7c3Ryb2tlOiMwMDA7c3Ryb2tlLWxpbmVjYXA6cm91bmQ7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZS13aWR0aDo0OHB4Ii8+PC9zdmc+");
}
.plutoui-fotnotz header {
	display: flex;
	align-items: center;
	gap: .3em;
	font-size: 1.5em;
	/* margin-top: -0.1em; */
	margin-bottom: 0.4em;
	padding: 0.5rem;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	/* border-bottom: 2px solid rgba(0, 0, 0, 0.15); */
	position: sticky;
	top: 0px;
	background: var(--main-bg-color);
	z-index: 41;
}
.plutoui-fotnotz.aside header {
	padding-left: 0;
	padding-right: 0;
}
.plutoui-fotnotz section .fotnotz-row {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	padding: .1em;
	border-radius: .2em;
}
.plutoui-fotnotz section .fotnotz-row.H1 {
	margin-top: 1em;
}
.plutoui-fotnotz.aside section .fotnotz-row.in-view {
	background: var(--sidebar-li-active-bg);
}
	
.highlight-pluto-cell-shoulder {
	background: rgba(0, 0, 0, 0.05);
	background-clip: padding-box;
}
.plutoui-fotnotz section a {
	text-decoration: none;
	font-weight: normal;
	color: var(--pluto-output-color);
}
.plutoui-fotnotz section a:hover {
	color: var(--pluto-output-h-color);
}
.plutoui-fotnotz.indent section a.H1 {
	font-weight: 700;
	line-height: 1em;
}
.plutoui-fotnotz.indent section .after-H2 a { padding-left: 10px; }
.plutoui-fotnotz.indent section .after-H3 a { padding-left: 20px; }
.plutoui-fotnotz.indent section .after-H4 a { padding-left: 30px; }
.plutoui-fotnotz.indent section .after-H5 a { padding-left: 40px; }
.plutoui-fotnotz.indent section .after-H6 a { padding-left: 50px; }
.plutoui-fotnotz.indent section a.H1 { padding-left: 0px; }
.plutoui-fotnotz.indent section a.H2 { padding-left: 10px; }
.plutoui-fotnotz.indent section a.H3 { padding-left: 20px; }
.plutoui-fotnotz.indent section a.H4 { padding-left: 30px; }
.plutoui-fotnotz.indent section a.H5 { padding-left: 40px; }
.plutoui-fotnotz.indent section a.H6 { padding-left: 50px; }
.plutoui-fotnotz.indent section a.pluto-docs-binding-el,
.plutoui-fotnotz.indent section a.ASSIGNEE
	{
	font-family: JuliaMono, monospace;
	font-size: .8em;
	/* background: black; */
	font-weight: 700;
    font-style: italic;
	color: var(--cm-var-color); /* this is stealing a variable from Pluto, but it's fine if that doesnt work */
}
.plutoui-fotnotz.indent section a.pluto-docs-binding-el::before,
.plutoui-fotnotz.indent section a.ASSIGNEE::before
	{
	content: "> ";
	opacity: .3;
}
</style>
""";


# ╔═╡ dc91ed5b-fd0f-447b-8f97-f694eb65bc11
html"""
<script>
var myStyle = document.createElement("style");
myStyle.innerHTML =
"
a.footnote::after {
	content: "(" counter(footnote) ")";
}
";
document.body.appendChild(myStyle);
</script>
"""

# ╔═╡ 8c3fe3f4-31f9-43b3-bf84-b7c92189aa6b
md"""
asdasd[^asdasd]
"""

# ╔═╡ b7de75a2-73f0-40df-a90c-9485b8a7e5f1
begin
	local result = begin
	Base.@kwdef struct Footnotes
		title::AbstractString="📚Footnotes"
		indent::Bool=true
		depth::Integer=3
		aside::Bool=true
		include_definitions::Bool=false
	end
	@doc """
	Generate Table of Contents using Markdown cells. Headers h1-h6 are used. 
	# Keyword arguments:
	`title` header to this element, defaults to "Table of Contents"
	`indent` flag indicating whether to vertically align elements by hierarchy
	`depth` value to limit the header elements, should be in range 1 to 6 (default = 3)
	`aside` fix the element to right of page, defaults to true
	# Examples:
	```julia
	TableOfContents()
	TableOfContents(title="Experiments 🔬")
	TableOfContents(title="📚 Table of Contents", indent=true, depth=4, aside=true)
	```
	"""
	Footnotes
	
	end
	function Base.show(io::IO, m::MIME"text/html", fotnotz::Footnotes)
		Base.show(io, m, @htl("$(fotnotz_js(fotnotz))$(fotnotz_css)"))
	end
	result
end

# ╔═╡ 9720f436-72a0-4fdf-9f99-0390b0f3248a
export Footnotes

# ╔═╡ d5107e12-083e-4f0e-9b94-a0ac15314d09
Footnotes()

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
HypertextLiteral = "~0.9.4"
PlutoUI = "~0.7.44"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.1"
manifest_format = "2.0"
project_hash = "ef2d44d9562fb349af7597f30b01a3bb0d2d6c18"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "595c0b811cf2bab8b0849a70d9bd6379cc1cfb52"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.4.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "6e33d318cf8843dade925e35162992145b4eb12f"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.44"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╠═e9f1efa1-b3ee-4153-99e9-52233a8ad47e
# ╠═f457888e-433a-4459-9723-725a1bd02ed4
# ╠═89469f3b-cb71-4143-a749-36ba8d39690b
# ╠═2308c8f3-72eb-4987-9df1-1dca91a856e0
# ╠═3e7fddb1-5a9f-412c-a5b1-2bbba5b87d2f
# ╟─aabf9f1b-5f6f-4862-ba4f-f4beaded8722
# ╠═973a6460-2aa9-4d6b-b952-e9d66796cec2
# ╠═aca85a13-53fe-4fc4-89e1-c3f1130714a3
# ╠═85e01302-ac51-406d-9f0b-6e79cdd50305
# ╠═72118d42-b732-4e7c-b48a-f4afb521de77
# ╠═7766c63b-1d79-4b5c-b91a-c44f74d8b9bb
# ╠═c2e267f7-c52a-40f1-9168-e679215eff62
# ╠═adfe06e8-7db6-406e-bd10-04521761f015
# ╠═ead04ff2-14e1-44dc-8fe2-4ef23850b7d4
# ╠═033e5ccd-5257-4c95-be67-879bfea0b3f8
# ╠═b068e0ff-7afd-4449-b9bc-dc7177f7788a
# ╠═338ee6a1-4e67-43fa-80cb-cf4e270afeac
# ╠═63231aa8-01ca-484d-9298-9542bd9baf82
# ╠═913d2900-ab5c-4455-b521-12f3cf84be1e
# ╠═31afeacc-c488-4807-a553-91ca2b4f9860
# ╠═1c855cb5-feea-4780-8271-e584683e291d
# ╠═c305186e-8194-40ff-855b-3e69137f6038
# ╠═9b63216f-50fc-4b83-9d19-32d957de4a33
# ╠═efa91bfd-f5fd-45d3-9030-58bfdacabda3
# ╠═8efaaf00-9099-4668-8e3f-0773eb1dbf47
# ╠═a38cf0fd-aca2-4ac0-b10a-90ee8ddbcf54
# ╠═387a04f1-74ba-47cf-98ac-b3295971ca6e
# ╠═dc91ed5b-fd0f-447b-8f97-f694eb65bc11
# ╠═8c3fe3f4-31f9-43b3-bf84-b7c92189aa6b
# ╠═b7de75a2-73f0-40df-a90c-9485b8a7e5f1
# ╠═9720f436-72a0-4fdf-9f99-0390b0f3248a
# ╠═d5107e12-083e-4f0e-9b94-a0ac15314d09
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
