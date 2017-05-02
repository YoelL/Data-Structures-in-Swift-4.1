import Foundation

 class Edge {
    
    var neighbor: Vertex
    var weight: Int
    
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
    
}
