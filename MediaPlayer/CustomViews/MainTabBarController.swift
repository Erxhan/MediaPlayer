//
//  MainTabBarController.swift
//  MediaPlayer
//
//  Created by Erxhan Selmani on 16/02/2020.
//  Copyright © 2020 Erxhan Selmani. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        UITabBar.appearance().tintColor = .systemOrange
        
        let libraryNC = createGenericNavigationController(for: LibraryViewController(), with: "Library", with: UITabBarItem(title: "Library", image: SFSymbols.library, tag: 0))
        let explorerNC = createGenericNavigationController(for: ExplorerViewController(), with: "Explorer", with: UITabBarItem(title: "Explorer", image: SFSymbols.explorer, tag: 1))
        let radioNC = createGenericNavigationController(for: RadioViewController(), with: "Radio", with: UITabBarItem(title: "Radio", image: SFSymbols.radio, tag: 2))
        let searchNC = createGenericNavigationController(for: SearchViewController(), with: "Search", with: UITabBarItem(tabBarSystemItem: .search, tag: 3))
        
        viewControllers = [libraryNC, explorerNC, radioNC, searchNC]
    }
    
    
    func createGenericNavigationController(for view: UIViewController, with title: String, with tabBarItem: UITabBarItem) -> UINavigationController {
        view.title = title
        view.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: view)
    }
    
}
