# SharedVertexMesh.jl

Mesh implementation using the shared vertex representation 🔺

## Installation

```Julia
pkg> add https://github.com/aaronang/SharedVertexMesh.jl
```

## Usage

```Julia
julia> import SharedVertexMesh

julia> mesh = SharedVertexMesh.from("nist.stl")

julia> mesh.vertices
3688-element Array{Tuple{Float32,Float32,Float32},1}:
 (45.7107, 112.8614, 10.0)
 (55.7107, 112.8614, 10.0)
 ⋮
 (15.2282, 78.8678, 5.0)
 (17.6777, 81.3173, 3.0)

julia> mesh.triangles
7392-element Array{Tuple{UInt64,UInt64,UInt64},1}:
 (0x0000000000000001, 0x0000000000000002, 0x0000000000000003)
 (0x0000000000000004, 0x0000000000000005, 0x0000000000000006)
 ⋮
 (0x0000000000000e68, 0x0000000000000e67, 0x0000000000000e65)
 (0x0000000000000e65, 0x0000000000000e67, 0x0000000000000e66)
```
