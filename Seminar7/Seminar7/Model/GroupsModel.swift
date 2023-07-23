//
//  GroupsModel.swift
//  Seminar7
//
//  Created by Расим on 22.07.2023.
//

struct GroupsModel: Decodable{
    var response: Groups
}

struct Groups: Decodable{
    var items: [Group]
}

struct Group: Codable {
    var id: Int
    var name: String?
    var photo: String?
    var description: String?

    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case photo = "photo_50"
    }
    
}
