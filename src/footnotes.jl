### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ e6b00569-c72f-4e7b-8ca3-8044d61e68ee
#=
inpired by discussion and code found here

- https://hub.gke2.mybinder.org/user/fonsp-pluto-on-binder-o5onajv8/pluto/edit?id=f001628e-4bfb-11ed-04d7-892b7e9b1fe3&token=OG86wPs6Tn2cc0wPePWTPw#footnote-what_is_this

- https://github.com/JuliaPluto/PlutoUI.jl/issues/44
=#

# ╔═╡ 47055bc8-98c1-4da4-8349-6ee4e0180349
InlineFootnotesNumbered() = html"""
<script id="footnotes">

const addNumbersToInlineFootnotes = () => {


const inlinefootnotesNodes=document.querySelectorAll("a.footnote")
const bottomfootnoteNodes=document.getElementsByClassName("footnote-title")


const botttomFootnoteTextList=Array.from(bottomfootnoteNodes).map(x=>x.innerText);


//get the inline footers inner text so that we can match up with the 
const inlineFootnoteTextList=Array.from(inlinefootnotesNodes)
.map(x=>x.innerText)


//add square brackets to match the inline footnotes
const botttomFootnoteTextListWithBrackets=botttomFootnoteTextList.map(x=>"["+x+"]");


//find the number which we want to display inline
var inlineFootnoteTextListWithNumbers = inlineFootnoteTextList
.map((x,index)=>{

const indexOfBottomFootnote = botttomFootnoteTextListWithBrackets.indexOf(x)
const indexOfBottomFootnotePlus1 = indexOfBottomFootnote+1
const element = inlinefootnotesNodes[index]

//modify the element before part depending on if we find a match
if (indexOfBottomFootnote<0) 
{//if we don't find a match display an error
	element.setAttribute("data-before","["+"ERROR! no matching reference"+"]")
}
else 
{//if we do add the number and make the label disapear by sizing it to 0px
	element.setAttribute("data-before","["+indexOfBottomFootnotePlus1+"]")
}

return indexOfBottomFootnotePlus1

})

}//end of function addNumbersToInlineFootnotes








//run everytime "something" is done so that it updates dynamically/reactively
//2022/10/28
//all of the below was taken from Table of Contents in PlutoUI 
const invalidated = { current: false }
const updateCallback = () => {
	if (!invalidated.current) {
		addNumbersToInlineFootnotes()
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




</script>
<style> 
a.footnote {
	font-size: 0 !important;
}
a.footnote::before {
	content: attr(data-before) ;
	font-size: 10px;
}
</style>
"""


# ╔═╡ 2e3d0bbd-9c1f-4d42-a726-f9b70d89b7fe
export InlineFootnotesNumbered 

# ╔═╡ 3e102434-e413-409b-846c-fe0afa466947
BottomFootnotesNumbered() =html"""
<style> 
pluto-notebook {
  counter-reset:  footnote-title;
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
"""

# ╔═╡ 2db43318-7e99-4e30-8ca1-e78eb5574d11
export BottomFootnotesNumbered 

# ╔═╡ 25e12914-b0c3-4a62-9156-e586c5c062b5
export InlineAndBottomFootnotesNumbered

# ╔═╡ 80182cc4-64d1-4f06-b8bb-bd2e386e8368
function InlineAndBottomFootnotesNumebred() 
	return (BottomFootnotesNumbered(),InlineFootnotesNumbered())
end

# ╔═╡ 40371532-1320-42fc-9e57-066e1d9fbbda
InlineFootnotesStyleSuperScript()=html"""
<style> 


a.footnote {
	vertical-align: super;
}


</style>
"""

# ╔═╡ d2180e45-2e07-404a-98fb-e703a7b6d84c
export InlineFootnotesStyleSuperScript 

# ╔═╡ c2a3a813-409b-48c6-9482-dbe7f20f19bb
InlineFootnotesStyleSubScript()=html"""
<style> 


a.footnote {
	vertical-align: sub;
}


</style>
"""

# ╔═╡ 659cae55-bf5c-4b85-83fd-8bcb32874874
export InlineFootnotesStyleSubScript  

# ╔═╡ 16ca0710-2fd1-41b8-a896-62ea46770c43
InlineFootnotesStyleBaseline()=html"""
<style> 


a.footnote {
	vertical-align: sub;
}


</style>
"""

# ╔═╡ ca383eff-fc8e-47ce-b6b7-3780967f2c1d
export InlineFootnotesStyleBaseline 

# ╔═╡ 3482aaf5-11ca-452c-ad32-2dbdab789496


# ╔═╡ 808265f1-e048-4704-9345-13a9d7c674aa
md"""
# Examples/Intended Use
### first we call the functions
"""

# ╔═╡ d0339220-e5ce-4bb1-b9de-39c8a726b1ce
InlineFootnotesNumbered()

# ╔═╡ 5e95baef-b8b6-4416-b583-ce2410a91b7c
BottomFootnotesNumbered()

# ╔═╡ 98935dba-c0b2-4837-bee7-120777c9ac18
InlineFootnotesStyleSubScript()

# ╔═╡ 6758b159-c225-4e2f-8859-8d3f1871ba7a
md"""
### then we create some inline footnotes. 

look this is footnote1[^footnote1], here is another one [^info]. 
"""

# ╔═╡ a823aee0-6b83-4be0-8456-b1c5cf095e70
md"""
we can refer/label them whatever we want[^xyz]. Here is the first one again[^footnote1] notice how the reference number is still one. if there is no footnote title/info found then an error is shown[^ahh] Oh No!
"""

# ╔═╡ e911ca05-774a-4efa-bdd7-257b705983e8
md"""
### lastly, create the footnote info/title (that ususally appear at the bottom of the page)
"""

# ╔═╡ 32cc9b46-d9f4-4e6e-a0e6-273b17bb76f5
md"""
[^footnote1]: this is the detail about footnote 1
"""

# ╔═╡ 3fefc29d-5ad3-46bf-9b03-cce615d21083
md"""
[^info]: here is some extra info - foonotes are fun
[^xyz]: author-some guy, age 28,  
"""

# ╔═╡ ddd3e869-a44a-428f-845a-139c288e6252


# ╔═╡ cf8d37ef-4fba-4e05-9463-56c6c7c48000


# ╔═╡ 31c15329-b9f0-4195-99e7-71773cd1026d


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.1"
manifest_format = "2.0"
project_hash = "da39a3ee5e6b4b0d3255bfef95601890afd80709"

[deps]
"""

# ╔═╡ Cell order:
# ╠═e6b00569-c72f-4e7b-8ca3-8044d61e68ee
# ╠═2e3d0bbd-9c1f-4d42-a726-f9b70d89b7fe
# ╟─47055bc8-98c1-4da4-8349-6ee4e0180349
# ╠═2db43318-7e99-4e30-8ca1-e78eb5574d11
# ╟─3e102434-e413-409b-846c-fe0afa466947
# ╠═25e12914-b0c3-4a62-9156-e586c5c062b5
# ╠═80182cc4-64d1-4f06-b8bb-bd2e386e8368
# ╠═d2180e45-2e07-404a-98fb-e703a7b6d84c
# ╟─40371532-1320-42fc-9e57-066e1d9fbbda
# ╠═659cae55-bf5c-4b85-83fd-8bcb32874874
# ╟─c2a3a813-409b-48c6-9482-dbe7f20f19bb
# ╠═ca383eff-fc8e-47ce-b6b7-3780967f2c1d
# ╟─16ca0710-2fd1-41b8-a896-62ea46770c43
# ╠═3482aaf5-11ca-452c-ad32-2dbdab789496
# ╟─808265f1-e048-4704-9345-13a9d7c674aa
# ╠═d0339220-e5ce-4bb1-b9de-39c8a726b1ce
# ╠═5e95baef-b8b6-4416-b583-ce2410a91b7c
# ╠═98935dba-c0b2-4837-bee7-120777c9ac18
# ╠═6758b159-c225-4e2f-8859-8d3f1871ba7a
# ╠═a823aee0-6b83-4be0-8456-b1c5cf095e70
# ╟─e911ca05-774a-4efa-bdd7-257b705983e8
# ╟─32cc9b46-d9f4-4e6e-a0e6-273b17bb76f5
# ╟─3fefc29d-5ad3-46bf-9b03-cce615d21083
# ╠═ddd3e869-a44a-428f-845a-139c288e6252
# ╠═cf8d37ef-4fba-4e05-9463-56c6c7c48000
# ╠═31c15329-b9f0-4195-99e7-71773cd1026d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
