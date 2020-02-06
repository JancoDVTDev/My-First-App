//
//  PhotoAlbumViewController.swift
//  Hello World App
//
//  Created by Janco Erasmus on 2020/02/06.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class PhotoAlbumViewController: ViewController {

    @IBOutlet weak var actIndicate: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Data source

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexpath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexpath)
        return cell
    }
}
