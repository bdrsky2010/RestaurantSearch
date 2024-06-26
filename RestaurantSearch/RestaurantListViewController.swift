//
//  RestaurantListViewController.swift
//  RestaurantSearch
//
//  Created by Minjae Kim on 5/27/24.
//

import UIKit

enum Status {
    case search, none
}

enum FoodCategory: CaseIterable {
    case all, kr, ch, jp, us, etc
    
    var title: String {
        switch self {
        case .all:
            return "전체"
        case .kr:
            return "한식"
        case .ch:
            return "중식"
        case .jp:
            return "일식"
        case .us:
            return "양식"
        case .etc:
            return "기타"
        }
    }
    
    var imageName: String {
        switch self {
        case .all:
            return "globe.central.south.asia.fill"
        case .kr:
            return "character.bubble.ko"
        case .ch:
            return "character.bubble.zh"
        case .jp:
            return "character.bubble.ja"
        case .us:
            return "character.bubble"
        case .etc:
            return "ellipsis"
        }
    }
}

final class RestaurantListViewController: UIViewController,
                                          UITableViewDelegate,
                                          UITableViewDataSource {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet var tabItemStackList: [UIStackView]!
    @IBOutlet var tabItemImageList: [UIImageView]!
    @IBOutlet var tabItemLabelList: [UILabel]!
    
    @IBOutlet weak var tabScrollView: UIScrollView!
    @IBOutlet weak var restaurantTableView: UITableView!
    
    private var tabIndex = 0
    
    private var restaurantList: [Restaurant] = [
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20170712_44%2F1499829806371zeBdS_JPEG%2FIMG_1167.jpg",
            latitude: 37.514746,
            longitude: 126.898935,
            name: "24시전주명가콩나물국밥 문래점",
            address: "서울 영등포구 선유로 33 문래대림아파트",
            phoneNumber: "02-2677-6339",
            category: "한식",
            price: 5000,
            type: 300,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220125_203%2F1643090127099hJdXt_JPEG%2F%25B5%25A5%25C0%25CF%25B8%25AE%25C7%25AA%25B5%25E53.jpg",
            latitude: 37.516107,
            longitude: 126.886853,
            name: "데일리 푸드",
            address: "서울 영등포구 선유로3길 10 하우스디비즈 지하1층 B101호",
            phoneNumber: "02-2675-7462",
            category: "한식",
            price: 1000,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fmyplace-phinf.pstatic.net%2F20200805_46%2F1596638713444O2aFh_JPEG%2Fupload_bdf4d5522f8457c7ee6a70f078385a09.jpg%3Ftype%3Dw1500_60_sharpen",
            latitude: 37.518996,
            longitude: 126.885964,
            name: "에이스한식셀프",
            address: "서울 영등포구 선유로13길 25",
            phoneNumber: "02-2257-8338",
            category: "한식",
            price: 5000000,
            type: 200,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fldb-phinf.pstatic.net%2F20220321_224%2F1647864887877IgL0B_JPEG%2F%25BD%25AC%25C1%25EE%25BA%25A3%25C0%25CC%25B1%25DB_%25B8%25DE%25B4%25BA_%25C8%25AB%25BA%25B8_%25C0%25CC%25B9%25CC%25C1%25F6_18.JPG",
            latitude: 37.517597,
            longitude: 126.887247,
            name: "쉬즈베이글 문래점",
            address: "서울 영등포구 선유로9길 10 SK V1 center 1층 109",
            phoneNumber: "0507-877-3884",
            category: "카페",
            price: 98564200,
            type: 200,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDAyMTZfODEg%2FMDAxNzA4MDQwMjI4NTc2.yUyCYKI-2s0bKERjiG32FAslwx0hu6cUrTsAyC6uWyog.vI5yXJcBbcL8eMOzC23k0jKx3sT5QqvvgeJ7N3WP048g.JPEG%2F20240131_114414.heic.jpg%3Ftype%3Dw1500_60_sharpen",
            latitude: 37.517801,
            longitude: 126.887159,
            name: "탐라순대국감자탕 문래점",
            address: "서울 영등포구 선유로9길 10 1층",
            phoneNumber: "0507-1345-3738",
            category: "한식",
            price: 10,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMzEyMThfMTgy%2FMDAxNzAyODcxODI2NjIx.WMLXCYtCEu_wHtSZjHfeRxnRuq9QB8ShrajsuldMAfEg.JGXZgl6qxtnjaQVkcp-fLnhfsa4iFxFi-5Sp8X3lKKcg.JPEG%2F8844E8E3-47D7-462A-9936-B659D330071D.jpeg%3Ftype%3Dw1500_60_sharpen",
            latitude: 37.516912,
            longitude: 126.888908,
            name: "홍대교동짬뽕",
            address: "서울 영등포구 선유로 34",
            phoneNumber: "02-2679-4559",
            category: "중식",
            price: 3333,
            type: 200,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA5MDFfMTc1%2FMDAxNjkzNTY0NTIyNDA4.IblBXWrjeR8ByZJqn6gSnZbL8R_MjgW8Wq8s2Ud_w7og.ICGNMqW7-6lKQVSnH03JMGvqoMXopOVkBbQqdbO24m0g.JPEG.cnsrkfl123%2F20230901%25A3%25DF184347.jpg",
            latitude: 37.519032,
            longitude: 126.886547,
            name: "종로김밥 문래점",
            address: "서울 영등포구 선유로13길 25 에이스하이테크시티2",
            phoneNumber: "02-2257-8191",
            category: "분식",
            price: 94290,
            type: 300,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyMzA4MjJfMTMx%2FMDAxNjkyNzE0NjMzODUz.aupfFdz_c9ZgASbKrg7CkC0NSMGD26lC_yTVoqOqV3Ig.VJ-lTGz8I1lW7tAIzVjoVU3wXS0KI1trTV0u3eLVxCYg.JPEG%2F20230801_181655.jpg%3Ftype%3Dw1500_60_sharpen",
            latitude: 37.518940,
            longitude: 126.886298,
            name: "본설렁탕 문래점",
            address: "서울 영등포구 선유로13길 25 117호",
            phoneNumber: "0507-1313-8110",
            category: "한식",
            price: 9867123467,
            type: 200,
            isLike: false
        ),
        Restaurant(
            image: "https://search.pstatic.net/common/?src=https%3A%2F%2Fpup-review-phinf.pstatic.net%2FMjAyNDA1MDRfMTIg%2FMDAxNzE0ODAxODI2OTIz.CZvXaKI2gC1rj-emfR_4kft0J6iMnPTwIXz3daGZm5cg.A6J9Zr6IccLZm8uBTVDcqgXvneXoYSEsAi_PzEZjre8g.JPEG%2F20240504_134756.jpg.jpg%3Ftype%3Dw1500_60_sharpen",
            latitude: 37.516329,
            longitude: 126.889686,
            name: "영일분식",
            address: "서울 영등포구 도림로141가길 34-1",
            phoneNumber: "02-2636-9817",
            category: "분식",
            price: 20000,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://media.istockphoto.com/id/1305297526/ko/%EC%82%AC%EC%A7%84/%EB%B0%94%EC%82%AD%EB%B0%94%EC%82%AD%ED%95%9C-%EA%B7%9C%EC%B9%B4%EC%B8%A0-%EC%83%90%EB%9F%AC%EB%93%9C.webp?b=1&s=170667a&w=0&k=20&c=I-ZJciXHYwoIDLlVL3wpEDfNex_6YRiZwQSjVmncSJw=",
            latitude: 37.517829,
            longitude: 126.887020,
            name: "문래동 훈카츠",
            address: "서울 영등포구 선유로9길 10 1층128호",
            phoneNumber: "02-2677-0225",
            category: "일식",
            price: 84438,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://media.istockphoto.com/id/1481907136/ko/%EC%82%AC%EC%A7%84/%EB%8F%88%EA%B0%80%EC%8A%A4-%EB%8F%BC%EC%A7%80%EA%B3%A0%EA%B8%B0-%ED%8A%80%EA%B9%80-%EB%A0%88%EC%8A%A4%ED%86%A0%EB%9E%91%EC%97%90%EC%84%9C-%EC%A0%91%EC%8B%9C-%EC%A0%9C%EA%B3%B5.webp?b=1&s=170667a&w=0&k=20&c=BTJpn5113rfBzydevp73K5gm_6fWlsh6T2RMyZ5unb4=",
            latitude: 37.516760,
            longitude: 126.889274,
            name: "문래동 돈까스",
            address: "서울 영등포구 도림로147길 2 문래동돈까스",
            phoneNumber: "0507-1390-1007",
            category: "경양식",
            price: 112376,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://images.unsplash.com/photo-1598504775866-e842291dbe10?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8JUVEJTg2JUEwJUVCJUE3JTg4JUVEJTg2JUEwJUVEJThDJThDJUVDJThBJUE0JUVEJTgzJTgwfGVufDB8fDB8fHww",
            latitude: 37.516996,
            longitude: 126.888047,
            name: "선식당 문래점",
            address: "서울 영등포구 선유로 33 문래대림아파트101동 1층상가",
            phoneNumber: "0507-1391-0135",
            category: "양식",
            price: 16900,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://media.istockphoto.com/id/1133088344/ko/%EC%82%AC%EC%A7%84/%EC%88%9C%EB%8C%80%EA%B5%AD.webp?b=1&s=170667a&w=0&k=20&c=D9Er2FqMhhnvm4fY0s6mtzY7U3J2m6jXKPJxFur7cts=",
            latitude: 37.515690,
            longitude: 126.891630,
            name: "오복순대국",
            address: "서울 영등포구 도림로 465",
            phoneNumber: "0507-1408-4183",
            category: "한식",
            price: 38000,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://images.unsplash.com/photo-1617093727343-374698b1b08d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fCVFQSVCNSVBRCVFQyU4OCU5OHxlbnwwfHwwfHx8MA%3D%3D",
            latitude: 37.518829,
            longitude: 126.887853,
            name: "제주올래국수",
            address: "서울 영등포구 선유로11길 12 문래파라곤",
            phoneNumber: "02-2632-5677",
            category: "한식",
            price: 7612,
            type: 100,
            isLike: false
        ),
        Restaurant(
            image: "https://images.unsplash.com/photo-1704890514547-b6b7d64086c1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fCVFQSVCOSU4MCVFQyVCOSU5OCVFQyVCMCU4QyVFQSVCMCU5Q3xlbnwwfHwwfHx8MA%3D%3D",
            latitude: 37.516829,
            longitude: 126.889325,
            name: "백채김치찌개 문래점",
            address: "서울 영등포구 도림로 489",
            phoneNumber: "02-2635-5206",
            category: "한식",
            price: 112358500,
            type: 200,
            isLike: false
        ),
        Restaurant(
            image: "https://images.unsplash.com/photo-1629127524579-269c62b90a96?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8JUVDJTlBJUIwJUVCJThGJTk5fGVufDB8fDB8fHww",
            latitude: 37.516857,
            longitude: 126.889075,
            name: "오타루소바우동",
            address: "서울 영등포구 도림로 491-2",
            phoneNumber: "02-2634-5460",
            category: "일식",
            price: 658,
            type: 300,
            isLike: false
        )
    ]
    private var filteredRestaurantList: [Restaurant]  = []
    
    private let categoryList = FoodCategory.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredRestaurantList = restaurantList
        
        confingUI()
        
        tabScrollView.showsHorizontalScrollIndicator = false
        restaurantTableView.rowHeight = 260
        restaurantTableView.delegate = self
        restaurantTableView.dataSource = self
        restaurantTableView.keyboardDismissMode = .onDrag
        restaurantTableView.separatorStyle = .none
        
        let nib = UINib(nibName: RestaurantInfoTableViewCell.reuseIdentifier,
                        bundle: nil)
        restaurantTableView.register(nib,
                                     forCellReuseIdentifier: RestaurantInfoTableViewCell.reuseIdentifier)
    }
    
    private func confingUI() {
        configSearchViewUI()
        configCustomTabBar()
    }
    
    private func configSearchViewUI() {
        configSearchView()
        configSearchImageView()
        configSearchTextField()
    }
    
    private func configSearchView() {
        searchView.layer.borderWidth = 1
        searchView.layer.borderColor = UIColor.systemGray6.cgColor
        searchView.layer.cornerRadius = 25
        
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
    
    private func configCustomTabBar() {
        categoryList.enumerated().forEach {
            let index = $0.offset
            let category = $0.element
            
            configTabBarItemImage(tabItemImageList[index],
                                  imageName: category.imageName)
            configTabBarItemLabel(tabItemLabelList[index],
                                  title: category.title)
            
            tabItemStackList[index].tag = index
        }
        
        tabItemImageList[tabIndex].tintColor = .label
        tabItemLabelList[tabIndex].textColor = .label
    }
    
    private func configTabBarItemImage(_ imageView: UIImageView, imageName: String) {
        imageView.image = UIImage(systemName: imageName)
        imageView.preferredSymbolConfiguration = .init(pointSize: 30, weight: .thin, scale: .small)
        imageView.tintColor = .systemGray
    }
    
    private func configTabBarItemLabel(_ label: UILabel, title: String) {
        label.text = title
        label.font = .systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .center
    }
    
    private func changedTabItemChangeColor() {
        
        (0..<tabItemStackList.count).forEach { index in
            tabItemImageList[index].tintColor = index == tabIndex ? .label : .systemGray
            tabItemLabelList[index].textColor = index == tabIndex ? .label : .systemGray
        }
    }
    
    @IBAction func tabItemTapped(_ sender: UITapGestureRecognizer) {
        
        guard let tag = sender.view?.tag else { return }
        
        tabIndex = tag
        
        changedTabItemChangeColor()
        
        filteredRestaurantList = filteringRestaurantList(status: .none)
        
        restaurantTableView.reloadData()
        
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredRestaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = RestaurantInfoTableViewCell.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RestaurantInfoTableViewCell
        
        let index = indexPath.row
        let restaurant = filteredRestaurantList[index]
        
        cell.configRestaurantInfoCell(restaurant)
        cell.likeImageView.tag = index
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(likeImageTapped))
        cell.likeImageView.isUserInteractionEnabled = true
        cell.likeImageView.addGestureRecognizer(tapGesture)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    @objc
    private func likeImageTapped(sender: UITapGestureRecognizer) {
        guard let imageView = sender.view as? UIImageView else { return }
        
        let index = imageView.tag
        
        for i in 0..<restaurantList.count {
            if restaurantList[i] === filteredRestaurantList[index] {
                restaurantList[i].isLike.toggle()
                changeLikeImage(imageView, index: i)
                break
            }
        }
    }
    
    private func changeLikeImage(_ imageView: UIImageView, index: Int) {
        let likeImageName = restaurantList[index].isLike ? "heart.fill" : "heart"
        let likeImage = UIImage(systemName: likeImageName)
        imageView.image = likeImage
    }
    
    @IBAction func searchTextFieldReturned(_ sender: UITextField) {
        filteredRestaurantList = filteringRestaurantList(status: .search)
        
        restaurantTableView.reloadData()
        
        view.endEditing(true)
        sender.text = nil
    }
    
    // 검색 혹은 탭바 눌렀을 경우 식당 리스트 필터링 메서드
    private func filteringRestaurantList(status: Status) -> [Restaurant] {
        switch status {
        case .search:
            let restaurantList = filteredRestaurantList
            
            guard let query = searchTextField.text,
                  !query.isEmpty else { return restaurantList }
            
            switch tabIndex {
            case 0:
                return restaurantList.filter {
                    $0.name.contains(query)
                }
            case 1, 2, 3, 4:
                return restaurantList.filter {
                    $0.category == categoryList[tabIndex].title
                }.filter {
                    $0.name.contains(query)
                }
            default:
                return restaurantList.filter {
                    !(($0.category == categoryList[1].title) || ($0.category == categoryList[2].title) || ($0.category == categoryList[3].title) || ($0.category == categoryList[4].title))
                }.filter {
                    $0.name.contains(query)
                }
            }
            
        case .none:
            switch tabIndex {
            case 0:
                return restaurantList
            case 1, 2, 3, 4:
                return restaurantList.filter {
                    $0.category == categoryList[tabIndex].title
                }
            default:
                return restaurantList.filter {
                    !(($0.category == categoryList[1].title) || ($0.category == categoryList[2].title) || ($0.category == categoryList[3].title) || ($0.category == categoryList[4].title))
                }
            }
        }
    }
}
