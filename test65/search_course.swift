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
    func post (V: DataSnapshot)
    {
        parse_data.append("開課系所:")
        parse_data[parse_data.count - 1].append(V.childSnapshot(forPath:"開課系所"
            ).value as! String)
        parse_data[parse_data.count - 1].append("\n課名:")
        parse_data[parse_data.count - 1].append(V.childSnapshot(forPath: "中文課名").value as! String)
        parse_data[parse_data.count - 1].append("\n上課時間:")
        let nt = V.childSnapshot(forPath: "上課時間").childrenCount
        if nt == 0{
            
        }
        else{
            for j in 0 ... (nt-1){
                
                parse_data[parse_data.count - 1].append((V.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String))
                parse_data[parse_data.count-1].append(",")
            }
            parse_data[parse_data.count - 1].append((V.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(nt-1)).value as! String))
        }
        
        
        parse_data[parse_data.count - 1].append("\n授課老師:")
        parse_data[parse_data.count - 1].append(V.childSnapshot(forPath: "授課老師").value as! String)
       
    }
    
        dref = Database.database().reference()
        dref.child("courses1081").observe(.value, with: {(snaphost) in
            n = snaphost.childrenCount
            let temp1 :String = self.Fdep.text!
            let temp2 :String = self.FCname.text!
            let temp3 :String = self.Fprof.text!
            let temp4 :String = self.Ftime.text!
            var t :Int = -1
            parse_data = []
            while t <= (Int)(n-2) {
                 t += 1
                
                let v : DataSnapshot = snaphost.childSnapshot(forPath: String(t))
                if (!(self.Fdep.text!.isEmpty) && !(self.FCname.text!.isEmpty) && !(self.Ftime.text!.isEmpty) && !(self.Fprof.text!.isEmpty)) {
                   
                    print((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1),
                    (v.childSnapshot(forPath: "中文課名").value as!String).contains(temp2),(v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3))
                    
                    print(v.childSnapshot(forPath: "開課系所").value as! String)
                    if ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)) &&
                        ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)) &&
                        ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)) {
                        let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                        if nt == 0{
                            
                                post(V: v)
                            
                        }else{
                        for j in 0 ... (nt-1){
                            if ((v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4)){
                                //print("2")
                                post(V: v)
                            
                                break
                            }
                        }
                        }
                    }
                    
                  }//end1
                else if ( !(self.FCname.text!.isEmpty) && !(self.Ftime.text!.isEmpty) && !(self.Fprof.text!.isEmpty)){
                 
                    if  ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)) &&
                        ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)){
                        let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                          if nt == 0{
                            
                                post(V: v)
                            
                            }else{
                                for j in 0 ... (nt-1){
                                    if ((v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4)){
                                        //print("2")
                                        post(V: v)
                                        
                                        break
                                    }
                                }
                            }
                    }
                    
                    
                }//end2
                else if  (!(self.Fdep.text!.isEmpty) && !(self.Ftime.text!.isEmpty) && !(self.Fprof.text!.isEmpty)){
                 
                    if  ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)) &&
                        ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)){
                        let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                        if nt == 0{
                            
                                post(V: v)
                            
                            }else{
                                for j in 0 ... (nt-1){
                                    if ((v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4)){
                                        //print("2")
                                        post(V: v)
                                        
                                        break
                                    }
                                }
                            }
                    }
                }//end3
                else if (!(self.Fdep.text!.isEmpty) && !(self.FCname.text!.isEmpty) && !(self.Fprof.text!.isEmpty)){
                 
                    if ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)) &&
                        ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)) &&
                        ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)){
                        
                        post(V: v)
                     
                        
                    }
                }//end4
                else if(!(self.Fdep.text!.isEmpty) && !(self.FCname.text!.isEmpty) && !(self.Ftime.text!.isEmpty)){
             
                    if  ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)) &&
                        ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)){
                        let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                        if nt == 0{
                           
                                post(V: v)
                            
                            }else{
                                for j in 0 ... (nt-1){
                                    if ((v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4)){
                                        //print("2")
                                        post(V: v)
                                        
                                        break
                                    }
                                }
                            }
                    }
                    
                }//end5
                else if (!(self.Fdep.text!.isEmpty) && !(self.FCname.text!.isEmpty)){
                    if ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)) &&
                        ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)){
                        post(V: v)
                    }
                }//end6
                else if (!(self.Fdep.text!.isEmpty) && !(self.Ftime.text!.isEmpty)){
                    
                    if ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)) {
                     
                        let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                        if nt == 0{
                            
                                post(V: v)
                            
                        }
                        for j in 0 ... (nt-1){
                           if (v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4){
                                post(V: v)
                                break
                            }
                            
                        }
                    }
                }//end7
                else if (!(self.Fdep.text!.isEmpty) && !(self.Fprof.text!.isEmpty)){
                    if ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)) &&
                        ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)){
                        post(V: v)
                    }
                }//end8
                else if (!(self.FCname.text!.isEmpty) && !(self.Ftime.text!.isEmpty)){
                    if ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)) {
                        
                        let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                        if nt == 0{
                              post(V: v)
                        }
                        else{
                        for j in 0 ... (nt-1){
                            if (v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4){
                                post(V: v)
                                break
                            }
                            
                        }
                        }
                    }
                }//end9
                else if (!(self.FCname.text!.isEmpty) && !(self.Fprof.text!.isEmpty)){
                    if ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)) &&
                        ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)){
                     post(V: v)
                    }
                    
                }//end10
                else if (!(self.Ftime.text!.isEmpty) && !(self.Fprof.text!.isEmpty)){
                    if ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)){
                       
                        let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                        if nt == 0{
                               post(V: v)
                            }else{
                                for j in 0 ... (nt-1){
                                    if ((v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4)){
                                        //print("2")
                                        post(V: v)
                                        
                                        break
                                    }
                                }
                         }
                    }
                }//end11
                else if !(self.Fdep.text!.isEmpty){
                    if ((v.childSnapshot(forPath: "開課系所").value as! String).contains(temp1)){
                        post(V: v)
                    }
                }
                else if !(self.Ftime.text!.isEmpty){
                    let nt = v.childSnapshot(forPath: "上課時間").childrenCount
                    if nt == 0{
                        post(V: v)
                    }
                    else{
                        for j in 0 ... (nt-1){
                            if (v.childSnapshot(forPath: "上課時間").childSnapshot(forPath: String(j)).value as! String).elementsEqual(temp4){
                                post(V: v)
                                break
                            }
                            
                        }
                    }
                }
                else if !(self.FCname.text!.isEmpty){
                    if ((v.childSnapshot(forPath: "中文課名").value as! String).contains(temp2)){
                        post(V: v)
                    }
                }
                else{
                    if ((v.childSnapshot(forPath: "授課老師").value as! String).contains(temp3)){
                        post(V: v)
                    }
                }
            }//end while
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
