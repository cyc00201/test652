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
    
    func colorForIndex(index: Int) -> UIColor {
        
        let R = Double.random(in: 0.1...1)
        let G = Double.random(in: 0.1...1)
        let B = Double.random(in: 0.1...1)
        return UIColor(red: CGFloat(R), green:CGFloat(G) , blue: CGFloat(B), alpha: 1.0)
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parse_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath) as? course_cell else {
            return UITableViewCell()
        }
        cell.course_message.text = parse_data[indexPath.row]
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        return cell
    }
    override func viewDidLoad() {
      
      
    }
    

    
   
    
    
    
    
}
