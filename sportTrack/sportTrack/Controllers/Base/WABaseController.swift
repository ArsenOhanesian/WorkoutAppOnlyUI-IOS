//
//  BaseController.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

enum NavBarPosition{
    case left
    case right
}

class WABaseController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        constraintView()
        configureAppearance()
    }
}

@objc extension WABaseController{
    
    func setupViews() {}
    
    func constraintView() {}
    
    func configureAppearance() {
        view.backgroundColor = R.Colors.background
    }
    
    func navBarLeftButtonHandler(){
        print("NavBar left button tapped")
    }
    
    func navBarRightButtonHandler(){
        print("NavBar right button tapped")
    }
    
}

extension WABaseController{
    func addNavBarButton(at position: NavBarPosition, with title: String){
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inactive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helvelticaRegular(with: 17)
        
        switch position{
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(title: String, at position: NavBarPosition){
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
        
        navigationController?.view.layoutSubviews()
    }
}
