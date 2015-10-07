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
        return BitreserveClient().get(String(format: "/v0/me/cards/%@/transactions/%@/cancel", cardId, transactionId))
    }

    /**
      Creates a request to confirm a transaction.

      - parameter cardId: The id of the card.
      - parameter transactionId: The id of the transaction.

      - returns: A request to confirm the transaction.
    */
    static func confirmTransaction(cardId: String, transactionId: String, message: String) -> Request {
        return BitreserveClient().post(String(format: "/v0/me/cards/%@/transactions/%@/commit", cardId, transactionId)).send(message)
    }

    /**
      Creates a request to create a transaction.

      - parameter cardId: The id of the card.
      - parameter transactionId: The id of the transaction.
      - parameter transactionRequest: The transaction request.

      - returns: A request to create a transaction.
    */
    static func createTransaction(cardId: String, transactionId: String, transactionRequest: String) -> Request {
        return BitreserveClient().post(String(format: "/v0/me/cards/%@/transactions/%@/commit", cardId, transactionId)).send(transactionRequest)
    }

    /**
      Creates a request to create a card.

      - parameter cardRequest: The card request.

      - returns: A request to create a card.
    */
    static func createUserCard(cardRequest: String) -> Request {
        return BitreserveClient().post("/v0/me/cards").send(cardRequest)
    }

    /**
      Creates a request to get the user's card by id.

      - parameter cardId: The id of the card.

      - returns: A request to create a transaction.
    */
    static func getUserCardById(cardId: String) -> Request {
        return BitreserveClient().get(String(format: "/v0/me/cards/%@", cardId))
    }

    /**
      Creates a request to get the user cards.

      - returns: A request to get the user cards.
    */
    static func getUserCards() -> Request {
        return BitreserveClient().get("/v0/me/cards")
    }

    /**
      Creates a request to get the list of transactions for a card.

      - parameter cardId: The id of the card.
      - parameter range: The range of the request.

      - returns: A request to get the list of transactions for a card.
    */
    static func getUserCardTransactions(cardId: String, range: String) -> Request {
        return BitreserveClient().get(String(format: "/v0/me/cards/%@/transactions", cardId)).set("Range", range)
    }

    /**
      Creates a request to update the card.

      - parameter cardId: The id of the card.
      - parameter updateFields: The card fields to update.

      - returns: A request to update a card.
    */
    static func updateCard(cardId: String, updateFields: String) -> Request {
        return BitreserveClient().patch(String(format: "/v0/me/cards/%@", cardId)).send(updateFields)
    }

}
