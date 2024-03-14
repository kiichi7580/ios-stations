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
//        let url = "railway.bookreview.techtrain.dev"
//        let request = AF.request(url, method: .get)
//        request.response { response in
//            
//            let statusCode = response.response!.statusCode
//            
//            do {
//                if statusCode <= 300 {
//                    guard let data = response.data else { return }
//                    
//                    let value = try JSONDecoder.decode(T.self, from: data)
//                    completion(value)
//                }
//            } catch {
//                print("変換に失敗しました：", error)
//                print(response.debugDescription)
//            }
//        }
//        AF.request("railway.bookreview.techtrain.dev")
//        .responseData { response in
//            do {
//                let decoder: JSONDecoder = JSONDecoder()
//                let books: [Book] = try decoder.decode([Book].self, from: response.data!)
//                print(books)
//            } catch {
//                print(error.localizedDescription)
//            }
        let apiUrl = "railway.bookreview.techtrain.dev/public/books" // APIのエンドポイントURL
        
    func fetchBooks(offset: Int, completion: @escaping ([Book]?) -> Void) {
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
                            completion(books)
                        } else {
                            completion(nil) // JSONデータが不正な場合
                        }
                        
                    case .failure(let error):
                        completion(nil) // リクエストが失敗した場合
                        print("Error: \(error)")
                    }
                }
    }
}
