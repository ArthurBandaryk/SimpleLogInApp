//
//  WelcomeViewController.swift
//  WelcomeViewController
//
//  Created by Artur Bandaryk on 10/4/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var welcomeLabel: UILabel = UILabel()
    
    var welcomeImageView: UIImageView = { () -> UIImageView in
        let imageName = "welcome.jpeg"
        let image = UIImage(named: imageName)
        return UIImageView(image: image)
    }()
    
    var closeButton: UIButton = UIButton(type: UIButton.ButtonType.close)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize all views.
        initViews()
        
        // Create all constraints.
        createConstraints()
    }
    
    func initViews() {
        // Welcome image view initialization.
        welcomeImageView.contentMode = .scaleAspectFill
        welcomeImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Welcome text label initialization.
        welcomeLabel.text = "Welcome!"
        welcomeLabel.shadowColor = UIColor.black
        welcomeLabel.textColor = UIColor.white
        welcomeLabel.numberOfLines = 1
        welcomeLabel.font = welcomeLabel.font.withSize(30)
        welcomeLabel.textAlignment = NSTextAlignment.center
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Close button initialization.
        closeButton.tintColor = UIColor.black
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Add action for close button.
        closeButton.addTarget(self,
                              action: #selector(closeWelcomeView),
                              for: UIControl.Event.touchUpInside)
        
        // Adding all views as subview for super view.
        view.addSubview(welcomeImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(closeButton)
    }
    
    func createConstraints() {
        // MARK: welcome image view constraints.
        let leadingImageView =
        NSLayoutConstraint(item: welcomeImageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 0)
        
        let trailingImageView =
        NSLayoutConstraint(item: welcomeImageView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0)
        
        let topImageView =
        NSLayoutConstraint(item: welcomeImageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 0)
        
        let heightImageView =
        NSLayoutConstraint(item: welcomeImageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .height,
                           multiplier: 1.0,
                           constant: 0)
        
        // MARK: welcome text label constraints.
        let centerXWelcomeLabel =
        NSLayoutConstraint(item: welcomeLabel,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1.0,
                           constant: 0)
        
        let centerYWelcomeLabel =
        NSLayoutConstraint(item: welcomeLabel,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1.0,
                           constant: 0)
        
        let widthWelcomeLabel =
        NSLayoutConstraint(item: welcomeLabel,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .width,
                           multiplier: 0.5,
                           constant: 0)
        
        // MARK: close button constraints.
        let centerXCloseButton =
        NSLayoutConstraint(item: closeButton,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: welcomeLabel,
                           attribute: .centerX,
                           multiplier: 1.0,
                           constant: 0)
        
        let topCloseButton =
        NSLayoutConstraint(item: closeButton,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: welcomeLabel,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 20)
        
        let widthCloseButton =
        NSLayoutConstraint(item: closeButton,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: welcomeLabel,
                           attribute: .width,
                           multiplier: 0.5,
                           constant: 0)
        
        view.addConstraints([
            leadingImageView,
            trailingImageView,
            topImageView,
            heightImageView,
            centerXWelcomeLabel,
            centerYWelcomeLabel,
            widthWelcomeLabel,
            centerXCloseButton,
            topCloseButton,
            widthCloseButton
        ])
    }
    
    @objc func closeWelcomeView() {
        dismiss(animated: true, completion: nil)
    }
    
}
