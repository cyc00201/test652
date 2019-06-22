//
//  result.swift
//  test65
//
//  Created by User06 on 2019/6/19.
//  Copyright © 2019 User05. All rights reserved.
//

import UIKit
import Firebase


class result : UIViewController,UITableViewDataSource{
   var get_data : [course_info] = []
   
    func colorForIndex(index: Int) -> UIColor {
        
        let R = Double.random(in: 0.1...1)
        let G = Double.random(in: 0.1...1)
        let B = Double.random(in: 0.1...1)
        return UIColor(red: CGFloat(R), green:CGFloat(G) , blue: CGFloat(B), alpha: 1.0)
    }
    override func viewDidLoad() {
       
    }
   
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if get_data.isEmpty{
            return 4;
        }
        else{
        return get_data.count
        }
    }
    
  
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath) as? course_cell else {
            return UITableViewCell()
        }
        if !get_data.isEmpty{
        cell.course_message.text = "開課系所："
         cell.course_message.text.append(get_data[indexPath.row].depinf)
        cell.course_message.text.append("\n課名：")
        cell.course_message.text.append(get_data[indexPath.row].nameinf)
        cell.course_message.text.append("\n授課老師：")
        cell.course_message.text.append(get_data[indexPath.row].profinf)
        cell.course_message.text.append("\n上課時間：")
        cell.course_message.text.append(get_data[indexPath.row].timeinf)
        cell.course_message.text.append("\n學分：")
        cell.course_message.text.append(String(get_data[indexPath.row].credit))
        }
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        var add_title = "ADD"
        add_title.append(String(indexPath.row))
        cell.add_button.setTitle(add_title, for: .normal)
        if cell.add_button.tag == 0{
            print ("E")
        }
        else{
            print("P")
        }
        return cell
    }
    
    
    

    
    
    
    
    
}
