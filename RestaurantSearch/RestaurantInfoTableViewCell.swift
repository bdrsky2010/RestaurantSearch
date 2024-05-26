//
//  RestaurantInfoTableViewCell.swift
//  RestaurantSearch
//
//  Created by Minjae Kim on 5/24/24.
//

import UIKit

enum ContentType {
    case title, categoryOrPhoneNum, address
    
    var font: UIFont {
        switch self {
        case .title:
            return .systemFont(ofSize: 17, weight: .bold)
        case .categoryOrPhoneNum:
            return .systemFont(ofSize: 14)
        case .address:
            return .systemFont(ofSize: 15)
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .title:
            return .label
        case .categoryOrPhoneNum:
            return .systemGray
        case .address:
            return .label
        }
    }
}

class RestaurantInfoTableViewCell: UITableViewCell {

    static let reuseIdentifier = "RestaurantInfoTableViewCell"
    
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    private func configUI() {
        configInfoView()
        configthumbnailImage()
        configContentLabel()
        
        likeImageView.tintColor = .systemRed
    }
    
    private func configInfoView() {
        infoView.layer.borderWidth = 1
        infoView.layer.borderColor = UIColor.systemGray6.cgColor
        infoView.layer.cornerRadius = 20
        
        infoView.layer.shadowColor = UIColor.systemGray.cgColor
        infoView.layer.shadowOpacity = 0.2
        infoView.layer.shadowRadius = 4
        infoView.layer.shadowOffset = .init(width: 1, height: 1)
    }
    
    private func configthumbnailImage() {
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.layer.cornerRadius = 21
        thumbnailImageView.layer.maskedCorners = .ArrayLiteralElement(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
    }
    
    private func configContentLabel() {
        configLabel(titleLabel, contentType: .title)
        configLabel(categoryLabel,
                    contentType: .categoryOrPhoneNum)
        configLabel(addressLabel, contentType: .address)
        configLabel(phoneNumberLabel,
                    contentType: .categoryOrPhoneNum)
    }
    
    private func configLabel(_ label: UILabel,
                             contentType: ContentType) {
        label.font = contentType.font
        label.textColor = contentType.textColor
    }
    
    public func configRestaurantInfoCell(_ restaurant: Restaurant) {
        titleLabel.text = restaurant.name
        categoryLabel.text = restaurant.category
        addressLabel.text = restaurant.address
        phoneNumberLabel.text = restaurant.phoneNumber
        
        let likeImageName = restaurant.isLike ? "heart.fill" : "heart"
        let likeImage = UIImage(systemName: likeImageName)
        likeImageView.image = likeImage
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
