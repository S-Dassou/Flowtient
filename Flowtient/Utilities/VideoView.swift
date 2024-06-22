//
//  VideoView.swift
//  Flowtient
//
//  Created by shafique dassu on 20/06/2024.
//

import Foundation
import SwiftUI
import AVFoundation

class LoopingPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Depending on your video you can select a proper `videoGravity` property to fit better
    init(videoName: String,
         player: AVQueuePlayer,
         videoGravity: AVLayerVideoGravity = .resizeAspectFill) {
        
        super.init(frame: .zero)
        
        guard let fileUrl = Bundle.main.url(forResource: videoName, withExtension: "mp4") else { return }
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        
        player.isMuted = true // just in case
        playerLayer.player = player
        playerLayer.videoGravity = videoGravity
        layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct PlayerView: UIViewRepresentable {
    private let videoName: String
    private let player: AVQueuePlayer
    
    init(videoName: String, player: AVQueuePlayer) {
        self.videoName = videoName
        self.player = player
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) { }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(videoName: videoName, player: player)
    }
}

public struct BgdFullScreenVideoView: View {
    @State private var player = AVQueuePlayer()
    private let videoName: String
    private let videoAspectRatio: CGFloat = 2160 / 3840 //manually setting the aspect ratio of video
    public init(videoName: String) {
        self.videoName = videoName
    }
    
    public var body: some View {
        GeometryReader { geo in
            PlayerView(videoName: videoName, player: player)
                .aspectRatio(videoAspectRatio ,contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height)
                .onAppear {
                    player.play()
                }
                .onDisappear {
                    player.pause()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                    player.pause()
                }
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                    player.play()
                }
        }
        .ignoresSafeArea()
    }
}

public struct WorkoutTileVideoView: View {
    @State private var player = AVQueuePlayer()
    private let videoName: String
    private let videoAspectRatio: CGFloat = 2160 / 3840
    
    public init(videoName: String) {
        self.videoName = videoName
    }
    
    public var body: some View {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let containerWidth = screenWidth / 6
        let containerHeight = screenHeight / 4
        
        PlayerView(videoName: videoName, player: player)
            .aspectRatio(2160/3840, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .frame(width: containerWidth, height: containerHeight)
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                player.pause()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                player.play()
            }
            .ignoresSafeArea()
    }
}

public struct WorkoutRestVideoView: View {
    @State private var player = AVQueuePlayer()
    private let videoName: String
    private let videoAspectRatio: CGFloat = 2160 / 3840
    
    public init(videoName: String) {
        self.videoName = videoName
    }
    
    public var body: some View {
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        let containerWidth = screenWidth - 40
        let containerHeight = screenHeight / 2.5
        
        PlayerView(videoName: videoName, player: player)
            .aspectRatio(2160/3840, contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .frame(width: containerWidth, height: containerHeight)
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                player.pause()
            }
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
                player.play()
            }
            .ignoresSafeArea()
    }
}
