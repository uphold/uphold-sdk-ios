import Foundation
import SafariServices
import UIKit

/// Uphold authorization view controller.
public class AuthorizationViewController: SFSafariViewController {

    /**
      Constructor.

      - parameter URL: The authorization URL.
      - parameter entersReaderIfAvailable: A boolean that defines if reader mode should be entered automatically when it is available for the webpage.
    */
    override init(URL: NSURL, entersReaderIfAvailable: Bool) {
        super.init(URL: URL, entersReaderIfAvailable: entersReaderIfAvailable)
    }

}
