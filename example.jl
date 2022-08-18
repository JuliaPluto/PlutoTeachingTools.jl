### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# ╔═╡ 657c3eea-1ef6-11ed-3e82-5daad2bc19a1
begin
	import Pkg
	Pkg.add(url=joinpath(homedir(),"Teach","PlutoTeachingTools.jl"))
	using PlutoUI, PlutoTeachingTools
end

# ╔═╡ f0704e56-7e97-4c92-bbdd-76d7a873e6d8
TableOfContents()

# ╔═╡ 9e4b5e5e-3688-4bb2-80a5-fa0f6869528e
md"""
# PlutoTeachingTools.jl Examples
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

# ╔═╡ 947ce2c8-42e3-4704-89b2-c1968077212b
warning_box(md"Be extra careful here.")

# ╔═╡ 8e053634-bca8-46eb-9202-8ab276dcad12
md"""
## Checking variables are defined
"""

# ╔═╡ 9ca655cd-2919-4be5-b4de-edcb10d20e3e
not_defined(:x) # deprecated

# ╔═╡ c7c3f53e-435a-4ded-a420-04476adfae1c
var_not_defined(:x)

# ╔═╡ d5b25395-1929-46a7-bfed-1327c650a7a5
func_not_defined(:calc_x)

# ╔═╡ 46e5c910-c06d-484d-8582-285101ce9ac5


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

# ╔═╡ cccaff2f-3fa0-45f2-9fa6-cf8a21ade844
md"""
## Foldable content
"""

# ╔═╡ c46d1e7c-df6e-460e-a103-a486d27932c9
Foldable("Want more?",md"Extra info")

# ╔═╡ fb4ff876-a668-40ab-8d30-bfaa858849e4
protip(md"The `CSV.read` function has lots of useful optional arguements.")

# ╔═╡ 88b9d474-3449-4931-ac39-4dc377c04abd
md"""
## Markdown / HTML hacks
"""

# ╔═╡ 7d714d3b-4ab9-45d9-89c2-31b67210a005
wrap_tex("x+y=1")

# ╔═╡ d9bacc60-05f3-4608-9dae-1c16631bfbad


# ╔═╡ 08794ef8-4e10-4913-808e-06ac194625b6
md"""
## aside
"""

# ╔═╡ cc66ef97-36f2-478c-961b-dd8ab2bda4ac
aside(tip(md"Extra information to consider."))

# ╔═╡ 46556317-d7cd-4b0b-b92b-f686f078a0d4
TODO()

# ╔═╡ 5f95518f-62cd-4869-b6cf-85a7860f38ec
response_1 = "Insert your response here."

# ╔═╡ 3e12dbd9-f02a-479d-9eff-234ac88e059b
PlutoTeachingTools.keep_working_if_var_contains_substr(:response_1,response_1,"Insert your")

# ╔═╡ c8811462-874c-47da-bb34-797234046fdf
PlutoTeachingTools.keep_working_if_var_contains_substr(:response_1,response_1,"should display nothing")

# ╔═╡ 0db566ab-d12a-4dfb-b93c-bc5560c811e2


# ╔═╡ d7593309-3462-4dba-8275-c2eb76b4c3fe
md"""
## Multic-columns
"""

# ╔═╡ fc5789dd-4b86-4007-9771-a6246235fd73
PlutoTeachingTools.TwoColumn(md"Left col", md"Right col")

# ╔═╡ 2881e5de-f6b7-47c0-a794-3e0fa57b712b
PlutoTeachingTools.ThreeColumn(md"Left col", md"Middle col", md"Right col")

# ╔═╡ 0e1e62a6-3b78-4415-89fe-fa17279fddbf
PlutoTeachingTools.TwoColumnWideLeft(md"Left col", md"Right col")

# ╔═╡ f43beea9-7a7e-4ee6-8ae6-350640c426aa
PlutoTeachingTools.TwoColumnWideRight(md"Left col", md"Right col")

# ╔═╡ 7859ad2b-7e87-442c-8684-f731f2512a42
md"""
## Presentation mode
"""

# ╔═╡ 96ebc3d2-fc70-4a56-8e87-dfe686c723c4
ChooseDisplayMode()

# ╔═╡ 1f417420-cc7f-4e88-9b2b-05185ff81c31
#WidthOverDocs()  # deprecated in favor of ChooseDisplayMode

# ╔═╡ a6485a75-6b52-4549-94e9-658dd971c43b
present_button()

# ╔═╡ 743491af-3d4b-4dee-9ad7-2372ba4e97bd
md"""
## Ingredients

"""

# ╔═╡ 23afc83f-e971-4356-a30e-1b7a247ff38d
begin
	MyModule = @ingredients "demo_module.jl"
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
# ╠═657c3eea-1ef6-11ed-3e82-5daad2bc19a1
# ╠═f0704e56-7e97-4c92-bbdd-76d7a873e6d8
# ╟─9e4b5e5e-3688-4bb2-80a5-fa0f6869528e
# ╠═8c3f1fe2-c934-4743-b30b-07dc97aeac46
# ╠═b48468f0-eeaa-4e1a-ad0b-3cfe42b6ab15
# ╠═4f968b5c-cb11-4d22-ad5b-5ec9c7c94c87
# ╠═9ceaa0a3-0e68-4373-add9-49b6fa908b39
# ╠═cbea3a7b-522d-4f6e-908a-6baec22a9ce3
# ╠═cf73022f-abfd-407c-bcb4-989b54b5dd03
# ╠═319dacff-fdfb-4d0b-918f-d389e4ac81fd
# ╠═343eff72-62b0-4cd1-abd9-991245d4054a
# ╠═947ce2c8-42e3-4704-89b2-c1968077212b
# ╟─8e053634-bca8-46eb-9202-8ab276dcad12
# ╠═9ca655cd-2919-4be5-b4de-edcb10d20e3e
# ╠═c7c3f53e-435a-4ded-a420-04476adfae1c
# ╠═d5b25395-1929-46a7-bfed-1327c650a7a5
# ╠═46e5c910-c06d-484d-8582-285101ce9ac5
# ╟─79f4a49c-4ea3-4888-afaf-7860b883ef38
# ╠═438c621a-1991-476f-9889-55c053941e1b
# ╠═1381ca68-cc1d-4fe7-9587-ee13a5db92ab
# ╠═b52ff55b-3a8a-44e6-9bf6-2b6f9dda5e33
# ╠═0cb5c037-8c2f-4fca-a999-63f9a4f9b891
# ╠═4a380230-f977-4ff7-9114-9d4075bba240
# ╠═42cb6d16-98e0-4ea8-8b54-370df71fe54e
# ╠═1f3e04b4-28f9-4bb8-a233-fd061ac2ee75
# ╠═db745245-805a-478b-b3f5-c7974fab0e9c
# ╠═3e12dbd9-f02a-479d-9eff-234ac88e059b
# ╠═c8811462-874c-47da-bb34-797234046fdf
# ╟─cccaff2f-3fa0-45f2-9fa6-cf8a21ade844
# ╠═c46d1e7c-df6e-460e-a103-a486d27932c9
# ╠═fb4ff876-a668-40ab-8d30-bfaa858849e4
# ╠═88b9d474-3449-4931-ac39-4dc377c04abd
# ╠═7d714d3b-4ab9-45d9-89c2-31b67210a005
# ╠═d9bacc60-05f3-4608-9dae-1c16631bfbad
# ╟─08794ef8-4e10-4913-808e-06ac194625b6
# ╠═cc66ef97-36f2-478c-961b-dd8ab2bda4ac
# ╠═46556317-d7cd-4b0b-b92b-f686f078a0d4
# ╠═5f95518f-62cd-4869-b6cf-85a7860f38ec
# ╠═0db566ab-d12a-4dfb-b93c-bc5560c811e2
# ╟─d7593309-3462-4dba-8275-c2eb76b4c3fe
# ╠═fc5789dd-4b86-4007-9771-a6246235fd73
# ╠═2881e5de-f6b7-47c0-a794-3e0fa57b712b
# ╠═0e1e62a6-3b78-4415-89fe-fa17279fddbf
# ╠═f43beea9-7a7e-4ee6-8ae6-350640c426aa
# ╟─7859ad2b-7e87-442c-8684-f731f2512a42
# ╠═96ebc3d2-fc70-4a56-8e87-dfe686c723c4
# ╠═1f417420-cc7f-4e88-9b2b-05185ff81c31
# ╠═a6485a75-6b52-4549-94e9-658dd971c43b
# ╠═743491af-3d4b-4dee-9ad7-2372ba4e97bd
# ╠═23afc83f-e971-4356-a30e-1b7a247ff38d
# ╠═d4b1b5f2-b4ae-4988-aded-79398949f1c8
# ╠═95528ca8-bb97-4af2-bbba-dbf1ac188622
# ╠═5985de1c-a429-4449-87c2-3eb6d5bfb247
