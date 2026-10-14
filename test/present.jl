@testset "Columns" begin
    @test_nowarn Columns(md"a", md"b", md"c")
end

@testset "TwoColumn" begin
    @test_nowarn TwoColumn(md"a", md"b")
end

@testset "ThreeColumn" begin
    @test_nowarn ThreeColumn(md"a", md"b", md"c")
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
