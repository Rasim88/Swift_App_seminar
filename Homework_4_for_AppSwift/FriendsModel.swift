//
//  FriendsModel.swift
//  Homework_4_for_AppSwift
//
//  Created by Расим on 18.07.2023.
//

struct FriendsModel: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}
struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?
    var online: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }

}
