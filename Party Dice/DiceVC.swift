//
//  DiceVC.swift
//  Party Dice
//
//  Created by 周熙岩 on 2019/1/14.
//  Copyright © 2019 DoDo. All rights reserved.
//

import UIKit

class DiceVC: UIViewController {
    
    var diceLength:CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }
    var firstTime = true
    override func viewDidLayoutSubviews() {
        print("did layout subviews")
        //初始化骰子边长
        self.diceLength = (self.view.bounds.width)/6
        //test
        if firstTime{
            
            let pos = getRandomLandingPosition(numberOfPositions: 3)
            for stuff in pos{
                let v = DiceView(frame:stuff)
                v.backgroundImage = UIImage(named: "one")
                self.deckView.addSubview(v)
            }
            self.firstTime = false
        }
    }
    
    @IBAction func rollButton(_ sender: UIButton) {
        for view in self.deckView.subviews{
            view.removeFromSuperview()
        }
        let pos = getRandomLandingPosition(numberOfPositions: 3)
        for stuff in pos{
            let v = DiceView(frame:stuff)
            v.backgroundImage = UIImage(named: "one")
            self.deckView.addSubview(v)
        }
    }
    
    @IBAction func addDiceButton(_ sender: Any) {
    }
    @IBAction func minusDiceButton(_ sender: Any) {
    }
    @IBOutlet weak var diceNumberLabel: UIStackView!
    
    @IBOutlet weak var deckView: DiceDeckView!
    
    //返回包含9个CGRECT的列表用来掷骰子
//    func getAllPossibleLandingLocation() -> [CGRect] {
//        let minusNumber:CGFloat = 20
//
//        let boundWidth = Int(self.deckView.bounds.width)
//        let boundHeight = Int(self.deckView.bounds.height)
//
//        var possibleLandingLocations:[CGRect] = []
//        for outterIndex in 1...3{
//            for innerIndex in 1...3{
//                possibleLandingLocations.append(CGRect(x: CGFloat(outterIndex*(boundWidth/3)) - self.diceLength - minusNumber, y: CGFloat(innerIndex*(boundHeight/3)) - self.diceLength - minusNumber, width: self.diceLength, height: self.diceLength))
//            }
//        }
//        return possibleLandingLocations
//    }
    
    //返回n个随机位置
    func getRandomLandingPosition(numberOfPositions:Int)->[CGRect]{
        var numberOfPositions = numberOfPositions
        let boundWidth = self.deckView.bounds.width
        let boundHeight = self.deckView.bounds.height
        var returnCGRects:[CGRect] = []
        while true {
            let randomX = CGFloat(arc4random_uniform(UInt32(boundWidth - self.diceLength)))
            let randomY = CGFloat(arc4random_uniform(UInt32(boundHeight - self.diceLength)))
            
            var doNotCollide = true
            //判断生成的骰子会不会重叠
            for cgrect in returnCGRects{
                if abs(cgrect.minX - randomX)<self.diceLength || abs(cgrect.minY - randomY)<self.diceLength{
                    doNotCollide = false
                    break
                }
            }
            if doNotCollide{
                returnCGRects.append(CGRect(x: randomX, y: randomY, width: self.diceLength, height: self.diceLength))
                print(numberOfPositions)
                numberOfPositions -= 1
                if numberOfPositions == 0{
                    break
                }
            }else{
                continue
            }
        }
        //随机角度旋转
        return returnCGRects
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
