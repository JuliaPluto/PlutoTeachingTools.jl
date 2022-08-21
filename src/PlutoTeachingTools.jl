module PlutoTeachingTools

using PlutoUI
using HypertextLiteral  # for aside, but might be useful elsewhere

using PlutoLinks: @ingredients
export @ingredients

include("computational_thinking.jl")
include("present.jl")
include("latex.jl")
include("aside.jl")
include("robustlocalresource.jl")
include("other.jl")

end # module
