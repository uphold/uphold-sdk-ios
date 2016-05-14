import Foundation

/// URL utils class.
public class URLUtils {

    /**
      Escapes the given URL string and generates an NSURL.

      - parameter url: The URL.

      - throws: A MalformedUrlError.

      - returns: The escaped NSURL.
    */
    public static func escapeURL(url: String) throws -> NSURL {
        guard let escapedUrl = url.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()), uri = NSURL(string: escapedUrl) else {
            throw MalformedUrlError(message: "Invalid URL.")
        }

        return uri
    }
}
