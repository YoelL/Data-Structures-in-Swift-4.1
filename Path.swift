import Foundation

//the path class maintains objects that comprise the "frontier"

public class Path {
    
    var total: Int!
    var destination: Vertex
    var previous: Path!
    
    
    //object initialization
    init(){
        destination = Vertex()
    }
    
}
