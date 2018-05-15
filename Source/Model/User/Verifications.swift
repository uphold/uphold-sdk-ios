import Foundation
import ObjectMapper

/// Verifications model.
open class Verifications: Mappable {

    /// The address verification.
    public private(set) final var address: VerificationParameter?

    /// The birthdate verification.
    public private(set) final var birthdate: VerificationParameter?

    /// The documents verification.
    public private(set) final var documents: VerificationParameter?

    /// The email verification.
    public private(set) final var email: VerificationParameter?

    /// The identity verification.
    public private(set) final var identity: VerificationParameter?

    /// The location verification.
    public private(set) final var location: VerificationParameter?

    /// The marketing verification.
    public private(set) final var marketing: VerificationParameter?

    /// The phone verification.
    public private(set) final var phone: VerificationParameter?

    /// The terms verification.
    public private(set) final var terms: VerificationParameter?

    /**
      Constructor.

      - parameter address: The address verification.
      - parameter birthdate: The birthdate verification.
      - parameter documents: The documents verification.
      - parameter email: The email verification.
      - parameter identity: The identity verification.
      - parameter location: The location verification.
      - parameter marketing: The marketing verification.
      - parameter phone: The phone verification.
      - parameter terms: The terms verification.
    */
    public init(address: VerificationParameter?, birthdate: VerificationParameter?, documents: VerificationParameter?, email: VerificationParameter?, identity: VerificationParameter?, location: VerificationParameter?, marketing: VerificationParameter?, phone: VerificationParameter?, terms: VerificationParameter?) {
        self.address = address
        self.birthdate = birthdate
        self.documents = documents
        self.email = email
        self.identity = identity
        self.location = location
        self.marketing = marketing
        self.phone = phone
        self.terms = terms
    }

    // MARK: Required by the ObjectMapper.

    /**
     Constructor.

     - parameter map: Mapping data object.
     */
    required public init?(map: Map) {
    }

    /**
     Maps the JSON to the Object.

     - parameter map: The object to map.
     */
    open func mapping(map: Map) {
        address  <- map["address"]
        birthdate  <- map["birthdate"]
        documents  <- map["documents"]
        email  <- map["email"]
        identity  <- map["identity"]
        location  <- map["location"]
        marketing  <- map["marketing"]
        phone  <- map["phone"]
        terms  <- map["terms"]
    }

}
