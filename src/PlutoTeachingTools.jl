module PlutoTeachingTools

using PlutoUI
using HypertextLiteral  # used by aside & present, might be useful elsewhere
using Markdown

using PlutoLinks: @ingredients  # just for @ingredients
export @ingredients

include("i18n/i18n.jl") # provides framework for multiple language support
include("computational_thinking.jl")  # provides common note boxes
include("present.jl")   # provides present_button() & ChooseDisplayMode()
include("latex.jl")     # provides latexify_md and wrap_tex
include("aside.jl")     # provides aside
include("robustlocalresource.jl") # provides RobustLocalResource
include("other.jl")     # provides WidthOverDocs()
include("footnotes.jl") # provides FootnotesNumbered() and FootnotesInlineStyleSuperscript()

end # module
