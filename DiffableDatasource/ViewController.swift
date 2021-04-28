//
//  ViewController.swift
//  DiffableDatasource
//
//  Created by Shyam Kumar on 4/25/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate {
    
    

    enum Section {
        case all
    }
    
    struct Fruit: Hashable {
        let title: String
    }
    @IBOutlet weak var tblV: UITableView!
    var datasource: UITableViewDiffableDataSource<Section, Users>!
    var fruits = [Fruit]()
    
    var users = [Users]()
    var user = [Datum]()
    
    override func viewWillAppear(_ animated: Bool) {
        apiCall(completion: { bool in
            if bool {
                self.updateDatasource()
            }
            
        })
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tblV.dataSource = datasource
        self.datasource = UITableViewDiffableDataSource(tableView: self.tblV, cellProvider: { (tblV, indexPath, usersss) -> UITableViewCell? in

            let cell = tblV.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//            let ab = usersss.data as NSArray?
            print(indexPath)
//            let a = usersss.data?.compactMap({$0.email})
            cell.textLabel?.text = usersss.data?[indexPath.row].email
    
            return cell

        })


        tblV.delegate = self
        
        title = "My Fruits"

    }


    
    func updateDatasource() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Users>()
        snapshot.appendSections([.all])
        
//        snapshot.appendItems(users)
        snapshot.appendItems(users, toSection: .all)

        
        datasource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let user = datasource.itemIdentifier(for: indexPath) else {
            return
        }
        


    }

    func apiCall(completion: @escaping (Bool) -> Void) {
        let url = URL(string: "https://reqres.in/api/users?page=2")
        
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")

        
        AF.request(url!, method: .get).responseJSON { (res) in
            print(res)
            
            do {
            let data = try JSONDecoder().decode(Users.self, from: res.data ?? Data())
               
                self.users.append(data)
                self.user = data.data!
               completion(true)
            } catch (let err){
                print(err)
            }
            
        }
        
        
    }
    
}

