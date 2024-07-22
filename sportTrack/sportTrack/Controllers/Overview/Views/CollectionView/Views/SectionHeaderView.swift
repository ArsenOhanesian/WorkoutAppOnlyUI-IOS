//
//  SectionHeaderView.swift
//  sportTrack
//
//  Created by arsen on 22.07.2024.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView{
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helvelticaRegular(with: 13)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupView()
        constraintViews()
        configureAppearance()
    }
    
    func configure(with date: Date ){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM, dd"
        
        self.title.text = dateFormatter.string(from: date).uppercased()
    }
}

private extension SectionHeaderView {
    func setupView(){
        addView(title)
    }
    
    func constraintViews(){
        NSLayoutConstraint.activate([
        title.centerXAnchor.constraint(equalTo: centerXAnchor),
        title.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
                                    
    func configureAppearance(){
    }
}
