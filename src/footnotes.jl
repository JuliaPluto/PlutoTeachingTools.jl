### A Pluto.jl notebook ###
# v0.19.14

using Markdown
using InteractiveUtils

# ╔═╡ 0f8276fd-9dd8-4ada-bec5-7b1990afdf19


# ╔═╡ 626cabc5-e46c-4f66-b3dd-f3afe99f5fe5
md"""
asdasd[^abc]uuwwwuuuuu("kjhgfd")
"""

# ╔═╡ b1128729-0efe-4e5f-9e12-0ddbeb9d604c
md"""
asdasd[^aaa]iuasyasasasdasdsssss("kjhgfd")
"""

# ╔═╡ ee33cf59-2777-422f-b886-1c191433286a
md"""
asdasd[^abc]iuasasdasdadsyasassssss("kjhgfd")
"""

# ╔═╡ fab1d84f-3064-49f8-bbbb-f825f78f02ed
md"""
asdasd[^abc3]iuasyasassssss("kjhgfd")
"""

# ╔═╡ eb2e4383-d4ec-43ee-b030-f1a95b400e7f
md"""
asdasd[^bbb]rryd("kjhgfd")
"""

# ╔═╡ 47582cfd-73cf-4a11-a511-50b406aa758a
md"""
asdasd[^abc]cite("kjhgfd")[^abc]zsdg ("kjhgfd")
"""

# ╔═╡ 8b9834c8-1747-4503-81fe-d525bc5f25bd
md"""
[^abc2]: 098iom("kjhgfd")
"""

# ╔═╡ c1b59097-a575-4797-a24a-3b13d26f3c1a
md"""
[^abc]: 5d4t79jhgfd")
"""

# ╔═╡ a1f03f0b-f17c-4f05-87be-edb128187aee
md"""
[^aaa]: 46a=timotot")
"""

# ╔═╡ 3db1db88-d9a5-4e2c-84ac-e9ac746d3eaf
md"""
[^abc3]: 46d5jhgfd")
"""

# ╔═╡ e6b00569-c72f-4e7b-8ca3-8044d61e68ee


# ╔═╡ 47055bc8-98c1-4da4-8349-6ee4e0180349
html"""
<script id="w">

const addNumbersToInlineFootnotes = () => {
console.log("\n\n\n\n\n\n\n\nstart")

const inlinefootnotesNodes=document.querySelectorAll("a.footnote")
const bottomfootnoteNodes=document.getElementsByClassName("footnote-title")

const botttomFootnoteTextList=Array.from(bottomfootnoteNodes).map(x=>x.innerText);

//square brackets to match the inline footnotes
const botttomFootnoteTextListWithBrackets=botttomFootnoteTextList.map(x=>"["+x+"]");





const inlineFootnoteTextList=Array.from(inlinefootnotesNodes)
.map(x=>x.innerText)
console.log(inlineFootnoteTextList)



//find the number which we want to display inline
var inlineFootnoteTextListWithNumbers = inlineFootnoteTextList
.map((x,index)=>{

const indexOfBottomFootnote = botttomFootnoteTextListWithBrackets.indexOf(x)
//botttomFootnoteTextListWithBrackets.findIndex(y=>y==x,x)

const number = indexOfBottomFootnote+1

const element = inlinefootnotesNodes[index]

//modify the element before part
if (indexOfBottomFootnote<0) 
{
	element.setAttribute("data-before","["+"ERROR! no matching reference"+"]")
	element.style.setProperty("font-size","11px")
}
else
{
	element.setAttribute("data-before","["+number+"]")
	element.style.setProperty("font-size","0px")
	console.log(element)
}

return number

})
console.log(inlineFootnoteTextListWithNumbers)

}








//run everytime "something" is done so that it updates dynamically/reactively
//Code taken from Table of Contents
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
"""


# ╔═╡ 40371532-1320-42fc-9e57-066e1d9fbbda
#=
as found and discussed here
- https://hub.gke2.mybinder.org/user/fonsp-pluto-on-binder-o5onajv8/pluto/edit?id=f001628e-4bfb-11ed-04d7-892b7e9b1fe3&token=OG86wPs6Tn2cc0wPePWTPw#footnote-what_is_this
- https://github.com/JuliaPluto/PlutoUI.jl/issues/44
=#
footnoteSuperScript()=html"""
<style> 
pluto-notebook {
  counter-reset:  footnote footnote-title;
} 

a.footnote {
	font-weight: normal !important;
	font-size: 10px ;
	vertical-align: super;
}
a.footnote::before {
	content: attr(data-before) ;
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
"""

# ╔═╡ 4740632d-9ef2-4718-a99f-4816f4a18d9d
footnoteSuperScript()

# ╔═╡ 808265f1-e048-4704-9345-13a9d7c674aa


# ╔═╡ d0339220-e5ce-4bb1-b9de-39c8a726b1ce


# ╔═╡ 2f53f42d-bfe0-4e9f-a834-49bf510cbf77
md"""
# old javascript code
"""

# ╔═╡ 4c4b016a-a8ec-4f15-82d6-71ff843be811
//adjust zero based index
var inlineFootnoteTextListWithNumbersPlus1 = inlineFootnoteTextListWithNumbers
.map(x=>x+1)
console.log(inlinefootnotesNodes)


//Add style for inline fornotes to hide label/reference and just show numbers
document.querySelectorAll(".footnote").forEach(x=>{
x.style.content='red'
})

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
# ╠═0f8276fd-9dd8-4ada-bec5-7b1990afdf19
# ╠═626cabc5-e46c-4f66-b3dd-f3afe99f5fe5
# ╠═b1128729-0efe-4e5f-9e12-0ddbeb9d604c
# ╠═ee33cf59-2777-422f-b886-1c191433286a
# ╠═fab1d84f-3064-49f8-bbbb-f825f78f02ed
# ╠═eb2e4383-d4ec-43ee-b030-f1a95b400e7f
# ╠═47582cfd-73cf-4a11-a511-50b406aa758a
# ╠═8b9834c8-1747-4503-81fe-d525bc5f25bd
# ╠═c1b59097-a575-4797-a24a-3b13d26f3c1a
# ╠═a1f03f0b-f17c-4f05-87be-edb128187aee
# ╠═3db1db88-d9a5-4e2c-84ac-e9ac746d3eaf
# ╠═4740632d-9ef2-4718-a99f-4816f4a18d9d
# ╠═e6b00569-c72f-4e7b-8ca3-8044d61e68ee
# ╠═47055bc8-98c1-4da4-8349-6ee4e0180349
# ╠═40371532-1320-42fc-9e57-066e1d9fbbda
# ╠═808265f1-e048-4704-9345-13a9d7c674aa
# ╠═d0339220-e5ce-4bb1-b9de-39c8a726b1ce
# ╟─2f53f42d-bfe0-4e9f-a834-49bf510cbf77
# ╠═4c4b016a-a8ec-4f15-82d6-71ff843be811
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
