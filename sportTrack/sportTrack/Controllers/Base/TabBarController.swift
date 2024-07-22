//
//  TabBarController.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

enum Tabs: Int, CaseIterable{
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController{
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureAppearance()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(_ tab: Tabs){
        selectedIndex = tab.rawValue
    }
    
    private func configureAppearance(){
        tabBar.tintColor = R.Colors.active
        tabBar.barTintColor = R.Colors.inactive
        tabBar.backgroundColor = .white
        
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = R.Colors.separator.cgColor
        tabBar.layer.masksToBounds = true
        
        let controllers: [NavigationBarController] = Tabs.allCases.map { tab in
            let controller = NavigationBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(
                title: R.Strings.TabBar.title(for: tab),
                image: R.Images.TabBar.icon(for: tab),
                tag: tab.rawValue)
            return controller
        }
        
        
        setViewControllers(controllers, animated: false)
    }
    
    
    private func getController(for tab: Tabs) -> WABaseController{
        switch tab {
        case .overview: return OverviewController()
        case .session: return SessionController()
        case .progress: return ProgressController()
        case .settings: return SettingsController()
        }
    }
    
}
