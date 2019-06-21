//
//  search_course.swift
//  test65
//
//  Created by User06 on 2019/6/19.
//  Copyright © 2019 User05. All rights reserved.
//

import UIKit
import Firebase

var parse_data : [String]! = []
class search_course : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?){
        let controller = segue.destination as? result
      //  controller?.course_image.text = "111"
        
        
    }
    @IBOutlet weak var Fdep: UITextField!
    
    @IBOutlet weak var FCname: UITextField!
    
    
   
    @IBAction func dep(_ sender: Any) {
    }
    
    @IBOutlet weak var Ftime: UITextField!
    
    @IBOutlet weak var Fprof: UITextField!
    @IBAction func Cname(_ sender: Any) {
    }
    
    @IBAction func FTime(_ sender: Any) {
    }
    
    @IBAction func Cprofessor(_ sender: Any) {
    }
    @IBAction func Search(_ sender: Any) {
        if Fdep.text!.isEmpty && FCname.text!.isEmpty &&
            Fprof.text!.isEmpty &&
            Ftime.text!.isEmpty{
        let acontroller = UIAlertController(title: "無效輸入條件", message: "至少輸入一個欄位", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        acontroller.addAction(okAction)
        present(acontroller, animated: true, completion: nil)
            return
            
        }
        else if Ftime.text?.count != 3 && !(Ftime.text!.isEmpty) {
            let acontroller = UIAlertController(title: "無效輸入條件", message: "上課時間輸入要３碼，格式：星期＋節次", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            acontroller.addAction(okAction)
            present(acontroller, animated: true, completion: nil)
            return
        }
        var dref: DatabaseReference!
        var n : UInt! = 0
       // var ncourse:Int = 0
        dref = Database.database().reference()
        dref.child("courses1081").observe(.value, with: {(snaphost) in
            n = snaphost.childrenCount
            var t = 0
            while t < n {
                let v : DataSnapshot = snaphost.childSnapshot(forPath: String(t))
                let temp :String = self.Fdep.text!
               // print(v.childSnapshot(forPath: "開課系所").value as! String)
                    if (v.childSnapshot(forPath: "開課系所").value as! String).contains(temp){
                        parse_data.append("開課系所:")
                        parse_data[parse_data.count - 1].append(v.childSnapshot(forPath: "開課系所").value as! String)
                    
                }
                t += 1 ;
            }
            if parse_data.isEmpty{
                let acontroller = UIAlertController(title: "找不資料", message: "？？？", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                acontroller.addAction(okAction)
                self.present(acontroller, animated: true, completion: nil)
                t = 0
                return
            }
            else{
                for i in parse_data{
                    print(i)
                }
             self.performSegue(withIdentifier: "link2", sender: sender)
                return
            }
        })
        
    
    }
    
}
