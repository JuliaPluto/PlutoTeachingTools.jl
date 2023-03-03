### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 657c3eea-1ef6-11ed-3e82-5daad2bc19a1
begin
	import Pkg
	Pkg.add("PlutoUI")
	Pkg.develop("PlutoTeachingTools")
	using PlutoUI, PlutoTeachingTools
	
	# PlutoTeachingTools looks up language based on ENV["LANG"]
	# Uncomment a line below to override default language
	#set_language!(PlutoTeachingTools.EnglishUS())      # default
	#set_language!(PlutoTeachingTools.GermanGermany())  
	
	pkg_cell_link = "#" * (PlutoRunner.currently_running_cell_id[] |> string)
end;

# ╔═╡ cd581a51-fb2b-4579-9a7d-0d723ad5d467
md"# PlutoTeachingTools.jl Examples"

# ╔═╡ f0704e56-7e97-4c92-bbdd-76d7a873e6d8
TableOfContents()   # from PlutoUI

# ╔═╡ d173896e-021a-4b2c-b913-62c5a2320341
md"""
## Common Note Boxes
"""

# ╔═╡ 8c3f1fe2-c934-4743-b30b-07dc97aeac46
almost(md"You're right that the answer is a positive number, but the value isn't quite right.")

# ╔═╡ b48468f0-eeaa-4e1a-ad0b-3cfe42b6ab15
correct()

# ╔═╡ 4f968b5c-cb11-4d22-ad5b-5ec9c7c94c87
danger(md"Don't forget to commit your saved notebook to your repository.")

# ╔═╡ 9ceaa0a3-0e68-4373-add9-49b6fa908b39
hint(md"It may be useful to make use of the identity $\sin \theta^2 + \cos \theta^2 =1$.")

# ╔═╡ cbea3a7b-522d-4f6e-908a-6baec22a9ce3
keep_working()

# ╔═╡ cf73022f-abfd-407c-bcb4-989b54b5dd03
still_missing()

# ╔═╡ 319dacff-fdfb-4d0b-918f-d389e4ac81fd
still_nothing()

# ╔═╡ 343eff72-62b0-4cd1-abd9-991245d4054a
tip(md"Think back to exercise 1.")

# ╔═╡ 12619e7d-5360-4d71-9a2d-5cf0385f0bcf
question_box(md"Why does the stone have a greater force?")

# ╔═╡ 8eb551ef-a9c0-43e3-aea7-d83679436e93
answer_box(
md"""
The stone has a greater force becasue force is give by Newtons 2nd law: 

```math
F=m \times a
```

It has a greater mass, therefore $m$ is larger, this then results in a larger force $F$
"""
)

# ╔═╡ 947ce2c8-42e3-4704-89b2-c1968077212b
warning_box(md"Be extra careful here.")

# ╔═╡ 4758e75c-1729-4dab-964c-7a2ee9798534
TODO("Remember to add good documentation.")

# ╔═╡ 39766d40-81a8-498b-83d9-c6f27c131db7
TODO("Remember to add good documentation.", heading="TODO #2")

# ╔═╡ 8e053634-bca8-46eb-9202-8ab276dcad12
md"""
## Checking variables are defined
"""

# ╔═╡ c7c3f53e-435a-4ded-a420-04476adfae1c
var_not_defined(:x)

# ╔═╡ d5b25395-1929-46a7-bfed-1327c650a7a5
func_not_defined(:calc_x)

# ╔═╡ 9ca655cd-2919-4be5-b4de-edcb10d20e3e
not_defined(:x) # deprecated

# ╔═╡ 79f4a49c-4ea3-4888-afaf-7860b883ef38
md"""
## Checking variable types
"""

# ╔═╡ 438c621a-1991-476f-9889-55c053941e1b
a= 1

# ╔═╡ 1381ca68-cc1d-4fe7-9587-ee13a5db92ab
type_eq(a, Float64)

# ╔═╡ b52ff55b-3a8a-44e6-9bf6-2b6f9dda5e33
type_isa(a,Real)

# ╔═╡ 0cb5c037-8c2f-4fca-a999-63f9a4f9b891
wrong_type(:a,Float64)

# ╔═╡ 4a380230-f977-4ff7-9114-9d4075bba240
eval(Meta.parse(PlutoTeachingTools.code_for_check_type_funcs))

# ╔═╡ 42cb6d16-98e0-4ea8-8b54-370df71fe54e
display_msg_if_fail(check_type_isa(:a,a,Float64))

# ╔═╡ 1f3e04b4-28f9-4bb8-a233-fd061ac2ee75
display_msg_if_fail(check_type_isa(:a,a,Int64))  # should display nothing

# ╔═╡ db745245-805a-478b-b3f5-c7974fab0e9c
md"""
## Checking responces
"""

# ╔═╡ d1c7c926-7000-4ee3-8d9c-cb03d2dd8ae9
response_1 = missing # replace with your answer

# ╔═╡ 8f980fa3-559e-491d-8a84-34a4678fa53d
if ismissing(response_1)  still_missing() end

# ╔═╡ 5f95518f-62cd-4869-b6cf-85a7860f38ec
response_2 = "Insert your response here."

# ╔═╡ 3e12dbd9-f02a-479d-9eff-234ac88e059b
PlutoTeachingTools.keep_working_if_var_contains_substr(:response_2,response_2,"Insert your")

# ╔═╡ c8811462-874c-47da-bb34-797234046fdf
PlutoTeachingTools.keep_working_if_var_contains_substr(:response_2,response_2,"should display nothing")

# ╔═╡ cccaff2f-3fa0-45f2-9fa6-cf8a21ade844
md"""
## Foldable content
"""

# ╔═╡ c46d1e7c-df6e-460e-a103-a486d27932c9
Foldable("Want more?",md"Extra info")

# ╔═╡ fb4ff876-a668-40ab-8d30-bfaa858849e4
protip(md"The `CSV.read` function has lots of useful optional arguements.")

# ╔═╡ 69a9e9f3-a72e-4935-a200-2842010f1e54
protip(md"Several of these functions have optional arguements.","Invitation to learn more")

# ╔═╡ 08794ef8-4e10-4913-808e-06ac194625b6
md"""
## Aside
"""

# ╔═╡ 77bb3822-2a1d-4e23-b852-6b6202069efa
aside(tip(md"Extra information to consider.") )

# ╔═╡ cc66ef97-36f2-478c-961b-dd8ab2bda4ac
aside(tip(md"Even more information to consider."),v_offset=100)

# ╔═╡ 0b2a4490-7e29-42c0-af9a-e99b5540d154
set_aside_width(400)

# ╔═╡ 88b9d474-3449-4931-ac39-4dc377c04abd
md"""
## Markdown / LaTeX / HTML hacks
"""

# ╔═╡ f49ccb75-7cb8-49ce-95b9-ed59033a589d
A = rand(2,2)

# ╔═╡ af5673b5-a7f9-4033-ac9b-845254f62c98
md"Now, you can include variables like $A=$ $(latexify_md(A)) inside markdown."

# ╔═╡ 8fcfe710-ac2b-4282-85c6-d3b8800fa53a
eqn_str = "x^2+y^2 = z^2"

# ╔═╡ 7390e4a7-0561-4611-b3c1-9b83601c5805
md"And you can grab equations in variables like $(wrap_tex(eqn_str)) inside markdown."

# ╔═╡ a05aa377-a201-4670-aae9-8de4059b67cb
md"#### Heading $nbsp $nbsp with extra space"

# ╔═╡ 25066f0b-7100-431c-8695-70005738bbfd
md"#### Multi-line $br heading"  # actually from PlutoUI

# ╔═╡ d7593309-3462-4dba-8275-c2eb76b4c3fe
md"""
## Multiple Columns
"""

# ╔═╡ fc5789dd-4b86-4007-9771-a6246235fd73
TwoColumn(md"Left col", md"Right col")

# ╔═╡ 2881e5de-f6b7-47c0-a794-3e0fa57b712b
ThreeColumn(md"Left col", md"Middle col", md"Right col")

# ╔═╡ 0e1e62a6-3b78-4415-89fe-fa17279fddbf
TwoColumnWideLeft(md"Left col", md"Right col")

# ╔═╡ f43beea9-7a7e-4ee6-8ae6-350640c426aa
TwoColumnWideRight(md"Left col", md"Right col")

# ╔═╡ 7859ad2b-7e87-442c-8684-f731f2512a42
md"""
## Presentation mode
"""

# ╔═╡ 96ebc3d2-fc70-4a56-8e87-dfe686c723c4
ChooseDisplayMode()

# ╔═╡ a6485a75-6b52-4549-94e9-658dd971c43b
present_button()  # Don't use this with ChooseDisplayMode() since two ways to toggle will make the checkbox behavior confusing

# ╔═╡ 1f417420-cc7f-4e88-9b2b-05185ff81c31
#WidthOverDocs()  # deprecated in favor of ChooseDisplayMode

# ╔═╡ 7596325b-7a1b-4fad-bac3-ae6743e3f8dd
md"""## RobustLocalResource"""

# ╔═╡ 2bfcfe6d-221e-4619-b794-92e44494460b
begin
	url = "https://raw.githubusercontent.com/gist/fonsp/9a36c183e2cad7c8fc30290ec95eb104/raw/ca3a38a61f95cd58d79d00b663a3c114d21e284e/cute.svg"
	path = "data/cute.svg"
end;

# ╔═╡ 44d651d3-ce42-4061-b193-da7c31efed8e
TwoColumnWideLeft(warning_box(md"Discussion of figure on right."), RobustLocalResource(url, path))

# ╔═╡ 43a47026-4b09-4c20-9ccb-a766a17f8ff4
RobustLocalResource(url, path, cache=false) # specify to not save a local copy

# ╔═╡ 4774a4d7-d5f1-40e4-8c2f-f0f96e9242ce
RobustLocalResource(url, path, :width=>200, :alt=>"Pluto logo") # add html attributes

# ╔═╡ f4201010-71d1-4889-99e7-abb774612a4d
begin
	mls_link = "#" * (PlutoRunner.currently_running_cell_id[] |> string)
	md"## Multi-language support"
end

# ╔═╡ ef32d891-0a7a-4803-95ae-a930787c243a
preferred_text( (en=md"Hello",de=md"Hallo") )

# ╔═╡ d3762092-e31d-4b96-840a-3939b89f60b7
tip(preferred_text( (en=md"Remember to add good documentation.",
						de=md"Denken Sie daran, eine gute Dokumentation hinzuzufügen.") ))

# ╔═╡ 93e4e977-efb1-48c7-ac4c-c578140135ee
Markdown.parse("""See also [package cell]($pkg_cell_link) for overriding default language selected from `ENV[LANG]`.""")

# ╔═╡ 97967267-6dbe-4d13-b9cf-1be9038b23ab
md"""
## Footnotes
"""

# ╔═╡ c83e0b4a-7376-4061-8796-ba396c9fbc7a
md"""
### Create inline footnotes

Here is the footnotemark for footnote1[^footnote1].  Here is another one[^info]. 
"""

# ╔═╡ 26219cb8-b1a2-4a35-b50d-10d496954f34
md"""
We can refer/label them whatever we want[^xyz]. 
Here is the first one again[^footnote1].
Notice how the reference number is reused. 

If there is no footnote title/info found then an error is shown[^ahh] Oh No!
"""

# ╔═╡ 93467d07-7235-41a2-a6a7-e89c87e28006
md"""
### Create the footnote text
These would usually appear at the bottom of the notebook.  But their cells can be placed where ever works best.  
The number is assigned based on the order of the footnote text in the notebook (and not the order of the footnotemark).
"""

# ╔═╡ e33a5805-dfc6-4331-83cd-42f113955e5a
md"""
[^footnote1]: This is the text to go with footnote 1.
"""

# ╔═╡ 0be97858-c4f4-4c47-adde-caed151971bb
md"""
[^info]: Here is some extra information.  
         Foonotes are fun.  

[^xyz]: Author et al. (2022) *Journal of Footnotes*, 123, 45.
        
"""

# ╔═╡ d98ea117-9aab-4fad-af19-0a8e69b0c251
md"""
Call the functions below to specify your preferred footnote format.
These might be best at the bottom of your notebook.  
Note that you should not suppress their output (e.g., with a semicolon or putting them in a cell with other code). 
If you do, the CSS that they provide may not take effect.
"""

# ╔═╡ cb31500f-0cc4-49f0-a338-a75a34c95560
InlineFootnotesStyleSuperscript()
#InlineFootnotesStyleBaseline()
#InlineFootnotesStyleSubscript()

# ╔═╡ f66b3b03-78ee-4eef-a0d6-43f4249d3332
InlineAndBottomFootnotesNumbered()
#InlineFootnotesNumbered()
#BottomFootnotesNumbered()

# ╔═╡ 743491af-3d4b-4dee-9ad7-2372ba4e97bd
md"""
## Ingredients
"""

# ╔═╡ 23afc83f-e971-4356-a30e-1b7a247ff38d
begin
	MyModule = @ingredients "demo_module.jl" # provided by PlutoLinks.jl
	import .MyModule: Demo
	import .Demo: hello
end

# ╔═╡ d4b1b5f2-b4ae-4988-aded-79398949f1c8
MyModule.Demo.hundred

# ╔═╡ 95528ca8-bb97-4af2-bbba-dbf1ac188622
Demo.hundred

# ╔═╡ 5985de1c-a429-4449-87c2-3eb6d5bfb247
hello()

# ╔═╡ Cell order:
# ╟─cd581a51-fb2b-4579-9a7d-0d723ad5d467
# ╠═657c3eea-1ef6-11ed-3e82-5daad2bc19a1
# ╠═f0704e56-7e97-4c92-bbdd-76d7a873e6d8
# ╟─d173896e-021a-4b2c-b913-62c5a2320341
# ╠═8c3f1fe2-c934-4743-b30b-07dc97aeac46
# ╠═b48468f0-eeaa-4e1a-ad0b-3cfe42b6ab15
# ╠═4f968b5c-cb11-4d22-ad5b-5ec9c7c94c87
# ╠═9ceaa0a3-0e68-4373-add9-49b6fa908b39
# ╠═cbea3a7b-522d-4f6e-908a-6baec22a9ce3
# ╠═cf73022f-abfd-407c-bcb4-989b54b5dd03
# ╠═319dacff-fdfb-4d0b-918f-d389e4ac81fd
# ╠═343eff72-62b0-4cd1-abd9-991245d4054a
# ╠═12619e7d-5360-4d71-9a2d-5cf0385f0bcf
# ╠═8eb551ef-a9c0-43e3-aea7-d83679436e93
# ╠═947ce2c8-42e3-4704-89b2-c1968077212b
# ╠═4758e75c-1729-4dab-964c-7a2ee9798534
# ╠═39766d40-81a8-498b-83d9-c6f27c131db7
# ╟─8e053634-bca8-46eb-9202-8ab276dcad12
# ╠═c7c3f53e-435a-4ded-a420-04476adfae1c
# ╠═d5b25395-1929-46a7-bfed-1327c650a7a5
# ╠═9ca655cd-2919-4be5-b4de-edcb10d20e3e
# ╟─79f4a49c-4ea3-4888-afaf-7860b883ef38
# ╠═438c621a-1991-476f-9889-55c053941e1b
# ╠═1381ca68-cc1d-4fe7-9587-ee13a5db92ab
# ╠═b52ff55b-3a8a-44e6-9bf6-2b6f9dda5e33
# ╠═0cb5c037-8c2f-4fca-a999-63f9a4f9b891
# ╠═4a380230-f977-4ff7-9114-9d4075bba240
# ╠═42cb6d16-98e0-4ea8-8b54-370df71fe54e
# ╠═1f3e04b4-28f9-4bb8-a233-fd061ac2ee75
# ╟─db745245-805a-478b-b3f5-c7974fab0e9c
# ╠═d1c7c926-7000-4ee3-8d9c-cb03d2dd8ae9
# ╠═8f980fa3-559e-491d-8a84-34a4678fa53d
# ╠═5f95518f-62cd-4869-b6cf-85a7860f38ec
# ╠═3e12dbd9-f02a-479d-9eff-234ac88e059b
# ╠═c8811462-874c-47da-bb34-797234046fdf
# ╟─cccaff2f-3fa0-45f2-9fa6-cf8a21ade844
# ╠═c46d1e7c-df6e-460e-a103-a486d27932c9
# ╠═fb4ff876-a668-40ab-8d30-bfaa858849e4
# ╠═69a9e9f3-a72e-4935-a200-2842010f1e54
# ╟─08794ef8-4e10-4913-808e-06ac194625b6
# ╠═77bb3822-2a1d-4e23-b852-6b6202069efa
# ╠═cc66ef97-36f2-478c-961b-dd8ab2bda4ac
# ╠═0b2a4490-7e29-42c0-af9a-e99b5540d154
# ╟─88b9d474-3449-4931-ac39-4dc377c04abd
# ╠═f49ccb75-7cb8-49ce-95b9-ed59033a589d
# ╠═af5673b5-a7f9-4033-ac9b-845254f62c98
# ╠═8fcfe710-ac2b-4282-85c6-d3b8800fa53a
# ╠═7390e4a7-0561-4611-b3c1-9b83601c5805
# ╠═a05aa377-a201-4670-aae9-8de4059b67cb
# ╠═25066f0b-7100-431c-8695-70005738bbfd
# ╟─d7593309-3462-4dba-8275-c2eb76b4c3fe
# ╠═fc5789dd-4b86-4007-9771-a6246235fd73
# ╠═2881e5de-f6b7-47c0-a794-3e0fa57b712b
# ╠═0e1e62a6-3b78-4415-89fe-fa17279fddbf
# ╠═f43beea9-7a7e-4ee6-8ae6-350640c426aa
# ╠═44d651d3-ce42-4061-b193-da7c31efed8e
# ╟─7859ad2b-7e87-442c-8684-f731f2512a42
# ╠═96ebc3d2-fc70-4a56-8e87-dfe686c723c4
# ╠═a6485a75-6b52-4549-94e9-658dd971c43b
# ╠═1f417420-cc7f-4e88-9b2b-05185ff81c31
# ╟─7596325b-7a1b-4fad-bac3-ae6743e3f8dd
# ╠═2bfcfe6d-221e-4619-b794-92e44494460b
# ╠═43a47026-4b09-4c20-9ccb-a766a17f8ff4
# ╠═4774a4d7-d5f1-40e4-8c2f-f0f96e9242ce
# ╟─f4201010-71d1-4889-99e7-abb774612a4d
# ╠═ef32d891-0a7a-4803-95ae-a930787c243a
# ╠═d3762092-e31d-4b96-840a-3939b89f60b7
# ╟─93e4e977-efb1-48c7-ac4c-c578140135ee
# ╟─97967267-6dbe-4d13-b9cf-1be9038b23ab
# ╠═c83e0b4a-7376-4061-8796-ba396c9fbc7a
# ╠═26219cb8-b1a2-4a35-b50d-10d496954f34
# ╠═93467d07-7235-41a2-a6a7-e89c87e28006
# ╠═e33a5805-dfc6-4331-83cd-42f113955e5a
# ╠═0be97858-c4f4-4c47-adde-caed151971bb
# ╟─d98ea117-9aab-4fad-af19-0a8e69b0c251
# ╠═cb31500f-0cc4-49f0-a338-a75a34c95560
# ╠═f66b3b03-78ee-4eef-a0d6-43f4249d3332
# ╟─743491af-3d4b-4dee-9ad7-2372ba4e97bd
# ╠═23afc83f-e971-4356-a30e-1b7a247ff38d
# ╠═d4b1b5f2-b4ae-4988-aded-79398949f1c8
# ╠═95528ca8-bb97-4af2-bbba-dbf1ac188622
# ╠═5985de1c-a429-4449-87c2-3eb6d5bfb247
