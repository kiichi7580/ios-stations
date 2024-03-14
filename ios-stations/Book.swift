//
//  Book.swift
//  ios-stations
//

struct Book: Decodable {
    let id: String
    let title: String
    let url: String
    let detail: String
    let review: String
    let reviewer: String
    var isMine: Bool
    
    init(id: String, title: String, url: String, detail: String, review: String, reviewer: String, isMine: Bool) {
        self.id = id
        self.title = title
        self.url = url
        self.detail = detail
        self.review = review
        self.reviewer = reviewer
        self.isMine = isMine
        }
}


