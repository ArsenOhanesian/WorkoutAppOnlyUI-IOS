//
//  WeekDayView.swift
//  sportTrack
//
//  Created by arsen on 21.07.2024.
//

import UIKit

extension WeekView{
    
    final class WeekDayView: WABaseView{
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String){
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.goForward(to: index)
            let day = Date.calendar.component(.day, from: currentDay)

            let isToday = currentDay.stripTime() == Date.now.stripTime()
            
            backgroundColor = isToday ? R.Colors.active : R.Colors.background
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : R.Colors.inactive
            
            dateLabel.text =  "\(day)"
            dateLabel.textColor = isToday ? .white : R.Colors.inactive
        }
        
    }
    
}

extension WeekView.WeekDayView {
    override func setupViews() {
        super.setupViews()
        
        addView(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = R.Fonts.helvelticaRegular(with: 9)
        nameLabel.textAlignment = .center
        
        dateLabel.font = R.Fonts.helvelticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        
        
        stackView.spacing = 3
        stackView.axis = .vertical
        
    }
}
