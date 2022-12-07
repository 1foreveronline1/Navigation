import UIKit

class PhotoesViewController: UIViewController, UICollectionViewDelegate {
    
    lazy var photoesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let photoCV = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCV.delegate = self
        photoCV.dataSource = self
        photoCV.translatesAutoresizingMaskIntoConstraints = false
        photoCV.register(PhotoesCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        return photoCV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Фотографии"
        view.addSubview(photoesCollectionView)
        
        photoesCollectionView.backgroundColor = .white
        photoesCollectionView.register(PhotoesCollectionViewCell.self, forCellWithReuseIdentifier: PhotoesCollectionViewCell.reusableID)
        
        NSLayoutConstraint.activate([
            photoesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension PhotoesViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoesCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoesCollectionViewCell.reusableID, for: indexPath) as! PhotoesCollectionViewCell
        let photo = photoGallery[indexPath.row]
        cell.settingDataSource(array: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 32) / 3, height: (UIScreen.main.bounds.width - 32) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoVC = PhotoDisplayViewController()
        photoVC.indexPhotoRow = indexPath.row
        pushPhoto(viewController: photoVC)
    }
}

extension UIViewController {
    func pushPhoto(viewController: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = .push
        transition.subtype = .fromLeft
        self.view.window?.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
