import Foundation

/// JSON util methods.
public class JSONUtils {

    /**
      Convert a dictionary object to a JSON string.

      - parameter dictionary: The dictionary to convert.

      - returns: The JSON string.
     */
    public static func toJSONString(dictionary: [String: AnyObject]) -> String? {
        if (NSJSONSerialization.isValidJSONObject(dictionary)) {
            do {
                let jsonData = try NSJSONSerialization.dataWithJSONObject(dictionary, options: [])
                let jsonNSString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)

                guard let jsonString = jsonNSString as? String else {
                    return nil
                }

                return jsonString
            } catch {
                return nil
            }
        }

        return nil
    }

}
