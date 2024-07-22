//
//  StatsView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

final class StatsView: WABaseInfoView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        return view
    }()
    
    func configure(with items: [StatsItems]){
        items.forEach {
            let itemView = StatsItemView()
            itemView.configure(with: $0)
            
            stackView.addArrangedSubview(itemView)
        }
    }
    
//    override func setupViews() {
//        super.setupViews()
//        contentView.addView(itemView)
//
//        itemView.configure(with: StatsItemView.StatsItem.init(
//            nameItem: .heartRate,
//            value: "155 bpm",
//            title: Resources.Strings.Session.heartRate.uppercased()))
//        NSLayoutConstraint.activate([
//            itemView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
//        ])
//    }
    
    
}

extension StatsView{
    override func setupViews() {
        super.setupViews()
        addView(stackView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
