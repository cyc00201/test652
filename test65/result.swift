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
    
  
    
   

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return parse_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "course", for: indexPath) as? course_cell else {
            return UITableViewCell()
        }
        cell.course_message.text = parse_data[indexPath.row]
        return cell
    }
    override func viewDidLoad() {
      
      
    }
    

    
   
    
    
    
    
}
