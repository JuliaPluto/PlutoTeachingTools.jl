module PlutoTeachingTools

using PlutoUI

using PlutoLinks: @ingredients
export @ingredients

include("computational_thinking.jl")
include("present.jl")
include("latex.jl")
include("other.jl")

end # module
