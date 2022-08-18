module PlutoTeachingTools

using PlutoUI
using HypertextLiteral

using PlutoLinks: @ingredients
export @ingredients

include("computational_thinking.jl")
include("present.jl")
include("latex.jl")
include("aside.jl")
include("other.jl")

end # module
