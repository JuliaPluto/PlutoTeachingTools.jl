using PlutoTeachingTools
using Test
using Markdown

@testset verbose = true "PlutoTeachingTools.jl" begin
    if VERSION >= v"1.10"
        @testset verbose = true "Linting" begin
            include("test_linting.jl")
        end
    end

    @testset "Computational thinking" begin
        include("computational_thinking.jl")
    end

    @testset "Present" begin
        include("present.jl")
    end

    @testset "Admonitions" begin
        @testset "Standard String arguments" begin
            @test_nowarn hint("Test hint")
            @test_nowarn almost("Testing almost")
            @test_nowarn still_missing("Variable xxx is missing.")
            @test_nowarn keep_working("Maybe the hint will help.")
            @test_nowarn keyconcept("Julia", "Julia is an amazing programming language.")
        end
        @testset "Markdown arguments" begin
            @test_nowarn hint(md"Test hint")
            @test_nowarn almost(md"Testing almost")
            @test_nowarn still_missing(md"Variable xxx is missing.")
            @test_nowarn keep_working(md"Maybe the hint will help.")
            @test_nowarn keyconcept("Julia", md"Julia is an amazing programming language.")
        end
        @test_nowarn (x=5; var_not_defined(x))
        @test_nowarn (x=5; not_defined(x))
        @test_nowarn (f(x)=x; func_not_defined(f))
    end

    @testset "aside" begin
        include("aside.jl")
    end

    @testset "Useful strings" begin
        @test_nowarn TODO()
    end

    @testset "Changing width" begin
        @test_nowarn WidthOverDocs()
    end

    @testset "Other" begin
        include("other.jl")
    end
end
