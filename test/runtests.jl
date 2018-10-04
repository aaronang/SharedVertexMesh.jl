using Test
import SharedVertexMesh

const STL = joinpath("data", "nist.stl")

mesh = SharedVertexMesh.from(STL)
@test length(mesh.triangles) == 7392
@test length(mesh.vertices) == 3688
