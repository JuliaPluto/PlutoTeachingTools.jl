@testset "Columns" begin
    html_str = repr(MIME"text/html"(), Columns(md"a", md"b", md"c"))
    @test occursin("@media (max-width: 600px)", html_str)
    @test occursin("flex-direction: column", html_str)
    @test occursin("display: flex", html_str)

    # each call should get its own unique class, so multiple Columns() on one
    # page don't clash with each other
    html_str1 = repr(MIME"text/html"(), Columns(md"a", md"b"))
    html_str2 = repr(MIME"text/html"(), Columns(md"c", md"d"))
    class1 = match(r"class=[\"']([^\"']+)[\"']", html_str1)[1]
    class2 = match(r"class=[\"']([^\"']+)[\"']", html_str2)[1]
    @test class1 != class2
end

@testset "TwoColumn" begin
    html_str = repr(MIME"text/html"(), TwoColumn(md"a", md"b"))
    @test occursin("@media (max-width: 600px)", html_str)
    @test occursin("flex-direction: column", html_str)
end

@testset "ThreeColumn" begin
    html_str = repr(MIME"text/html"(), ThreeColumn(md"a", md"b", md"c"))
    @test occursin("@media (max-width: 600px)", html_str)
    @test occursin("flex-direction: column", html_str)
end

@testset "TwoColumnWideLeft/Right" begin
    @test_nowarn TwoColumnWideLeft(md"a", md"b")
    @test_nowarn TwoColumnWideRight(md"a", md"b")
end

@testset "ChooseDisplayMode" begin
    html_str = repr(MIME"text/html"(), ChooseDisplayMode())
    # WCAG 2.4.7 (Focus Visible): keyboard focus on the checkboxes must be
    # visibly indicated via an :focus-visible outline rule.
    @test occursin("#width-over-livedocs:focus-visible", html_str)
    @test occursin("#present-mode:focus-visible", html_str)
    @test occursin("outline", html_str)
end
