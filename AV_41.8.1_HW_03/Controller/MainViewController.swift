//
//  MainViewController.swift
//  AV_41.8.1_HW_03
//
//  Created by Anatolii Shumov on 31/07/2023.
//

import UIKit
import RxCocoa
import RxSwift
import AVKit
import AVFoundation
import SDWebImage

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    private var collectionView: UICollectionView!
    private var viewModel = MainViewModel()
    private var bag = DisposeBag()
    let mainLayout = MainLayout()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Animation & Cartoons"
        view.backgroundColor = .white
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: mainLayout.createLayout())
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: MainCell.reuseIdentifier)
        view.addSubview(collectionView)
        bindCollectionViewData()
        
        viewModel.playerController = AVPlayerViewController()
    }
    
    func bindCollectionViewData() {
        viewModel.items.bind(to: collectionView.rx.items(
            cellIdentifier: MainCell.reuseIdentifier,
            cellType: MainCell.self)) { (item, model, cell) in
                cell.titleLabel.text = model.title
                guard let url = URL(string: model.imageURL ?? "") else { return }
                DispatchQueue.main.async {
                    cell.snapshotImage.sd_setImage(with: url, placeholderImage: nil, options: [.continueInBackground, .progressiveLoad])
                }
            }.disposed(by: bag)
        
        collectionView.rx.modelSelected(Model.self).bind { model in
            DispatchQueue.main.async {
                guard let playerController = self.viewModel.playVideo(model.videoURL) else { return }
                self.present(playerController, animated: true)
            }
        }.disposed(by: bag)
        
        viewModel.setData()
    }
    
}

