using PlutoTeachingTools
using Test

using JuliaFormatter: JuliaFormatter
using Aqua: Aqua
using JET: JET
using ExplicitImports: ExplicitImports

@testset "Code formatting" begin
    @test JuliaFormatter.format(PlutoTeachingTools; verbose=false, overwrite=false)
end

@testset "Aqua tests" begin
    Aqua.test_all(PlutoTeachingTools; ambiguities=false)
end

@testset "JET tests" begin
    JET.test_package(PlutoTeachingTools; target_defined_modules=true)
end

@testset "ExplicitImports tests" begin
    @testset "Improper implicit imports" begin
        @test ExplicitImports.check_no_implicit_imports(PlutoTeachingTools) === nothing
    end
    @testset "Improper explicit imports" begin
        @test ExplicitImports.check_no_stale_explicit_imports(PlutoTeachingTools;) ===
            nothing
        @test ExplicitImports.check_all_explicit_imports_via_owners(PlutoTeachingTools) ===
            nothing
        # TODO: include test. Currently using non-public `Markdown.Admonition`
        # @test ExplicitImports.check_all_explicit_imports_are_public(PlutoTeachingTools;) ===
        #     nothing
    end
    @testset "Improper qualified accesses" begin
        @test ExplicitImports.check_all_qualified_accesses_via_owners(
            PlutoTeachingTools
        ) === nothing
        @test ExplicitImports.check_no_self_qualified_accesses(PlutoTeachingTools) ===
            nothing
        @test ExplicitImports.check_all_qualified_accesses_are_public(
            PlutoTeachingTools
        ) === nothing
    end
end
