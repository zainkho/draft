//
//  TripViewController.swift
//  Draft
//
//  Created by Zain Khoja on 11/19/19.
//

import UIKit
import SnapKit
import Kingfisher

class TripViewController: UIViewController {
    
    var trip: Trip!
    var tableView: UITableView!
    var backgroundImage: UIImageView!
    var cells: [[TripViewCellModel]]!
    
    var headerImageView: UIImageView!
    var emojiLabel: UILabel!
    var titleLabel: UILabel!
    var subtitleLabel: UILabel!
    let tripReuseIdentifier = "tripReuseIdentifier"
    let tripHeadingReuseIdentifier = "tripReuseHeadingIdentifier"
    
    var headerGradientView: UIView!
    var headerGradient: CAGradientLayer!
    var footerGradientView: UIView!
    var footerGradient: CAGradientLayer!
    
    let TITLE_TEXT_HEIGHT: CGFloat = 41
    let HEADER_TEXT_HEIGHT: CGFloat = 29
    let BODY_TEXT_HEIGHT: CGFloat = 19
    let CELL_HEIGHT: CGFloat = 24
    var HEADER_HEIGHT: CGFloat = 168
    let HEADER_LABEL_HEIGHT: CGFloat = 68
    let GRADIENT_HEIGHT: CGFloat = 96
    
    let BREEZE = UIColor(red: 239/255, green: 246/255, blue: 255/255, alpha: 1.0)
    var CREAM = UIColor(red: 255/255, green: 251/255, blue: 242/255, alpha: 1.0)
    var SPACE = UIColor(red: 27/255, green: 31/255, blue: 35/255, alpha: 1.0)
    var OCEAN = UIColor(red: 68/255, green: 77/255, blue: 86/255, alpha: 1.0)
    var RAIN = UIColor(red: 162/255, green: 162/255, blue: 162/255, alpha: 1.0)
    
    init(trip: Trip) {
        self.trip = trip
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CREAM
        
        cells = createCellsFromTrip(trip: self.trip)
        
        backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "notecard-details")
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubview(backgroundImage)
        
        headerImageView = UIImageView()
        headerImageView.backgroundColor = .darkGray
        headerImageView.kf.setImage(with: URL(string: "https://images.unsplash.com/photo-1535726917010-060104716686?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjEwMjY4OH0"))
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        view.addSubview(headerImageView)
        
        emojiLabel = UILabel()
        emojiLabel.font = UIFont.TITLE
        emojiLabel.text = trip.emoji
        view.addSubview(emojiLabel)
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.TITLE
        titleLabel.text = trip.name
        titleLabel.textColor = SPACE
        view.addSubview(titleLabel)
        
        subtitleLabel = UILabel()
        subtitleLabel.font = UIFont.LABEL
        subtitleLabel.text = String(trip.length()) + " days · " + trip.location
        subtitleLabel.textColor = OCEAN
        view.addSubview(subtitleLabel)
        
        tableView = UITableView(frame: CGRect(), style: .grouped)
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TripTableViewCell.self, forCellReuseIdentifier: tripReuseIdentifier)
        tableView.register(TripHeadingTableViewCell.self, forCellReuseIdentifier: tripHeadingReuseIdentifier)
        view.addSubview(tableView)
        
        // headerGradient
        headerGradientView = UIView()
        headerGradient = CAGradientLayer()
        headerGradient.colors = [UIColor.CREAM.cgColor, UIColor.CLEAR.cgColor]
        headerGradient.opacity = 0
        headerGradientView.layer.insertSublayer(headerGradient, at: 0)
        view.addSubview(headerGradientView)
        
        // footerGradient
        footerGradientView = UIView()
        footerGradient = CAGradientLayer()
        footerGradient.colors = [UIColor.CLEAR.cgColor, UIColor.CREAM.cgColor]
        footerGradient.opacity = 0
        footerGradientView.layer.insertSublayer(footerGradient, at: 0)
        view.addSubview(footerGradientView)
        
        // Bring cloudy gradients to front
        view.bringSubviewToFront(headerGradientView)
        view.bringSubviewToFront(footerGradientView)
        
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerGradient.frame = headerGradientView.bounds
        footerGradient.frame = footerGradientView.bounds
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y <= 1 {
            headerGradient.opacity = 0
        }
        else {
            headerGradient.opacity = 1
        }
    }
    
    func setupConstraints() {
        
        headerImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(HEADER_HEIGHT)
        }
        
        emojiLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(headerImageView.snp.bottom)
            make.leading.equalTo(SPACING_16)
            make.width.equalTo(view.frame.width - SPACING_16*2)
            make.height.equalTo(TITLE_TEXT_HEIGHT)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(emojiLabel.snp.bottom)
            make.leading.equalTo(SPACING_16)
            make.width.equalTo(view.frame.width - SPACING_16*2)
            make.height.equalTo(TITLE_TEXT_HEIGHT)
        }
        
        backgroundImage.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(SPACING_8)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(SPACING_4)
            make.leading.equalTo(SPACING_16)
            make.width.equalTo(view.frame.width - SPACING_16*2)
            make.height.equalTo(BODY_TEXT_HEIGHT)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(subtitleLabel.snp.bottomMargin).offset(SPACING_8)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        headerGradientView.snp.makeConstraints { (make) in
            make.top.equalTo(subtitleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(GRADIENT_HEIGHT)
        }
        
        footerGradientView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(GRADIENT_HEIGHT)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCellsFromTrip(trip: Trip) -> [[TripViewCellModel]] {
        var cells = [[TripViewCellModel]]()
        let days = trip.days
        for day in days {
            var dayArray = [TripViewCellModel]()
            dayArray.append(TripViewCellModel(text: "Attractions", type: .heading, img: "icon-attraction"))
            for a in day.attractions {
                dayArray.append(TripViewCellModel(text: a, type: .normal, img: nil))
            }
            dayArray.append(TripViewCellModel(text: "Restaurants", type: .heading, img: "icon-restaurant"))
            for r in day.restaurants {
                dayArray.append(TripViewCellModel(text: r, type: .normal, img: nil))
            }
            cells.append(dayArray)
        }
        return cells
    }
    
}

extension TripViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HeaderLabelView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: HEADER_HEIGHT), dayNum: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HEADER_LABEL_HEIGHT
    }
}

extension TripViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pathCell = cells[indexPath.section][indexPath.row]
        //input cells
        if pathCell.type == .normal {
            let cell = tableView.dequeueReusableCell(withIdentifier: tripReuseIdentifier, for: indexPath) as! TripTableViewCell
            cell.cellType = .normal
            cell.cellLabel.text = pathCell.text
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: tripHeadingReuseIdentifier, for: indexPath) as! TripHeadingTableViewCell
            cell.cellType = .heading
            cell.cellLabel.text = pathCell.text
            if pathCell.text == "Attractions" {
                cell.img = "icon-attraction"
            }
            else {
                cell.img = "icon-restaurant"
            }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return trip.days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + trip.days[section].attractions.count + trip.days[section].restaurants.count
    }
}
