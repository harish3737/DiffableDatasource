//
//  Model.swift
//  DiffableDatasource
//
//  Created by Shyam Kumar on 4/25/21.
//

import Foundation




//struct Users : Codable {
//
//        let address : Address?
//        let company : Company?
//        let email : String?
//        let id : Int?
//        let name : String?
//        let phone : String?
//        let username : String?
//        let website : String?
//
//        enum CodingKeys: String, CodingKey {
//                case address = "address"
//                case company = "company"
//                case email = "email"
//                case id = "id"
//                case name = "name"
//                case phone = "phone"
//                case username = "username"
//                case website = "website"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//            address = try Address(from: decoder)
//            company = try Company(from: decoder)
//                email = try values.decodeIfPresent(String.self, forKey: .email)
//                id = try values.decodeIfPresent(Int.self, forKey: .id)
//                name = try values.decodeIfPresent(String.self, forKey: .name)
//                phone = try values.decodeIfPresent(String.self, forKey: .phone)
//                username = try values.decodeIfPresent(String.self, forKey: .username)
//                website = try values.decodeIfPresent(String.self, forKey: .website)
//        }
//
//}
//
//extension Users: Hashable {
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(address)
//        hasher.combine(company)
//        hasher.combine(email)
//        hasher.combine(id)
//        hasher.combine(name)
//        hasher.combine(phone)
//        hasher.combine(username)
//        hasher.combine(website)
//    }
//}
//
//
//struct Company : Codable {
//
//        let bs : String?
//        let catchPhrase : String?
//        let name : String?
//
//        enum CodingKeys: String, CodingKey {
//                case bs = "bs"
//                case catchPhrase = "catchPhrase"
//                case name = "name"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                bs = try values.decodeIfPresent(String.self, forKey: .bs)
//                catchPhrase = try values.decodeIfPresent(String.self, forKey: .catchPhrase)
//                name = try values.decodeIfPresent(String.self, forKey: .name)
//        }
//
//}
//
//extension Company: Hashable {
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(bs)
//        hasher.combine(catchPhrase)
//        hasher.combine(name)
//
//    }
//}
//
//
//struct Address : Codable {
//
//        let city : String?
//        let geo : Geo?
//        let street : String?
//        let suite : String?
//        let zipcode : String?
//
//        enum CodingKeys: String, CodingKey {
//                case city = "city"
//                case geo = "geo"
//                case street = "street"
//                case suite = "suite"
//                case zipcode = "zipcode"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                city = try values.decodeIfPresent(String.self, forKey: .city)
//                geo = try Geo(from: decoder)
//                street = try values.decodeIfPresent(String.self, forKey: .street)
//                suite = try values.decodeIfPresent(String.self, forKey: .suite)
//                zipcode = try values.decodeIfPresent(String.self, forKey: .zipcode)
//        }
//
//}
//
//extension Address: Hashable {
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(city)
//        hasher.combine(geo)
//        hasher.combine(street)
//        hasher.combine(suite)
//        hasher.combine(zipcode)
//
//    }
//}
//
//
//
//struct Geo : Codable {
//
//        let lat : String?
//        let lng : String?
//
//        enum CodingKeys: String, CodingKey {
//                case lat = "lat"
//                case lng = "lng"
//        }
//
//        init(from decoder: Decoder) throws {
//                let values = try decoder.container(keyedBy: CodingKeys.self)
//                lat = try values.decodeIfPresent(String.self, forKey: .lat)
//                lng = try values.decodeIfPresent(String.self, forKey: .lng)
//        }
//
//}
//
//extension Geo: Hashable {
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(lat)
//        hasher.combine(lng)
//
//
//    }
//}

struct Users : Codable,Hashable {

        let data : [Datum]?
        let page : Int?
        let perPage : Int?
        let support : Support?
        let total : Int?
        let totalPages : Int?

        enum CodingKeys: String, CodingKey {
                case data = "data"
                case page = "page"
                case perPage = "per_page"
                case support = "support"
                case total = "total"
                case totalPages = "total_pages"
        }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(data)
        hasher.combine(page)
        hasher.combine(perPage)
        hasher.combine(support)
        hasher.combine(total)
        hasher.combine(totalPages)
    }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                data = try values.decodeIfPresent([Datum].self, forKey: .data)
                page = try values.decodeIfPresent(Int.self, forKey: .page)
                perPage = try values.decodeIfPresent(Int.self, forKey: .perPage)
                support = try Support(from: decoder)
                total = try values.decodeIfPresent(Int.self, forKey: .total)
                totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        }
    


}

struct Support : Codable {

        let text : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case text = "text"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                text = try values.decodeIfPresent(String.self, forKey: .text)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}

extension Support: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(text)
        hasher.combine(url)
       
    }
}


struct Datum : Codable {

        let avatar : String?
        let email : String?
        let firstName : String?
        let id : Int?
        let lastName : String?

        enum CodingKeys: String, CodingKey {
                case avatar = "avatar"
                case email = "email"
                case firstName = "first_name"
                case id = "id"
                case lastName = "last_name"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                avatar = try values.decodeIfPresent(String.self, forKey: .avatar)
                email = try values.decodeIfPresent(String.self, forKey: .email)
                firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        }

}

extension Datum: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(avatar)
        hasher.combine(email)
        hasher.combine(firstName)
        hasher.combine(id)
        hasher.combine(lastName)
       
    }
}

