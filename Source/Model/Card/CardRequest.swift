import Foundation
import ObjectMapper

/// Card request model.
public class CardRequest: Mappable {

    /// The currency of the card.
    public private(set) final var currency: String?

    /// The label of the card.
    public private(set) final var label: String?

    /// The card settings.
    public private(set) final var settings: CardSettings?

    /**
      Constructor.

      - parameter currency: The currency of the card.
      - parameter label: The label of the card.
    */
    public init(currency: String, label: String) {
        self.currency = currency
        self.label = label
    }

    /**
      Constructor.

      - parameter currency: The currency of the card.
      - parameter label: The label of the card.
      - parameter settings: The settings of the card.
    */
    public init(currency: String, label: String, settings: CardSettings) {
        self.currency = currency
        self.label = label
        self.settings = settings
    }

    // MARK: Required by the ObjectMapper.

    /**
      Constructor.

      - parameter map: Mapping data object.
    */
    required public init?(_ map: Map) {
    }

    /**
      Maps the JSON to the Object.

      - parameter map: The object to map.
    */
    public func mapping(map: Map) {
        currency  <- map["currency"]
        label <- map["label"]
        settings <- map["settings"]
    }

}
