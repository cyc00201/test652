//
//  result.swift
//  test65
//
//  Created by User06 on 2019/6/19.
//  Copyright © 2019 User05. All rights reserved.
//

import UIKit
import Firebase


class result2 : UIViewController,UITableViewDataSource{
    var get_data : [course_info] = []
    @IBOutlet weak var total_credit: UILabel!
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
       //     print("<<<<")
            return 4;
        }
        else{
            print(get_data.count)
            var count = 0
            for i in get_data{
                count += i.credit
            }
            total_credit.text = String(count)
            return get_data.count
        }
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "choose", for: indexPath) as? choose_cell else {
            return UITableViewCell()
        }
     //   print("1")
        
        if !get_data.isEmpty{
            cell.course_text.text = "開課系所："
            cell.course_text.text.append(get_data[indexPath.row].depinf)
            cell.course_text.text.append("\n課名：")
            cell.course_text.text.append(get_data[indexPath.row].nameinf)
            cell.course_text.text.append("\n授課老師：")
            cell.course_text.text.append(get_data[indexPath.row].profinf)
            cell.course_text.text.append("\n上課時間：")
            print()
            if(get_data[indexPath.row].timeinf.count == 0 )
            {
                cell.course_text.text.append(" ")
            }
            else{
                for j in 0 ... get_data[indexPath.row].timeinf.count - 1{ cell.course_text.text.append(get_data[indexPath.row].timeinf[j])
                    if(j < get_data[indexPath.row].timeinf.count - 1)
                    {
                        cell.course_text.text.append(",")
                    }
                }
            }
            cell.course_text.text.append("\n學分：")
            cell.course_text.text.append(String(get_data[indexPath.row].credit))
            
        }
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    
    
    
    
    
    
    
    
}
