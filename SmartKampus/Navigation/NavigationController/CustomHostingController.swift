//
//  CustomHostingController.swift
//  KampusDestekApp
//
//  Created by Yakup Suda on 17.04.2024.
//
import SwiftUI


class CustomHostingController<Content>: UIHostingController<AnyView> where Content: View {
    
    var shouldShowBackgroundImage: Bool = false
    var isShowRightButton: Bool = false
    var backgroundImage = ""
    var rightImage = ""
    
    @ObservedObject var router = MainViewsRouter()
    
    public init(rootView: Content, navigationBarTitle: String, navigationBarHidden: Bool, backgroundImage: String, isShowRightButton: Bool, rightImage: String) {
        super.init(rootView: AnyView(rootView.navigationBarHidden(navigationBarHidden)))
        self.title = navigationBarTitle
        self.shouldShowBackgroundImage = navigationBarHidden
        self.backgroundImage = backgroundImage
        self.isShowRightButton = isShowRightButton
        self.rightImage = rightImage
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !shouldShowBackgroundImage {
            setImage()
            title = title
            if isShowRightButton {
                let rightButton = UIBarButtonItem(customView: createRightButton(image: self.rightImage))
                navigationItem.setRightBarButton(rightButton, animated: false)
            }
        }
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
    func setImage() {
        let backgroundImage = UIImage(named: self.backgroundImage)
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleToFill
        
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor), // Yukarı kenara bağlanır
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor) // Alt kenara bağlanır
        ])

    }

    func createRightButton(image: String) -> UIButton {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(named: image)
        
        let imageSize = CGSize(width: 22, height: 18) // İstediğiniz boyutu burada belirleyin
        
        button.setImage(buttonImage?.resize(targetSize: imageSize), for: .normal) // Resmi yeniden boyutlandırıp kullanın
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .white
        
        button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        return button
    }
    
    
    @objc func rightButtonTapped() {
        switch rightImage {
        case "house.fill":
            break
        case "houseHomeView":
            
            break;
        case "gear":
            print("ayarlara tıklandı")
        default:
            ()
        }
    }
}

extension UIImage {
    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: targetSize).image { _ in
            draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
