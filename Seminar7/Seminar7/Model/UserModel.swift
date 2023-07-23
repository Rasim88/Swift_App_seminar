//
//  UserModel.swift
//  Seminar7
//
//  Created by Расим on 22.07.2023.
//

struct User: Decodable {
    var firstName: String?
    var lastName: String?
    var photo: String?

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50_orig"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName)
        photo = try container.decodeIfPresent(String.self, forKey: .photo)
    }
}
