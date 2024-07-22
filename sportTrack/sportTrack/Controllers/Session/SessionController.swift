//
//  SessionController.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

class SessionController: WABaseController{
    
    private let timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Session.stepsCounter)
    
    private let timerDuration = 15.0
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped{
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        
        setTitleForNavBarButton(
            title: timerView.state == .isRunning ?
            R.Strings.Session.navBarPaused : R.Strings.Session.navBarStart,
            at: .left)
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForNavBarButton(title: R.Strings.Session.navBarStart, at: .left)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}


extension SessionController{
    override func setupViews() {
        super.setupViews()
        view.addView(timerView)
        view.addView(statsView)
        view.addView(stepsView)
    }
    
    override func constraintView() {
        super.constraintView()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),

            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinished)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callBack = { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                self.navBarRightButtonHandler()
            }
        }
        
        stepsView.configure(with: [
            .init(value: "8K", heightMultiplier: 1, title: "2/14"),
            .init(value: "7K", heightMultiplier: 0.8, title: "2/15"),
            .init(value: "5K", heightMultiplier: 0.6, title: "2/16"),
            .init(value: "6K", heightMultiplier: 0.7, title: "2/17")
        ])
        
        statsView.configure(with: [
            .avaragePace(value: "8'20''"),
            .heartRate(value: "155"),
            .totalSteps(value: "7,682"),
            .totalDistance(value: "8.25")
        ])
    }
    

    
}
