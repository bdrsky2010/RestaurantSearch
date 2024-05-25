//
//  RestaurantTableViewController.swift
//  RestaurantSearch
//
//  Created by Minjae Kim on 5/24/24.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    @IBOutlet var searchView: UIView!
    @IBOutlet var searchImageView: UIImageView!
    @IBOutlet var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configSearchViewUI()
    }
    
    private func configSearchViewUI() {
        configSearchView()
        configSearchImageView()
        configSearchTextField()
    }
    
    private func configSearchView() {
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.systemGray6.cgColor
        searchView.layer.cornerRadius = 30
        
        searchView.layer.shadowColor = UIColor.systemGray.cgColor
        searchView.layer.shadowOpacity = 0.2
        searchView.layer.shadowRadius = 4
        searchView.layer.shadowOffset = .init(width: 1, height: 1)
    }
    
    private func configSearchImageView() {
        searchImageView.image = UIImage(systemName: "magnifyingglass")
        searchImageView.preferredSymbolConfiguration = .init(font: .boldSystemFont(ofSize: 20))
        searchImageView.tintColor = .label
    }
    
    private func configSearchTextField() {
        searchTextField.borderStyle = .none
        searchTextField.attributedPlaceholder = NSAttributedString(string: "어디로 먹으러 갈까요?", attributes: [NSAttributedString.Key.foregroundColor : UIColor.label])
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 70
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print(#function)
//        let identifier = RestaurantSearchTableViewCell.reuseIdentifier
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RestaurantSearchTableViewCell
//        return cell
//        
//    }

}
