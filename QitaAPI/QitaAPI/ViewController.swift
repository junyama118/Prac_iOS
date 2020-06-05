//
//  ViewController.swift
//  QitaAPI
//
//  Created by 山平潤 on 2020/06/04.
//  Copyright © 2020 山平潤. All rights reserved.
//

import UIKit

struct Article: Codable {
    var title: String
    var user: User
    struct User: Codable {
        var id: String
        var iconUrl: String
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case iconUrl = "profile_image_url"
        }
    }
    var url: String
}

struct Qiita {
    
    static func fetchArticle(completion: @escaping ([Article]) -> Void) {
        
        let url = "https://qiita.com/api/v2/items"
        
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "20"),
        ]
        
        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let articles = try JSONDecoder().decode([Article].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    fileprivate var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CustumTableCell", bundle: nil), forCellReuseIdentifier: "CustumTableCell")

        setUpTableView: do {
            tableView.frame = view.frame
            tableView.dataSource = self
            view.addSubview(tableView)
        }

        Qiita.fetchArticle(completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustumTableCell = tableView.dequeueReusableCell(withIdentifier: "CustumTableCell")! as! CustumTableCell
        
        let article = articles[indexPath.row]
        cell.tit.text = article.title
        cell.user.text = article.user.id
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
}
