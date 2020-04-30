//
//  SwiftHasthTagsView.swift
//  SwiftHashTags
//
//  Created by baixue on 3/20/2020.
//

import Foundation
import UIKit

//MARK: - SwiftHashTags delegate methods
public protocol SwifthashtagDelegate {
    func selectedHashTag(title: String, id: Int)
    func unselectedHashTag(title: String, id: Int)
}


open class SwiftHashTagsView: UIView {
    //MARK: - Add buttons
    
    lazy private var scrollView: UIScrollView = {
       return UIScrollView()
    }()
    
    public var swifthashtagDelegate: SwifthashtagDelegate?
    public var showverticalScoller: Bool = false
    
    var tagButtons: [UIButton] = Array<UIButton>()
    var tagbuttonIndex: [Int] = [Int]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setscrollView()
    }
    
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Set up srollview

extension SwiftHashTagsView {
    fileprivate func setscrollView() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = showverticalScoller
        addSubview(scrollView)
        
        let scrollviewConstraints = [scrollView.leftAnchor.constraint(equalTo: leftAnchor),
                                     scrollView.topAnchor.constraint(equalTo: topAnchor),
                                     scrollView.rightAnchor.constraint(equalTo: rightAnchor),
                                     scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)]
        scrollView.contentSize = CGSize(width: self.bounds.width, height: self.bounds.height)
        NSLayoutConstraint.activate(scrollviewConstraints)
    }
}

extension SwiftHashTagsView {
    public func setHashTags(with hashtaglist: [SwiftHashTags]) {
        for hashtag in hashtaglist {
            let buttonTitle = "#"+hashtag.title
            tagButtons.append(creteButton(with: buttonTitle, buttontag: hashtag.id))
        }

        createButtonGrid(with: tagButtons)
    }
}

//MARK: - create button
extension SwiftHashTagsView {
    fileprivate func creteButton(with buttontitle: String, buttontag: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(buttontitle, for: .normal)
        button.tag = buttontag
        button.backgroundColor = .white
        button.titleLabel?.font = UIFont(name: "Helvetica-Regular", size: 14)
        button.setTitleColor(UIColor().returngbColor(red: 6, green: 81, blue: 198, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor().returngbColor(red: 6, green: 81, blue: 198, alpha: 1).cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        button.sizeToFit()
        return button
    }
}

//MARK; - create button grid
extension SwiftHashTagsView {
    fileprivate func createButtonGrid(with tagButtons: [UIButton]) {
        
        let offset = 10.0
        var x = 0.0, y = 0.0, row = 0.0
        var buttonHeight: Double = 0.0
        var scrollHeight: Double = 0.0
        
        for buttonIndex in 0..<tagButtons.count {
            let button = tagButtons[buttonIndex]
            row += Double(button.frame.width) + offset
            
            if row < Double(self.bounds.width) {
                x = buttonIndex == 0 ? offset : row - Double(button.frame.width)
            } else {
                x = offset
                row = Double(button.frame.width) + offset
                y += Double(button.frame.height) + offset
                scrollHeight = y
                buttonHeight = Double(button.frame.height) + offset
            }
            let frame = CGRect(x: CGFloat(x), y: CGFloat(y), width: button.frame.width, height: button.frame.height + 5)
            button.frame = frame
            scrollView.addSubview(button)
            button.addTarget(self, action: #selector(hashtagSelected(_:)), for: .touchUpInside)
        }
        
        if scrollHeight > Double(self.bounds.height) {
            scrollView.contentSize = CGSize(width: self.bounds.width, height: CGFloat(scrollHeight+buttonHeight))
        }
    }
}

//MARK: - button click functions
extension SwiftHashTagsView {
    @objc fileprivate func hashtagSelected(_ sender: UIButton) {
        
        let sendertitle: String = sender.titleLabel!.text!
        let title = sendertitle.components(separatedBy: "#")[1]
        if !tagbuttonIndex.contains(sender.tag) {
            tagbuttonIndex.append(sender.tag)
            sender.backgroundColor = UIColor().returngbColor(red: 6, green: 81, blue: 198, alpha: 1)
            sender.setTitleColor(.white, for: .normal)
            swifthashtagDelegate?.selectedHashTag(title: title, id: sender.tag)
            return
        } else {
            tagbuttonIndex = tagbuttonIndex.filter { $0 != sender.tag }
            sender.backgroundColor = .white
            sender.setTitleColor(UIColor().returngbColor(red: 6, green: 81, blue: 198, alpha: 1), for: .normal)
            swifthashtagDelegate?.unselectedHashTag(title: title, id: sender.tag)
            return
        }
    }
}

