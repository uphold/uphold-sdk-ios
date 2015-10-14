import Foundation
import SwiftClient

public class UpholdClient: Client {

    public override init() {
        super.init()

        self.baseUrl("https://api.uphold.com")
    }

}
