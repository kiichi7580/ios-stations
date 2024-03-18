//
//  FirstViewController.swift
//  ios-stations
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var books: [Book]? {
        didSet {
            tableView?.reloadData()
        }
    }
    let bookAPIClient = BookAPIClient()
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        
        
        Task {
            // fetchBooksメソッドを呼び出し、APIからデータを取得
            bookAPIClient.fetchBooks(offset: 1) { [weak self] fetchedBooks in
                DispatchQueue.main.async { [weak self] in
                    if let fetchedBooks = fetchedBooks {
                        do {
                            print("before fetchedBooks")
                            print("fetchedBooks: \(fetchedBooks)")
                            self?.books = fetchedBooks
                            self?.tableView.reloadData()
                            print("after fetchedBooks")
                        }
                    } else {
                        print("2: Failed to fetch books2.")
                    }
                    print("bookAPIClient.fetchBooks")
                }
            }
        }
    }
    
    
    
    //extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        
        
        if books == nil {
            print("books: \(String(describing: books))")
            cell.textLabel?.text = nil
            cell.detailTextLabel?.text = nil
            cell.imageView?.image = nil
        } else {
            cell.textLabel?.text = books?[indexPath.row].title
            cell.detailTextLabel?.text = books?[indexPath.row].detail
            cell.imageView?.image = UIImage(named: "Book")
        }
        
        cell.textLabel?.numberOfLines = 1
        cell.detailTextLabel?.numberOfLines = 3
        
        return cell
        
        
        func presentSecondViewController(_ sender: UITableView) {
            let nextPage = SecondViewController(url: books?[indexPath.row].url ?? "https://techbowl.co.jp/")
            self.present(nextPage, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.count ?? 0
    }
    
    //extension FirstViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        //ここに遷移処理を書く
        self.present(SecondViewController(url: books?[indexPath.row].url ?? ""), animated: true, completion: nil)
    }
}

