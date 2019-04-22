//
//  HomeViewController.swift
//  threeStructureTabView
//
//  Created by OHYERINA on 15/04/2019.
//  Copyright © 2019 OHYERINA. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController : UIViewController {

    @IBOutlet weak var HomeTopScroller: UIScrollView!
    @IBOutlet weak var HomeSubScroller: UIScrollView!
    
    let jsonObject :[[NSString : Any]] = [
        ["main" : "live", "sub" : ["livesub1","livesub2","livesub3"]],
        ["main" : "vod", "sub" : ["vodsub1","vodsub2","vodsub3","vodsub4"]],
        ["main" : "movie", "sub" : ["moviesub1","moviesub2","moviesub3","moviesub4","moviesub5"]]
    ]
    var mainButtonArray = [UIButton]()
    var subButtonArray = [UIButton]()
    let selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0, j = 0
        var dixt = jsonObject[selectedIndex]
        let list = dixt["sub"] as! [String]
        
        for dict in jsonObject {
            
            let mainButton = self.makeTabBarButton(buttonArray: mainButtonArray, targetScrollView: HomeTopScroller, index: i, title: dict["main"] as? String ?? "")
            mainButtonArray.append(mainButton)
            i += 1
        }
         HomeTopScroller.contentSize = CGSize(width: 150 * mainButtonArray.count, height: Int(HomeTopScroller.bounds.height))
       
        for subTitle in list {
            let subButton = self.makeTabBarButton(buttonArray: subButtonArray, targetScrollView: HomeSubScroller, index: j, title: subTitle)
            subButtonArray.append(subButton)
            j += 1
        }
        HomeSubScroller.contentSize = CGSize(width: 150 * subButtonArray.count, height: Int(HomeSubScroller.bounds.height))
    }


    func makeTabBarButton(buttonArray : [UIButton], targetScrollView : UIScrollView, index : Int, title: String) -> UIButton {
        
        let button = UIButton()
        button.tag = index
        button.isUserInteractionEnabled = true
        targetScrollView.addSubview(button)
        
        button.setTitle(title, for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.normal)
        button.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(targetScrollView)
            
            if index == 0 {
                make.leading.equalTo(0)
            } else {
                if buttonArray.count > 0 {
                    let prevButton = buttonArray[index - 1]
                    make.leading.equalTo(prevButton.snp.trailing)
                }
            }
            make.top.equalTo(0)
        }
        
        button.backgroundColor = UIColor.lightGray
        return button
    }
}

