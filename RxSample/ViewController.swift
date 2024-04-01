//
//  ViewController.swift
//  RxSample
//
//  Created by 三浦　一真 on 2024/03/25.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var combineLatestButton: UIButton!
    @IBOutlet private weak var zipButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tappedCombineLatest(_ sender: Any) {
        let combineLatestStoryboard = UIStoryboard(name: "CombineLatest", bundle: nil)
        if let combineLatestVC = combineLatestStoryboard.instantiateViewController(withIdentifier: "CombineLatest") as? CombineLatestViewController {
            self.present(combineLatestVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedZip(_ sender: Any) {
        let zipStoryboard = UIStoryboard(name: "Zip", bundle: nil)
        if let zipVC = zipStoryboard.instantiateViewController(withIdentifier: "Zip") as?
            ZipViewController {
            self.present(zipVC, animated: true, completion: nil)
        }
    }
}

