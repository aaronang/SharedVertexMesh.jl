module SharedVertexMesh

import DataStructures: OrderedDict

struct Vertex
    x::Float32
    y::Float32
    z::Float32
end

struct Triangle
    v1::UInt
    v2::UInt
    v3::UInt
end

struct Mesh
    vertices::Array{Vertex, 1}
    triangles::Array{Triangle, 1}
end

function readvertex!(stl, vertices)
    vertex = Vertex(read(stl, Float32), read(stl, Float32), read(stl, Float32))
    haskey(vertices, vertex) ? vertices[vertex] : vertices[vertex] = length(vertices) + 1
end

function from(path::AbstractString)
    vertices = OrderedDict{Vertex, UInt}()
    triangles = Array{Triangle, 1}()

    open(path) do stl
        skip(stl, 80)  # skip header

        trianglecount = read(stl, UInt32)

        for _ in 1:trianglecount
            skip(stl, 12)  # skip normal vector

            triangle = Triangle(readvertex!(stl, vertices),
                                readvertex!(stl, vertices),
                                readvertex!(stl, vertices))
            push!(triangles, triangle)

            skip(stl, 2)  # skip attribute byte count
        end

        @assert eof(stl)
    end

    Mesh(collect(keys(vertices)), triangles)
end

end # module
