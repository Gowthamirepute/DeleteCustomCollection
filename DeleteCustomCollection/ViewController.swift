//
//  ViewController.swift
//  DeleteCustomCollection
//
//  Created by Hxtreme on 11/03/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import UIKit
class video
{
    
    var naem:String?
    var title:String?
    init(name:String,title:String) {
        self.naem=name
        self.title=title
    }
}



class ViewController: UIViewController {
    var videos:[video]?
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let arrayItems=["TODO","DOINF","DONE"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //For make SImiliarity between navigation bar and the view Below Navigation Bar
        UINavigationBar.appearance().shadowImage=UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(),for:.default)
        
        
        //For Proper Scrolling CollectionView Items
        
        collectionView.contentInset=UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets=UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        
        //For Pre Select the First Item in Collection View
        let indexPath=IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .bottom)
        setupNabbarItems()
        
    }
    
    
    func loadAsyncImage(){
        //See extension class below
        
    }
    
    
    func setupNabbarItems(){
        
        
        
        //Format Numbers from the 10 digit number
        
        let formatter=NumberFormatter()
        formatter.numberStyle = .decimal
        
        let largenumber=2134524565446
        let value=formatter.string(from: NSNumber(value: largenumber))
        
        
        print("Value is \(value)")
        
        
        let image=UIImage(named: "ic_arrow_down")
        
        let redCamera = image!.tinted(with: .white)
        let image1=UIImage(named: "ic_calendar")
        
        let redCamera1 = image1!.tinted(with: .white)
        let image2=UIImage(named: "ic_filter_icon")
        
        let redCamera2 = image2!.tinted(with: .white)
        let barbuttonItems=UIBarButtonItem(image: redCamera, style: .plain, target: self, action: #selector(mainMenu))
        let barbuttonItems1=UIBarButtonItem(image: UIImage(), style: .plain, target: self, action: #selector(mainMenu))
        let barbuttonItems2=UIBarButtonItem(image: redCamera1, style: .plain, target: self, action: #selector(Chart))
        let barbuttonItems3=UIBarButtonItem(image: redCamera2, style: .plain, target: self, action: #selector(others))
        
        navigationItem.leftBarButtonItems=[barbuttonItems,barbuttonItems1]
        
        navigationItem.rightBarButtonItems=[barbuttonItems2,barbuttonItems3]
        
    }
    
    @objc func mainMenu(){
        
    }
    @objc func mainBoard(){
        
    }
    
    func showDummyViewController(){
        
        let dummyVc=UIViewController()
        navigationController?.pushViewController(dummyVc, animated: true)
    }
    lazy var object:SlideUpMenu={
        
        var obj=SlideUpMenu()
        obj.homeController=self
        return obj
    }()
    @objc func Chart(){
        //Add Transparent view to the current view
//        let object=SlideUpMenu()
//        object.homeController=self
//        object.showMenu()
//        (or)
        //Above code leads to allocate/Creation of different object wherever we use lazy means memory allocated only once and called once that is duirng nil,after memory allocated wont get called
        
        object.showMenu()
        
    }
    @objc func others(){
        
    }
    
    
    
}
extension  ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "some", for: indexPath) as! CustomCollectionViewCell
        let currentCell=arrayItems[indexPath.row]
        cell.btn.setTitle(currentCell, for: .normal)
        cell.btn.tintColor=UIColor.white
        return cell
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 120, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("S selected")
    }
    
}
extension UIImage {
    func tinted(with color: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        color.set()
        withRenderingMode(.alwaysOriginal)
            .draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}


//For Async Image Loading

//class CustomImageView: UIImageView {
//    let imageCache = NSCache()
//
//    var imageUrlString: String?
//
//    func loadImageUsingUrlString(urlString: String) {
//
//        imageUrlString = urlString
//
//        let url = NSURL(string: urlString)
//
//        image = nil
//
//        if let imageFromCache = imageCache.objectForKey(urlString) as? UIImage {
//            self.image = imageFromCache
//            return
//        }
//
//        URLSession.shared.dataTask(with: url! as URL, completionHandler: { (data, respones, error) in
//
//            if error != nil {
//                print(error)
//                return
//            }
//            DispatchQueue.main.async {
//                let imageToCache = UIImage(data: data!)
//
//                if self.imageUrlString == urlString {
//                    self.image = imageToCache
//                }
//
//                imageCache.setObject(imageToCache!, forKey: urlString)
//                }
//            }).resume()
//
//}
//}

