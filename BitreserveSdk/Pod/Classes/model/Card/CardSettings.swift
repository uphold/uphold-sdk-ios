import Foundation

/// CardSettings model.
public class CardSettings {
    
    /// The position of the card.
    public private(set) var position: Int
    
    /// A boolean indicating if the card is starred.
    public private(set) var starred: Boolean
    
    /**
        Constructor.
    
        :param: position The position of the card.
        :param: starred A boolean indicating if the card is starred.
    */
    public init(position: Int, starred: Boolean) {
        self.position = position
        self.starred = starred
    }
    
}
