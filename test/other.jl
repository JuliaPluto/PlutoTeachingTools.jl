@testset "WidthOverDocs" begin
    html_str = repr(MIME"text/html"(), WidthOverDocs())
    # WCAG 2.4.7 (Focus Visible): keyboard focus on the checkbox must be
    # visibly indicated via a :focus-visible outline rule.
    @test occursin("#width-over-livedocs:focus-visible", html_str)
    @test occursin("outline", html_str)
end
