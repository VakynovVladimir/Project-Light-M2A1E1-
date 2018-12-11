import AVFoundation
import UIKit

class ViewController: UIViewController {
    @IBAction func buttonPressed() {
        isOn = !isOn
    }
    
    var isOn = true {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let device =
            AVCaptureDevice.default(for: .video)
        if let device = device, device.hasTorch {
            view.backgroundColor = UIColor.black
            do {
                try device.lockForConfiguration()
                device.torchMode = isOn ? .on : .off
                device.unlockForConfiguration()
            } catch {
                print(#function, error)
            }
        } else {
        
//        if isOn {
//            view.backgroundColor = UIColor.white
//        } else {
//            view.backgroundColor = UIColor.black
//        }
        view.backgroundColor = isOn ? UIColor.white : UIColor.black
    }
    
        var prefersStatusBarHidden: Bool {
        return true
    }
}

}
