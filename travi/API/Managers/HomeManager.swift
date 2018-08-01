
import Foundation

class HomeManager: APIManager {
    

    /// Home detail.
    ///
    ///
    ///     - completionHandler: Callback with Event value
 
    func detail(completionHandler handler: @escaping ([Bases]?) -> Void) {
        
        let eventEndpoint = "\(Endpoints.GETHOME)"
        
        request(endpoint: eventEndpoint, completionHandler: handler, method: .get)
    }

    
}

