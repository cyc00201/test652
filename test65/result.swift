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
    var choose_data : [course_info] = []
    var chosen_teble = [String?](repeating: nil, count: 2191)
    func colorForIndex(index: Int) -> UIColor {
        
        let R = Double.random(in: 0.1...1)
        let G = Double.random(in: 0.1...1)
        let B = Double.random(in: 0.1...1)
        return UIColor(red: CGFloat(R), green:CGFloat(G) , blue: CGFloat(B), alpha: 1.0)
    }
    override func viewDidLoad() {
       
    }
   
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        
        
        let controller = segue.destination as? result2
        controller?.get_data = choose_data
        
        
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
            print()
            if(get_data[indexPath.row].timeinf.count == 0 )
            {
                cell.course_message.text.append(" ")
            }
            else{
            for j in 0 ... get_data[indexPath.row].timeinf.count - 1{ cell.course_message.text.append(get_data[indexPath.row].timeinf[j])
                if(j < get_data[indexPath.row].timeinf.count - 1)
                {
                    cell.course_message.text.append(",")
                }
            }
            }
        cell.course_message.text.append("\n學分：")
         cell.course_message.text.append(String(get_data[indexPath.row].credit))
        }
        cell.backgroundColor = colorForIndex(index: indexPath.row)
        cell.selectionStyle = .none
        let temp :String = cell.add_button.titleLabel!.text!
        var add :String = String(temp.prefix(3))
        add.append(String(indexPath.row))
        cell.add_button.setTitle(add, for: .normal)
        
        return cell
    }
    
    @IBAction func add_course(_ sender: UIButton) {
        var num:Int
        let temp :String = (sender.titleLabel?.text!)!
        if temp.count > 3{
            num = Int(String(temp.suffix(temp.count - 3)))!
            
        }
        else{
            num = -1
        }
        if num > -1{
            //print(num)
            if chosen_teble[num] == nil || chosen_teble[num] == "F"{
                chosen_teble[num] = "T"
                let anscontroller = UIAlertController(title: "新增通知", message: "已經新增該課程", preferredStyle: .alert)
                let ansAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                anscontroller.addAction(ansAction)
                self.present(anscontroller, animated: true, completion: nil)
            }
            else{
               // print("!!")
                
                let controller = UIAlertController(title: "刪除通知", message: "是否刪除該課程 ?", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "是", style: .default) { (_) in
                  
                    self.chosen_teble[num] = "F"
                    let anscontroller = UIAlertController(title: "刪除通知", message: "已經刪除該課程", preferredStyle: .alert)
                    let ansAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    anscontroller.addAction(ansAction)
                    self.present(anscontroller, animated: true, completion: nil)
                }
                controller.addAction(okAction)
                
                let cancelAction = UIAlertAction(title: "否", style: .cancel, handler: nil)
                controller.addAction(cancelAction)
                present(controller, animated: true, completion: nil)
            }
        }
       
    }
    
    @IBAction func send(_ sender: Any) {
        print("SSS")
        //print(get_data.count-1)
        for i in 0 ... get_data.count-1{
            if chosen_teble[i] == "T" {
                choose_data.append(get_data[i])
                print(i)
                print(choose_data[choose_data.count-1])
            }
        }
        performSegue(withIdentifier: "link3", sender: sender)
    }
    

    
    
    
    
    
}
