import Fakery
import Foundation
import UpholdSdk

/// Fixtures to generate users, cards, etc.
public class Fixtures {

    /**
      Fixture to generate a user.

      - parameter fields: A dictionary containing specific fields for the user to have.

      - returns: A user.
     */
    public static func loadUser(fields: [String: String]?) -> User {
        let faker = Faker(locale: "en")

        var fakerFields = [
            "country": faker.locale,
            "currencies": String(format: "%@,%@,%@", faker.lorem.characters(amount: 3), faker.lorem.characters(amount: 3), faker.lorem.characters(amount: 3)),
            "currency": faker.lorem.characters(amount: 3),
            "email": faker.internet.email(),
            "firstName": faker.name.firstName(),
            "hasNewsSubscription": "true",
            "hasOtpEnabled": "true",
            "internationalizationUserSettingDateTimeFormat": faker.lorem.characters(amount: 5),
            "internationalizationUserSettingLanguage": faker.lorem.characters(amount: 5),
            "internationalizationUserSettingNumberFormat": faker.lorem.characters(amount: 5),
            "lastName": faker.name.lastName(),
            "name": faker.name.name(),
            "state": faker.address.stateAbbreviation(),
            "status": faker.lorem.characters(amount: 10),
            "theme": faker.lorem.characters(amount: 10),
            "username": faker.lorem.characters(amount: 10)
        ]

        if let fields = fields {
            _ = fields.flatMap { (key, value) in fakerFields[key] = value }
        }

        let internationalizationUserSettingDateTimeFormat = InternationalizationUserSetting(locale: fakerFields["internationalizationUserSettingDateTimeFormat"]!)
        let internationalizationUserSettingLanguage = InternationalizationUserSetting(locale: fakerFields["internationalizationUserSettingLanguage"]!)
        let internationalizationUserSettingNumberFormat = InternationalizationUserSetting(locale: fakerFields["internationalizationUserSettingNumberFormat"]!)
        let internationalizationUserSettings = InternationalizationUserSettings(language: internationalizationUserSettingLanguage, dateTimeFormat: internationalizationUserSettingDateTimeFormat, numberFormat: internationalizationUserSettingNumberFormat)
        let userSettings = UserSettings(currency: fakerFields["currency"]!, hasNewsSubscription: NSString(string: fakerFields["hasNewsSubscription"]!).boolValue, hasOtpEnabled: NSString(string: fakerFields["hasOtpEnabled"]!).boolValue, intl: internationalizationUserSettings, theme: fakerFields["theme"]!)

        return User(country: fakerFields["country"]!, currencies: fakerFields["currencies"]!.componentsSeparatedByString(","), email: fakerFields["email"]!, firstName: fakerFields["firstName"]!, lastName: fakerFields["lastName"]!, name: fakerFields["name"]!, settings: userSettings, state: fakerFields["state"]!, status: fakerFields["status"]!, username: fakerFields["username"]!)
    }

}
