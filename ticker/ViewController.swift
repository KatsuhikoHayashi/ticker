//
//  ViewController.swift
//  ticker
//
//  Created by Hayashidesu on 2014/10/20.
//  Copyright (c) 2014年 Hayashidesu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sc: UIScrollView!
    @IBOutlet weak var lbl: UILabel!
    
    var msg = [String]()
    var msgId = 0
    var offsetX:CGFloat = 0
    var changeFlg:Bool = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        msg = ["あああああいいいいいうううううえええええおおおおお",
            "かかかかかきききききくくくくく" ,
            "さささささしししししすすすすすせせせせせ",
            "たたたたたちちちちちつつつつつてててててとととととたたたたたちちちちちつつつつつ",
            "なななななにににににぬぬぬぬぬねねねねねのののののななななな"]
        
        NSTimer.scheduledTimerWithTimeInterval(0.04, target: self, selector: Selector("scrollTicker"), userInfo: nil, repeats: true)

    }

    func scrollTicker(){
        if(changeFlg == true){
            var offset = sc.contentOffset
            offset.x = -self.view.frame.size.width
            sc.contentOffset = offset
            
            lbl.text = msg[msgId]
            msgId++
            if(msgId >= msg.count){
                msgId = 0
            }
            
            self.lbl.sizeToFit()
            offsetX = self.lbl.frame.size.width
            
            changeFlg = false
        }else{
            var offset = sc.contentOffset
            offset.x += 3.0;
            if (offsetX < offset.x) {
                changeFlg = true
            }
            sc.contentOffset = offset
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

