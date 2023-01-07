//
//  ViewController.swift
//  DropDownMeni
//
//  Created by Eslam Ali  on 07/01/2023.
//

import UIKit

class ViewController: UIViewController {
    
    var plusBarButtonItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        navigationItem.title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureBarButtonItem()
    }
    
    private func configureBarButtonItem (){
        // set custom button to bar button item
        let plusImage = UIImage(systemName: "plus.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(named: "customBlue") ?? .systemTeal).withConfiguration(UIImage.SymbolConfiguration(pointSize: 26, weight: .regular, scale: .large))
        
        plusBarButtonItem = {
            let barButtonItem = UIBarButtonItem()
            
            let button: UIButton = {
                let button = UIButton(type: .system)
                button.setImage(plusImage, for: .normal)
                button.showsMenuAsPrimaryAction = true
                button.menu = configureItems() // returns menu items to be added for the button
                return button
            }()
            
            barButtonItem.customView = button
            return barButtonItem
        }()
        navigationItem.rightBarButtonItem = plusBarButtonItem
    }
    
    
    private func configureItems() -> UIMenu{
        // configure custome menu item with image and title
        
        // login
        let loginImage = UIImage(systemName: "lock.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(red: 78/255, green: 206/255, blue: 214/255, alpha: 1)).withConfiguration(UIImage.SymbolConfiguration(weight: .bold))
        
        let loginItem = UIAction(title: "Login", image: loginImage, handler: { _ in
            print("Login")
        })
        
        // NoteImage
        let secureNoteImage = UIImage(systemName: "list.bullet.rectangle.portrait.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(red: 253/255, green: 170/255, blue: 10/255, alpha: 1)).withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
        
        let secureNoteItem = UIAction(title: "Secure Note", image: secureNoteImage, handler: { _ in
            print("Secure Note")
        })
        
        //Credit Card
        let creditCardImage = UIImage(systemName: "creditcard.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(red: 102/255, green: 203/255, blue: 253/255, alpha: 1)).withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
        
        let creditCardItem = UIAction(title: "Credit Card", image: creditCardImage, handler: { _ in
            print("Credit Card")
        })
        
        //Identity
        let identityImage = UIImage(systemName: "person.text.rectangle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(red: 106/255, green: 228/255, blue: 169/255, alpha: 1)).withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
        
        let identityItem = UIAction(title: "Identity", image: identityImage, handler: { _ in
            print("Identity")
        })
        // Password
        let passwordImage = UIImage(systemName: "key.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(red: 157/255, green: 161/255, blue: 165/255, alpha: 1)).withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
        
        let passwordItem = UIAction(title: "Password", image: passwordImage, handler: { _ in
            print("Password")
        })
        // Document
        let documentImage = UIImage(systemName: "doc.richtext.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(red: 102/255, green: 203/255, blue: 253/255, alpha: 1)).withConfiguration(UIImage.SymbolConfiguration(weight: .regular))
        
        let documentItem = UIAction(title: "Document", image: documentImage, handler: { _ in
            print("Document")
        })
        
        // create children for every section in the menu
        let sectionOneChildren : [UIMenuElement] = [loginItem, secureNoteItem, creditCardItem]
        let sectionTwoChildren : [UIMenuElement] = [identityItem, passwordItem, documentItem]
        // create sections with childrens
        let sectionOne = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: sectionOneChildren)
        
        let sectionTwo = UIMenu(title: "", image: nil, identifier: nil, options: .displayInline, children: sectionTwoChildren)
        
        // create menu with sections you created
        let allSectionsChildren = [sectionOne, sectionTwo]
        let allMenu : UIMenu = UIMenu(title: "", children: allSectionsChildren)
        
        
        return allMenu
        
    }
  
}


