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
    var numberOfDice = 1{
        didSet{
            self.diceNumberLabel.text = String(self.numberOfDice)
        }
    }
    var allDiceViews:[DiceView] = []
    let diceMoveTime = 0.5
    let numberOfRoundsTheDiceRolls:CGFloat = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidLayoutSubviews() {
        //初始化骰子边长
        self.diceLength = (self.view.bounds.width)/6
    }
    
    @IBAction func rollButton(_ sender: UIButton) {
//        for view in self.deckView.subviews{
//            view.removeFromSuperview()
//        }
//        let pos = getRandomLandingPosition(numberOfPositions: 3)
//        for stuff in pos{
//            let v = DiceView(frame:stuff)
//            v.backgroundImage = UIImage(named: "one")
//            self.deckView.addSubview(v)
//        }
        //先搞掉已经存在的骰子
        for diceView in self.deckView.subviews{
            diceView.removeFromSuperview()
        }
        self.allDiceViews = []
        //生成，放到左上角
        for _ in 1...self.numberOfDice{
            let diceView = DiceView(frame:CGRect(x: 0, y: 0, width: self.diceLength, height: self.diceLength))
            self.allDiceViews.append(diceView)
            self.deckView.addSubview(diceView)
            let randomNumber = arc4random_uniform(6) + 1
            var diceImage = UIImage(named: "pic")
            switch randomNumber{
            case 1:
                diceImage = UIImage(named: "one")
            case 2:
                diceImage = UIImage(named: "two")
            case 3:
                diceImage = UIImage(named: "three")
            case 4:
                diceImage = UIImage(named: "four")
            case 5:
                diceImage = UIImage(named: "five")
            case 6:
                diceImage = UIImage(named: "six")
            default:
                diceImage = UIImage(named: "pic")
            }
            diceView.backgroundImage = diceImage
            
        }
        //动画丢
        let newFrames = getRandomLandingPosition(numberOfPositions: self.numberOfDice)
        for index in 0...self.numberOfDice-1{
            UIView.transition(with: self.allDiceViews[index], duration: self.diceMoveTime, options: [], animations:{ self.allDiceViews[index].frame = newFrames[index]
                self.allDiceViews[index].transform = CGAffineTransform(rotationAngle: self.numberOfRoundsTheDiceRolls*CGFloat.pi)
            }, completion: nil)
        }
        
    }
    
    @IBAction func addDiceButton(_ sender: Any) {
        self.numberOfDice+=1
    }
    @IBAction func minusDiceButton(_ sender: Any) {
        self.numberOfDice-=1
    }
    
    @IBOutlet weak var diceNumberLabel: UILabel!
    
    @IBOutlet weak var deckView: DiceDeckView!
    
    
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
