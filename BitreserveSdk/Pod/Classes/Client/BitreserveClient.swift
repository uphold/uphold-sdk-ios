import Foundation
import SwiftClient

public class BitreserveClient: Client {

    public override init(){
        super.init()

        self.baseUrl("https://api.bitreserve.org")
    }

}
