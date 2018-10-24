//
//  ChatroomsMenuController.swift
//  SlideOutMenu
//
//  Created by ivica petrsoric on 23/10/2018.
//  Copyright © 2018 ivica petrsoric. All rights reserved.
//

import UIKit

class ChatroomsMenuController: UITableViewController {
    
    let chatroomGroups = [
        ["general", "introductions"],
        ["jobs"],
        ["Brian Voong", "Steve Jobs", "Tim Cook", "Barack Obama"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .purple
        tableView.separatorStyle = .none
        tableView.backgroundColor = #colorLiteral(red: 0.3058823529, green: 0.2078431373, blue: 0.3843137255, alpha: 1)
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return section == 0 ? "UNREADS" : section == 1 ? "Channels" : "Direct messages"
//    }
    
    fileprivate class ChatroomHeaderLabel: UILabel {
        
        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.insetBy(dx: 16, dy: 0))
            
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let text = section == 0 ? "UNREADS" : section == 1 ? "Channels" : "Direct messages"
        let label = ChatroomHeaderLabel()
        label.text = text
        label.textColor = UIColor.init(white: 0.8, alpha: 0.6)
//        label.backgroundColor = .red
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatroomGroups[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatroomMenuCell(style: .default, reuseIdentifier: nil)
        
        let text = chatroomGroups[indexPath.section][indexPath.row]
        
//        cell.textLabel?.text = "# \(text)"
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        let attributedText = NSMutableAttributedString(string: "#  ", attributes: [.foregroundColor:  #colorLiteral(red: 0.4745098039, green: 0.4078431373, blue: 0.4666666667, alpha: 1), .font: UIFont.systemFont(ofSize: 18, weight: .regular)])
        attributedText.append(NSAttributedString(string: text, attributes: [.foregroundColor: UIColor.white]))
        cell.textLabel?.attributedText = attributedText
        
        cell.textLabel?.attributedText = attributedText
        
        return cell
    }
}
