//
//  FirstViewController.swift
//  ios-stations
//

import UIKit

class FirstViewController: UIViewController {

    var books: [Book]?
    let bookAPIClient = BookAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetchBooksメソッドを呼び出し、APIからデータを取得
               bookAPIClient.fetchBooks(offset: 0) { [weak self] fetchedBooks in
                   if let fetchedBooks = fetchedBooks {
                       // データの取得が成功した場合、booksプロパティに保存
                       self?.books = fetchedBooks
                       // データを使ってテーブルビューを更新などの処理を行う
                       // ここに処理を追加
                   } else {
                       // データの取得が失敗した場合の処理
                       print("Failed to fetch books.")
                   }
               }
    }
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

