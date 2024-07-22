//
//  ProgressController.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

class ProgressController: WABaseController{
    
    private let dailyPerformanceView = DailyPerformanceView(
        with: R.Strings.Progress.dailyPerfomance,
        buttonTitle: R.Strings.Progress.last7Days)
    
    
    private let monthlyPerformanceView = MonthlyPerformanceView(
        with: R.Strings.Progress.monthlyPerformance,
        buttonTitle: R.Strings.Progress.last10Month)
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ProgressController{
    override func setupViews() {
        super.setupViews()
        view.addView(dailyPerformanceView)
        view.addView(monthlyPerformanceView)
    }
    
    override func constraintView() {
        super.constraintView()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
        
        
        dailyPerformanceView.configure(with: [
            .init(value: "1", heightMultiplier: 0.2, title: "Mon"),
            .init(value: "2", heightMultiplier: 0.4, title: "Tue"),
            .init(value: "3", heightMultiplier: 0.6, title: "Wed"),
            .init(value: "4", heightMultiplier: 0.8, title: "Thu"),
            .init(value: "5", heightMultiplier: 1, title: "Fri"),
            .init(value: "3", heightMultiplier: 0.6, title: "Sat"),
            .init(value: "2", heightMultiplier: 0.4, title: "Sun"),
        ])
        
        monthlyPerformanceView.configure(with: [
            .init(value: 45, title: "Mar"),
            .init(value: 55, title: "Apr"),
            .init(value: 60, title: "May"),
            .init(value: 65, title: "Jun"),
            .init(value: 70, title: "Jul"),
            .init(value: 80, title: "Aug"),
            .init(value: 65, title: "Sep"),
            .init(value: 45, title: "Oct"),
            .init(value: 30, title: "Nov"),
            .init(value: 15, title: "Dec"),
            
        ], topChartOffset: 10)
    }
    
}
