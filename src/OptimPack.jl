#
# OptimPack.jl --
#
# A package of optimization methods for Julia.
#
# -----------------------------------------------------------------------------
#
# This file is part of OptimPack.jl which is licensed under the MIT "Expat"
# License:
#
# Copyright (C) 2014-2017, Éric Thiébaut.
#

isdefined(Base, :__precompile__) && __precompile__(true)

module OptimPack

export
    fzero,
    fmin,
    fmin_global,
    nlcg,
    vmlmb,
    vmlmb!,
    spg2,
    spg2!

"""
`Float` is the type of all floating point scalars, it is currently an alias to
`Cdouble` which is itself an alias to `Float64`.
"""
const Float = Cdouble

function getreason end

# Load other components.
include("algebra.jl"); importall .Algebra
include("conjgrad.jl")
include("linesearches.jl")
include("quasinewton.jl")
include("spg.jl")
include("step.jl")
include("clib.jl")
include("brent.jl")
include("bradi.jl")
include("powell.jl")
include("deprecations.jl")

# Provide some aliases for popular algorithms.
import .Brent: fmin, fzero
import .CLib: nlcg
import .SPG: spg2, spg2!
import .QuasiNewton: vmlmb, vmlmb!, EMULATE_BLMVM

end # module
