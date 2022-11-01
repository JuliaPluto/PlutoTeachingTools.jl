### A Pluto.jl notebook ###
# v0.19.12

using Markdown
using InteractiveUtils

# ╔═╡ 657c3eea-1ef6-11ed-3e82-5daad2bc19a1
begin
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
question_box(md"What might explain this?")

# ╔═╡ 947ce2c8-42e3-4704-89b2-c1968077212b
warning_box(md"Be extra careful here.")

# ╔═╡ 46556317-d7cd-4b0b-b92b-f686f078a0d4
TODO()

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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoTeachingTools = "~0.2.1"
PlutoUI = "~0.7.40"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.2"
manifest_format = "2.0"
project_hash = "ec52ce371f78a586a32ed48fc6fd5d04784d389d"

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

[[deps.CodeTracking]]
deps = ["InteractiveUtils", "UUIDs"]
git-tree-sha1 = "cc4bd91eba9cdbbb4df4746124c22c0832a460d6"
uuid = "da1fd8a2-8d9e-5ec2-8556-3022fb5608a2"
version = "1.1.1"

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

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

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

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

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

[[deps.JuliaInterpreter]]
deps = ["CodeTracking", "InteractiveUtils", "Random", "UUIDs"]
git-tree-sha1 = "0f960b1404abb0b244c1ece579a0ec78d056a5d1"
uuid = "aa1ae85d-cabe-5617-a682-6adf51b2e16a"
version = "0.9.15"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "OrderedCollections", "Printf", "Requires"]
git-tree-sha1 = "ab9aa169d2160129beb241cb2750ca499b4e90e9"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.17"

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

[[deps.LoweredCodeUtils]]
deps = ["JuliaInterpreter"]
git-tree-sha1 = "dedbebe234e06e1ddad435f5c6f4b85cd8ce55f7"
uuid = "6f1432cf-f94c-5a45-995e-cdbf5db27b0b"
version = "2.2.2"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "42324d08725e200c23d4dfb549e0d5d89dede2d2"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.10"

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

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "6c01a9b494f6d2a9fc180a08b182fcb06f0958a0"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.4.2"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoHooks]]
deps = ["InteractiveUtils", "Markdown", "UUIDs"]
git-tree-sha1 = "072cdf20c9b0507fdd977d7d246d90030609674b"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0774"
version = "0.0.5"

[[deps.PlutoLinks]]
deps = ["FileWatching", "InteractiveUtils", "Markdown", "PlutoHooks", "Revise", "UUIDs"]
git-tree-sha1 = "0e8bcc235ec8367a8e9648d48325ff00e4b0a545"
uuid = "0ff47ea0-7a50-410d-8455-4348d5de0420"
version = "0.1.5"

[[deps.PlutoTeachingTools]]
deps = ["Downloads", "HypertextLiteral", "LaTeXStrings", "Latexify", "Markdown", "PlutoLinks", "PlutoUI", "Random"]
git-tree-sha1 = "ea3e4ac2e49e3438815f8946fa7673b658e35bdb"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.2.5"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "efc140104e6d0ae3e7e30d56c98c4a927154d684"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.48"

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

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.Revise]]
deps = ["CodeTracking", "Distributed", "FileWatching", "JuliaInterpreter", "LibGit2", "LoweredCodeUtils", "OrderedCollections", "Pkg", "REPL", "Requires", "UUIDs", "Unicode"]
git-tree-sha1 = "dad726963ecea2d8a81e26286f625aee09a91b7c"
uuid = "295af30f-e4ad-537b-8983-00126c2a3abe"
version = "3.4.0"

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
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "e59ecc5a41b000fa94423a578d29290c7266fc10"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.0"

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
# ╠═947ce2c8-42e3-4704-89b2-c1968077212b
# ╠═46556317-d7cd-4b0b-b92b-f686f078a0d4
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
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
