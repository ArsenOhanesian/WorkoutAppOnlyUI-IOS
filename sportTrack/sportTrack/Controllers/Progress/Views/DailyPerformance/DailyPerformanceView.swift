//
//  PerformanceView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

final class DailyPerformanceView: WABaseInfoView{
    
    private let barsView = WABarsView()
    
    func configure(with items: [WABarView.Data]){
        barsView.configure(with: items)
    }
}

extension DailyPerformanceView{
    override func setupViews() {
        super.setupViews()
        addView(barsView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
    
}
