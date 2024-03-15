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
            bookAPIClient.fetchBooks(offset: 10) { [weak self] fetchedBooks in
                if let fetchedBooks = fetchedBooks {
                    // データの取得が成功した場合、booksプロパティに保存
                    self?.books = fetchedBooks
                    // データを使ってテーブルビューを更新などの処理を行う
                } else {
                    // データの取得が失敗した場合の処理
                    print("Failed to fetch books.")
                }
            }
    }
}

extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // BookCellを再利用可能な形で取得
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookCell else {
            return UITableViewCell() // キャストに失敗した場合はデフォルトのセルを返す
        }
        
        
        
        // セルにデータを設定
        if let book = books?[indexPath.row] {
            guard let imageUrl = URL(string: book.url) else {
                print("Invalid URL")
                return UITableViewCell()// URLが無効な場合は空のセルが返ってくる
            }
            
            if let imageData = try? Data(contentsOf: imageUrl) {
                    // URLからデータを取得できた場合はUIImageを作成してUIImageViewに設定
                    let image = UIImage(data: imageData)
                        cell.leadingImage.image = image
                } else {
                    // URLからデータを取得できなかった場合はデフォルトの画像を設定するなどの処理を行う
                    cell.leadingImage.image = UIImage(named: "Book")
                }
//            cell.leadingImage.image = UIImage(image: imageUrl)
            cell.titleLabel.text = book.title
            cell.detailLabel.text = book.detail
            // 他のプロパティも設定可能
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // テーブルビューの行数が0より大きい場合にのみスクロールを行う
        if tableView.numberOfRows(inSection: 0) > 0 {
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        }
        return books?.count ?? 0
    }
}

extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

