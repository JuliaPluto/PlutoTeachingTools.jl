@test_nowarn aside("testing aside")
@test_nowarn aside("testing aside with offset", v_offset=50)
@test_nowarn aside(md"testing in markdown")
@test_nowarn aside(tip(md"Good tip here"))
@test_nowarn aside(md"""
 Testing
 Multi-line
 """)

@testset "aria-label" begin
    html_str = repr(MIME"text/html"(), aside("testing aside"))
    # WCAG 1.3.1 (Info and Relationships): the <aside> is absolutely
    # positioned out of normal document flow, so an aria-label helps
    # screen reader users who reach it via a landmarks list understand
    # what the region is.
    @test occursin("<aside", html_str)
    @test occursin("aria-label", html_str)
end
