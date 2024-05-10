//
//  ViewController.swift
//  Audio
//
//  Created by TJ on 2024/05/09.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var pvPlay: UIProgressView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var SlVolume: UISlider!
    @IBOutlet weak var imageView: UIImageView!
    
    var audioPlayer: AVAudioPlayer!
    var audioFile: URL! // audio file name
    let maxVolume: Float = 10.0 // 볼륨 최대값
    var progressTimer: Timer! // play time
    var imagePlay: UIImage? // play image
    var imagePause: UIImage? // pause image
    var imageStop: UIImage? // stop image
    
    // Timer 를 이용해 재생시간 표시하기
    let timerPlay: Selector = #selector(ViewController.updatePlayTimes)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        audioFile = Bundle.main.url(forResource: "1988", withExtension: "mp3")
        initPlay()
        imagePlay = UIImage(named: "move.png")
        imagePause = UIImage(named: "pause.png")
        imageStop = UIImage(named: "stop.png")
        
    }
    // Audio 재생을 위한 초기화
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError{
            print("에러: \(error)")
        }
        
        // audio 초기화
        SlVolume.maximumValue = maxVolume
        // 초기값
        SlVolume.value = 1.0
        // 초기값
        pvPlay.progress = 0
        audioPlayer.delegate = self
        // 이때 메모리에 올린다
        audioPlayer.prepareToPlay()
        audioPlayer.volume = SlVolume.value
        
        lblEndTime.text = convertTime(audioPlayer.duration)
        lblCurrentTime.text = convertTime(0)
        
   setPlayButtons(true, false, false)
        
    }

    func convertTime(_ time: TimeInterval) -> String{
        let min = Int(time / 60)
        //소수점 이하 버리기
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let startTime = String(format: "%02d:%02d", min, sec)
        return startTime
    }
    
    func setPlayButtons(_ play: Bool, _ pause: Bool, _ stop: Bool){
        
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, true, true)
        //Timer 를 이용해 재생시간 표시
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timerPlay, userInfo: nil, repeats: true)
        imageView.image = imagePlay
    }
    
    @IBAction func btnPauseAudio(_ sender: Any) {
        audioPlayer.pause()
        setPlayButtons(true, false, true)
        imageView.image = imagePause
    }
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        setPlayButtons(true, false, false)
        
        //초기화 시키기
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertTime(0)
        progressTimer.invalidate()
        
        imageView.image = imageStop
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = SlVolume.value
    }
    
    // Timer 를 이용해 재생시간 표시
    @objc func updatePlayTimes(){
        lblCurrentTime.text = convertTime(audioPlayer.currentTime)
        pvPlay.progress = Float(audioPlayer.currentTime / audioPlayer.duration)
    }
    
}


extension ViewController: AVAudioPlayerDelegate{
    // (success)
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, false, false)
    }
}
