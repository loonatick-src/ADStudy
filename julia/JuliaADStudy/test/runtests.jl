module ADStudyTest

using JuliaADStudy

using Test
using Symbolics
using DiffTests

@testset "ℜ → ℜ functions" begin
    @variables x    
    Dx = Differential(x)
end

end # module