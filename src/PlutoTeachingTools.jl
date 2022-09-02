module PlutoTeachingTools

using PlutoUI
using HypertextLiteral  # for aside, but might be useful elsewhere
using Markdown

using PlutoLinks: @ingredients
export @ingredients

include("i18n/i18n.jl") # provides framework for multiple language support
include("computational_thinking.jl")
include("present.jl")
include("latex.jl")
include("aside.jl")
include("robustlocalresource.jl")
include("other.jl")

end # module
