using PlutoTeachingTools
using Test
using Markdown

@testset "PlutoTeachingTools.jl" begin
    # Write your tests here.

    @testset "Standard String arguments" begin
        @test_nowarn hint("Test hint")
        @test_nowarn almost("Testing almost")
        @test_nowarn still_missing("Variable xxx is missing.")
        @test_nowarn keep_working("Maybe the hint will help.")
    end;
    @testset "Markdown arguments" begin
        @test_nowarn hint(md"Test hint")
        @test_nowarn almost(md"Testing almost")
        @test_nowarn still_missing(md"Variable xxx is missing.")
        @test_nowarn keep_working(md"Maybe the hint will help.")
    end;

    @testset "aside" begin
       @test_nowarn aside("testing aside")
       @test_nowarn aside("testing aside with offset", v_offset=50)
       @test_nowarn aside(md"testing in markdown")
       @test_nowarn aside(tip(md"Good tip here"))
       @test_nowarn aside(md"""
Testing
Multi-line
""")
   
 
    end;
 
    @test_nowarn (x = 5; var_not_defined(x) )
    @test_nowarn (x = 5; not_defined(x) )
    @test_nowarn (f(x) = x; func_not_defined(f) )

    @testset "Useful strings" begin
         @test_nowarn TODO()
    end;

    @testset "Changing width" begin
         @test_nowarn WidthOverDocs()
    end;

    @testset "Ingredients" begin
         @test typeof(@ingredients("empty_module.jl")) == Module
    end;

end

