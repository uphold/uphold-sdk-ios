import Foundation
import SwiftClient

/// UserCard service.
public class UserCardService {

    /**
      Creates a request to cancel a transaction.

      - parameter cardId: The id of the card.
      - parameter transactionId: The id of the transaction.

      - returns: A request to cancel the transaction.
    */
    static func cancelTransaction(cardId: String, transactionId: String) -> Request {
        return UpholdClient().post(String(format: "/v0/me/cards/%@/transactions/%@/cancel", cardId, transactionId))
    }

    /**
      Creates a new address for the card.

      - parameter cardId: The card id.
      - parameter addressRequest: The card address request information.

      - returns: A request to create a card.
    */
    static func createCardAddress(cardId: String, addressRequest: AnyObject) -> Request {
        return UpholdClient().post(String(format: "/v0/me/cards/%@/addresses", cardId)).send(addressRequest)
    }

    /**
      Creates a request to confirm a transaction.

      - parameter cardId: The id of the card.
      - parameter otp: the otp code to confirm the transaction.
      - parameter transactionId: The id of the transaction.
      - parameter transactionCommitRequest: The transaction commit information.

      - returns: A request to confirm the transaction.
    */
    static func confirmTransaction(cardId: String, otp: String?, transactionId: String, transactionCommitRequest: AnyObject?) -> Request {
        let request = UpholdClient().post(String(format: "/v0/me/cards/%@/transactions/%@/commit", cardId, transactionId))

        guard let guardedOtp = otp, guardedTransactionCommitRequest = transactionCommitRequest else {
            if let otp = otp {
                return request.set("OTP-Token", otp)
            } else if let transactionCommitRequest = transactionCommitRequest {
                return request.send(transactionCommitRequest)
            }

            return request
        }

        return request.set("OTP-Token", guardedOtp).send(guardedTransactionCommitRequest)
    }

    /**
      Creates a request to create a transaction.

      - parameter cardId: The id of the card.
      - parameter commit: A boolean to indicate if it is to commit the transaction on the creation process.
      - parameter transactionRequest: The transaction request.

      - returns: A request to create a transaction.
    */
    static func createTransaction(cardId: String, commit: Bool, transactionRequest: AnyObject) -> Request {
        return UpholdClient().post(String(format: "/v0/me/cards/%@/transactions", cardId)).query(["commit": commit ? "true" : "false"]).send(transactionRequest)
    }

    /**
      Creates a request to create a card.

      - parameter cardRequest: The card request.

      - returns: A request to create a card.
    */
    static func createUserCard(cardRequest: AnyObject) -> Request {
        return UpholdClient().post("/v0/me/cards").send(cardRequest)
    }

    /**
      Creates a request to get the user's card by id.

      - parameter cardId: The id of the card.

      - returns: A request to create a transaction.
    */
    static func getUserCardById(cardId: String) -> Request {
        return UpholdClient().get(String(format: "/v0/me/cards/%@", cardId))
    }

    /**
      Creates a request to get the user cards.

      - returns: A request to get the user cards.
    */
    static func getUserCards() -> Request {
        return UpholdClient().get("/v0/me/cards")
    }

    /**
      Creates a request to get the list of transactions for a card.

      - parameter cardId: The id of the card.
      - parameter range: The range of the request.

      - returns: A request to get the list of transactions for a card.
    */
    static func getUserCardTransactions(cardId: String, range: String) -> Request {
        return UpholdClient().get(String(format: "/v0/me/cards/%@/transactions", cardId)).set("Range", range)
    }

    /**
      Creates a request to update the card.

      - parameter cardId: The id of the card.
      - parameter updateFields: The card fields to update.

      - returns: A request to update a card.
    */
    static func updateCard(cardId: String, updateFields: AnyObject) -> Request {
        return UpholdClient().patch(String(format: "/v0/me/cards/%@", cardId)).send(updateFields)
    }

}
