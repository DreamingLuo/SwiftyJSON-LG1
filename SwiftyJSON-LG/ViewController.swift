//
//  ViewController.swift
//  SwiftyJSON-LG
//
//  Created by phiic on 16/9/12.
//  Copyright © 2016年 luogang. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    
    @IBAction func loadWeatherinfo(sender: AnyObject) {
        
        
        WeatherInfo()
    }
    @IBOutlet weak var showWeatherinfo: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func WeatherInfo(){
        //访问网络
        let url = NSURL(string:"http://www.weather.com.cn/adat/sk/101110101.html")
        let jsonData=NSData(contentsOfURL: url!)
        
        //        //方法1 使用NSJSONSerialization解析
        //        do {
        //            let json=try NSJSONSerialization.JSONObjectWithData(jsonData!, options:[]) as! [String:AnyObject]
        //            let weatherInf=json["weatherinfo"] as! NSDictionary
        //            let city=weatherInf["city"]!
        //            let temp=weatherInf["temp"]!
        //            showWeatherInfo.text="城市:\(city)\n温度:\(temp)\n "
        //        }catch let error as NSError{
        //            print("解析出错。\(error.localizedDescription)")
        //        }
        
        //方法2使用SwiftyJSON解析
        let json=JSON(data:jsonData!)
        let city=json["weatherinfo"]["city"]
        let temp=json["weatherinfo"]["temp"]
        showWeatherinfo.text="城市:\(city)\n温度:\(temp)\n"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

