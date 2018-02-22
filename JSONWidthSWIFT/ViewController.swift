//
//  ViewController.swift
//  JSONWidthSWIFT
//
//  Created by HsuKaiChieh on 22/02/2018.
//  Copyright © 2018 HKC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectioin: UICollectionView!
    
    var north: [String]?
    var middle: [String]?
    var south: [String]?
    
    // MARK: - IBAction
    @IBAction func summer(_ sender: UIButton) {
        if let url = URL(string: "https://puxin-34420.firebaseapp.com/summer.json") {
            let task = URLSession.shared.dataTask(with: url) { (datas, response , error) in
                if let data = datas {
                    if let jsonDicObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] {
                        if let north = jsonDicObj!["北部"] as? [String] {
//                            print("Root title= \(north)")
                            self.north = north
                        }
                        if let middle = jsonDicObj!["中部"] as? [String] {
//                            print("Root title= \(middle)")
                            self.middle = middle
                        }
                        if let south = jsonDicObj!["南部"] as? [String] {
//                            print("Root title= \(south)")
                            self.south = south
                        }
                    }
                }
            }
            task.resume()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectioin?.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "abc", for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusabelView = UICollectionReusableView()
        if kind == UICollectionElementKindSectionHeader {
            reusabelView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath)
        } else if kind == UICollectionElementKindSectionFooter {
            reusabelView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath)
        }
        return reusabelView
    }
}

//extension ViewController: UICollectionViewDelegate {
//
//}

