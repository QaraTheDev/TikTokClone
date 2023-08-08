//
//  VideoTableViewCell.swift
//  TikTokClone
//
//  Created by Andas on 29.06.2023.
//

import Foundation
import SnapKit
import BMPlayer
import UIKit

class VideoTableViewCell: UITableViewCell {
    
    private var link: String
    private var player = BMPlayer()
    
    init(link: String) {
        self.link = link
        super.init(style: .default, reuseIdentifier: "cell")
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        player.isUserInteractionEnabled = false
        BMPlayerConf.enableVolumeGestures = false
        BMPlayerConf.enableBrightnessGestures = false
        BMPlayerConf.enablePlaytimeGestures = false
//        BMPlayerConf.shouldAutoPlay = true
        
        let resources = BMPlayerResource(url: URL(string: link)!)
        player.setVideo(resource: resources)
        self.contentView.addSubview(player)
        player.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        player.pause()
    }
}
