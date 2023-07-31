//
//  MainCell.swift
//  AV_41.8.1_HW_03
//
//  Created by Anatolii Shumov on 31/07/2023.
//

import UIKit

class MainCell: UICollectionViewCell {
    static let reuseIdentifier = "MainCell"
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }()
    
    let snapshotImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    
    let playImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.tintColor = .white
        image.image = UIImage(systemName: "play.circle")
        return image
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        layer.cornerRadius = 20
        
        addSubview(snapshotImage)
        horizontalStackView.addArrangedSubview(playImage)
        horizontalStackView.addArrangedSubview(titleLabel)
        snapshotImage.addSubview(horizontalStackView)
        snapshotImage.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        playImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            snapshotImage.topAnchor.constraint(equalTo: topAnchor),
            snapshotImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            snapshotImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            snapshotImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: snapshotImage.leadingAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: snapshotImage.trailingAnchor, constant: -10),
            horizontalStackView.bottomAnchor.constraint(equalTo: snapshotImage.bottomAnchor, constant: -10),
            playImage.widthAnchor.constraint(equalToConstant: 40),
            playImage.heightAnchor.constraint(equalTo: playImage.widthAnchor, multiplier: 1/1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
