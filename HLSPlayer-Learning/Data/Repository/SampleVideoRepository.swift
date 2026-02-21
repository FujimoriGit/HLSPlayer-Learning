//
//  SampleVideoRepository.swift
//  HLSPlayer-Learning
//
//  Created by Daiki Fujimori on 2026/02/09
//

import Foundation

struct SampleVideoRepository {
    
    private static let videoTypes = VideoType.allCases
}

private extension SampleVideoRepository {
    
    enum VideoType: CaseIterable {
        
        case bipbop
        case advancedStream
        
        var url: URL {
            
            switch self {
                
            case .bipbop:
                return URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8")!
                
            case .advancedStream:
                return URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/adv_dv_atmos/main.m3u8")!
            }
        }
        
        var title: String {
            
            switch self {
                
            case .bipbop:
                return "Bipbopサンプル"
            case .advancedStream:
                return "Advanced Stream"
            }
        }
        
        var subtitle: String {
            
            switch self {
                
            case .bipbop:
                return "Apple提供のHLSサンプルストリーム（マルチビットレート）"
                
            case .advancedStream:
                return "Dolby Vision + Dolby Atmos対応のサンプルストリーム"
            }
        }
    }
}

extension SampleVideoRepository: VideoFetching {
    
    func fetchVideos() -> [Video] {
        
        Self.videoTypes.map { .init(hlsURL: $0.url, title: $0.title, subtitle: $0.subtitle) }
    }
}
