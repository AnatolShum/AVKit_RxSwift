//
//  MainViewModel.swift
//  AV_41.8.1_HW_03
//
//  Created by Anatolii Shumov on 31/07/2023.
//

import Foundation
import RxCocoa
import RxSwift
import AVKit
import AVFoundation
import UIKit

class MainViewModel {
    var items = PublishSubject<[Model]>()
    var player = AVPlayer()
    var playerController: AVPlayerViewController!
    
    func playVideo(_ url: String) -> AVPlayerViewController? {
        guard let urlString = URL(string: url) else { return nil }
        player = AVPlayer(url: urlString)
        
        playerController.player = player
        playerController.player?.play()
        
        return playerController
    }
   
    func setData() {
        let model = [
        Model(videoURL: "https://ia801502.us.archive.org/23/items/jetsons-complete-series/The.Jetsons.S01E01.WEBRip.x264-ION10.mp4",
              imageURL: "https://archive.org/services/img/jetsons-complete-series",
              title: "The Jetsons: Complete Series"),
        Model(videoURL: "https://ia802501.us.archive.org/5/items/the-centurions-1986/The%20CENTURIONS%20%281986%29/CENTURIONS%20-%20Ep.%2001%20-%20The%20Sky%20is%20on%20Fire.mp4",
              imageURL: "https://archive.org/services/img/the-centurions-1986",
              title: "The Centurions (1986)"),
        Model(videoURL: "https://ia600402.us.archive.org/16/items/AliceInWonderland1951/Alice%20In%20Wonderland%201951.mp4",
              imageURL: "https://archive.org/services/img/AliceInWonderland1951",
              title: "Alice In Wonderland"),
        Model(videoURL: "https://archive.org/download/bravestarr-1987/Bravestarr.Complete.DVDRip.ENG.X264.AAC/Bravestarr.1x01.DVDRip.X264.AAC.mp4",
              imageURL: "https://archive.org/services/img/bravestarr-1987",
              title: "BraveStarr (1987)"),
        Model(videoURL: "https://archive.org/download/ThePink.Panther1963/The%20Pink.%20Panther%201963.mp4",
              imageURL: "https://archive.org/services/img/ThePink.Panther1963",
              title: "The Pink Panther ~ 1963"),
        Model(videoURL: "https://archive.org/download/SantasSuprise/SantasSuprise_512kb.mp4",
              imageURL: "https://archive.org/services/img/SantasSuprise",
              title: "Santa's Surprise")
        ]
        items.onNext(model)
        items.onCompleted()
    }
}
