import Foundation

/// JSON test util methods.
public class JSONTestUtils {

    /**
      Convert a JSON object to a dictionary.

      - parameter json: The JSON string to convert.

      - returns: The dictionary.
    */
    public static func JSONtoDictionary(json: String) -> [String: AnyObject]? {
        if let data = json.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])

                guard let dictionary = json as? [String: AnyObject] else {
                    return nil
                }

                return dictionary
            } catch {
                return nil
            }
        }

        return nil
    }

}
