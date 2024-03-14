//
//  FirstViewController.swift
//  ios-stations
//

import UIKit

class FirstViewController: UIViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        // BookAPIClientのインスタンスを作成
//        let bookAPIClient = BookAPIClient()
//                
//        // BookAPIClientのfetchBooksメソッドを呼び出し、ViewController自身を渡す
//        bookAPIClient.fetchBooks(offset: 5) { [weak self] fetchedBooks in
//            if let fetchedBooks = fetchedBooks {
//                // データを取得できた場合、ViewControllerのbooksプロパティに保存
//                self?.books = fetchedBooks
//            } else {
//                // データが取得できなかった場合の処理
//                print("Failed to fetch books.")
//            }
//        }
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

