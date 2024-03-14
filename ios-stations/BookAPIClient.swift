//
//  BookAPIClient.swift
//  ios-stations
//
import Alamofire

protocol BookAPIClientProtocol {
    func fetchBooks(offset: Int, completion: @escaping ([Book]?) -> Void)
}

class BookAPIClient: BookAPIClientProtocol {
//    func fetchBooks(offset: Int, completion: @escaping ([Book]?) -> Void) {
//        completion(nil)
    let apiUrl = "railway.bookreview.techtrain.dev/public/books?offset=20" // APIのエンドポイントURL
        
    func fetchBooks(offset: Int, completion completionHandler: @escaping ([Book]?) -> Void) {
            AF.request(apiUrl, method: .get)
                .validate() // オプション。レスポンスの検証が必要な場合に使用
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        if let jsonBooks = value as? [[String: Any]] {
                            let books = jsonBooks.compactMap { jsonBook -> Book? in
                                guard let id = jsonBook["id"] as? String,
                                      let title = jsonBook["title"] as? String,
                                      let url = jsonBook["url"] as? String,
                                      let detail = jsonBook["detail"] as? String,
                                      let review = jsonBook["review"] as? String,
                                      let reviewer = jsonBook["reviewer"] as? String else {
                                    return nil
                                }
                                return Book(id: id, title: title, url: url, detail: detail, review: review, reviewer: reviewer)
                            }
                            completionHandler(books)
                        } else {
                            completionHandler(nil) // JSONデータが不正な場合
                        }
                        
                    case .failure(let error):
                        completionHandler(nil) // リクエストが失敗した場合
                        print("Error: \(error)")
                    }
                }
    }
}
