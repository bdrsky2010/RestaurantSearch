//
//  RestaurantSearchTableViewCell.swift
//  RestaurantSearch
//
//  Created by Minjae Kim on 5/24/24.
//

import UIKit

class RestaurantSearchTableViewCell: UITableViewCell {

    static let reuseIdentifier = "RestaurantSearchTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    private func configUI() {
        configSearchCell()
        configImage()
        configTextField()
    }
    
    private func configSearchCell() {
//        searchCellView.layer.cornerRadius = 20
//        searchCellView.layer.shadowOffset = .init(width: 20, height: 15)
//        searchCellView.layer.shadowOpacity = 0.5
//        searchCellView.layer.shadowRadius = 10
    }
    
    private func configImage() {
//        searchImageView.image = UIImage(systemName: "magnifyingglass")
//        searchImageView.tintColor = .systemIndigo
//        searchImageView.preferredSymbolConfiguration = .init(font: .systemFont(ofSize: 50, weight: .black))
    }
    
    private func configTextField() {
//        searchTextField.borderStyle = .none
//        searchTextField.placeholder = "어디로 먹으러 갈까요?"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
