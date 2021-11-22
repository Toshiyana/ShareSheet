//
//  ViewController.swift
//  ShareSheet
//
//  Created by Toshiyana on 2021/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .link
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.center = view.center
        button.addTarget(self, action: #selector(presentShareSheet(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc private func presentShareSheet(_ sender: UIButton) {
        guard let image = UIImage(systemName: "bell"), let url = URL(string: "https://www.google.com") else {
            return
        }

//        let shareSheetVC = UIActivityViewController(activityItems: [], applicationActivities: nil)

        let shareSheetVC = UIActivityViewController(
            activityItems: [
                image,// save imageを選択すると、ベルの画像がアルバムに保存される
                url // リンクのコピーを選択すると、urlがコピーされる
            ],
            applicationActivities: nil
        )
        
        // iPad Support
        shareSheetVC.popoverPresentationController?.sourceView = sender
        shareSheetVC.popoverPresentationController?.sourceRect = sender.frame
        
        present(shareSheetVC, animated: true, completion: nil)
    }


}

