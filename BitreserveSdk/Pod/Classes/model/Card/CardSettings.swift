import Foundation
import ObjectMapper

/// CardSettings model.
public class CardSettings: Mappable {
    
    /// The position of the card.
    public private(set) var position: Int?
    
    /// A boolean indicating if the card is starred.
    public private(set) var starred: Bool?

    /**
        Constructor.
    */
    public init(){
    }
    
    /**
        Constructor.
    
        :param: position The position of the card.
        :param: starred A boolean indicating if the card is starred.
    */
    public init(position: Int, starred: Bool) {
        self.position = position
        self.starred = starred
    }
    
    // MARK: Functions required by the ObjectMapper

    /// Returns a Mappable CardSettings.
    public class func newInstance(map: Map) -> Mappable? {
        return CardSettings()
    }

    /// Maps the JSON to the Object.
    public func mapping(map: Map) {
        position  <- map["position"]
        starred <- map["starred"]
    }

}
