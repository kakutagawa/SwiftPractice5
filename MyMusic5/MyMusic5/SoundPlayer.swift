//
//  SoundPlayer.swift
//  MyMusic5
//
//  Created by 芥川浩平 on 2023/11/29.
//

import UIKit
import AVFoundation

final class SoundPlayer: NSObject {
    let cymbalData = NSDataAsset(name: "cymbalSound")?.data
    var cymbalPlayer: AVAudioPlayer?

    let guitarData = NSDataAsset(name: "guitarSound")?.data
    var guitarPlayer: AVAudioPlayer?

    func cymbalPlay() {
        do {
            if let cymbalData {
                cymbalPlayer = try AVAudioPlayer(data: cymbalData)
            }
            cymbalPlayer?.play()
        } catch {
            print("シンバルでエラーが発生しました")
        }
    }
    func guitarPlay() {
        do {
            if let guitarData {
                guitarPlayer = try AVAudioPlayer(data: guitarData)
            }
            guitarPlayer?.play()
        } catch {
            print("ギターでエラーが発生しました")
        }
    }
}
