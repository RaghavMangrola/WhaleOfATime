//
//  ViewController.swift
//  FiveSixTwoUIKit
//
//  Created by Raghav Mangrola on 2/28/21.
//

import UIKit

class ViewController: UIViewController {

    private let podService: PodServiceInterface!

    private var parentStackView: UIStackView?
    private var collectionView: UICollectionView?
    private var collectionViewFlowLayout: UICollectionViewFlowLayout?
    private var whalesTuple: [(WhaleProtocol, UIImage)] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }

    init() {
        self.podService = PodService()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView?.reloadData()
        loadImages()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        addCollectionView(to: self.view)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        self.collectionView?.collectionViewLayout.invalidateLayout()
    }

    private func addCollectionView(to view: UIView) {

        collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout?.minimumLineSpacing = 0
        collectionViewFlowLayout?.minimumInteritemSpacing = 0

        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewFlowLayout!)

        collectionView?.backgroundColor = .black
        collectionView?.delegate = self
        collectionView?.dataSource = self

        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)

        let margins = view.layoutMarginsGuide
        collectionView?.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        collectionView?.register(WhaleCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }

    private func loadImages() {
        podService.getImage(for: Whales.blueWhale()) { (whale, image) in
            if let image = image {
                self.whalesTuple.append((whale, image))
            }
        }

        podService.getImage(for: Whales.humpbackWhale()) { (whale, image) in
            print("WHALE.NAME: \(String(describing: whale.name))")
            print("IMAGE: \(String(describing: image))")

            if let image = image {
                self.whalesTuple.append((whale, image))
            }
        }

        podService.getImage(for: Whales.killerWhale()) { (whale, image) in
            print("WHALE.NAME: \(String(describing: whale.name))")
            print("IMAGE: \(String(describing: image))")

            if let image = image {
                self.whalesTuple.append((whale, image))
            }
        }

        podService.getImage(for: Whales.northPacificRightWhale()) { (whale, image) in
            print("WHALE.NAME: \(String(describing: whale.name))")
            print("IMAGE: \(String(describing: image))")

            if let image = image {
                self.whalesTuple.append((whale, image))
            }
        }
    }
}

// MARK: UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        guard let cell = collectionView.cellForItem(at: indexPath) as? WhaleCollectionViewCell,
              let whale = cell.whale,
              let image = cell.whaleImage else {
            return
        }

        let whaleView = WhaleView()
        whaleView.setupView(using: whale, whaleImage: image)
        let whaleVC = UIViewController()
        whaleVC.view.addSubview(whaleView)

        whaleView.translatesAutoresizingMaskIntoConstraints = false

        let margins = whaleVC.view.layoutMarginsGuide
        whaleView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        whaleView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        whaleView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        whaleView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true

        whaleVC.view.backgroundColor = cell.contentView.backgroundColor

        self.present(whaleVC, animated: true, completion: nil)
    }
}

// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return whalesTuple.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as? WhaleCollectionViewCell {

            switch indexPath.row {
            case 0:

                let whaleTuple = whalesTuple[indexPath.row]
                collectionViewCell.setupCell(with: whaleTuple.0, whaleImage: whaleTuple.1)
                collectionViewCell.contentView.backgroundColor = .systemGreen
                return collectionViewCell
            case 1:
                collectionViewCell.contentView.backgroundColor = .systemOrange
                let whaleTuple = whalesTuple[indexPath.row]
                collectionViewCell.setupCell(with: whaleTuple.0, whaleImage: whaleTuple.1)
                return collectionViewCell
            case 2:
                collectionViewCell.contentView.backgroundColor = .systemRed
                let whaleTuple = whalesTuple[indexPath.row]
                collectionViewCell.setupCell(with: whaleTuple.0, whaleImage: whaleTuple.1)
                return collectionViewCell
            case 3:
                collectionViewCell.contentView.backgroundColor = .systemPurple
                let whaleTuple = whalesTuple[indexPath.row]
                collectionViewCell.setupCell(with: whaleTuple.0, whaleImage: whaleTuple.1)
                return collectionViewCell
            default:
                return collectionViewCell
            }
        }

        return UICollectionViewCell()

    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = view.frame.size.width / 2
        let height = view.frame.size.height / 2

        return CGSize(width: width, height: height)
    }
}

protocol WhaleProtocol {
    var name: String { get }
    var imageURL: String { get }
}

// Could've been a dictionary
struct Whales {
    struct blueWhale: WhaleProtocol {
        let name = "Blue Whale"
        let imageURL = "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-blue-whale.jpg?null&itok=Ffb4BA78"
    }

    struct humpbackWhale: WhaleProtocol {
        let name = "Humpback Whale"
        let imageURL = "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-humpback.png?null&itok=xJdovo_r"
    }

    struct killerWhale: WhaleProtocol {
        let name = "Killer Whale"
        let imageURL = "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-killer-whale.png?null&itok=mpHhEa6Y"
    }

    struct northPacificRightWhale: WhaleProtocol {
        let name = "North Pacific Right Whale"
        let imageURL = "https://media.fisheries.noaa.gov/styles/original/s3/dam-migration/640x427-north-pacific-right-whale.png?null&itok=3TCE0WP6"
    }
}
