//
//  SettingPageVC.swift
//  Party Dice
//
//  Created by 周熙岩 on 2019/1/16.
//  Copyright © 2019 DoDo. All rights reserved.
//

import UIKit

class SettingPageVC: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //控制picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerModel.count
    }
    //pickerc的model
    let pickerModel = ["Just Black", "Light Gray", "Dark Gray", "Light Blue", "Dark Blue"]
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerModel[row]
    }
    
    //UserDefaults
    let StandarUserDefault = UserDefaults.standard
    //didLoad, 根据UserDefault初始化
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = false
        self.backgroudColorPicker.dataSource = self
        self.backgroudColorPicker.delegate = self
        //初始化switch和picker
        self.soundSwitchOulet.setOn(self.StandarUserDefault.bool(forKey: "DiceAppSoundSwitch"), animated: false)
        self.vibrationSwitchOutlet.setOn(self.StandarUserDefault.bool(forKey: "DiceAppvibrationSwitch"), animated: false)
        self.shakeToRollSwitchOutlet.setOn(self.StandarUserDefault.bool(forKey: "DiceAppshakeToRollSwitch"), animated: false)
        self.backgroudColorPicker.selectRow(self.StandarUserDefault.integer(forKey: "DiceAppBackgroundColorNumber"), inComponent: 0, animated: false)
        
    }
    //pick后
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.StandarUserDefault.set(row, forKey: "DiceAppBackgroundColorNumber")
    }
    //一堆switch
    
    @IBOutlet weak var soundSwitchOulet: UISwitch!
    @IBAction func soundSwitch(_ sender: UISwitch) {
        self.StandarUserDefault.set(self.soundSwitchOulet.isOn, forKey: "DiceAppSoundSwitch")
    }
    
    @IBOutlet weak var vibrationSwitchOutlet: UISwitch!
    @IBAction func vivrationSwitch(_ sender: UISwitch) {
        self.StandarUserDefault.set(self.vibrationSwitchOutlet.isOn, forKey: "DiceAppvibrationSwitch")
    }
    
    @IBOutlet weak var shakeToRollSwitchOutlet: UISwitch!
    @IBAction func shakeToRollSwitch(_ sender: UISwitch) {
        self.StandarUserDefault.set(self.shakeToRollSwitchOutlet.isOn, forKey: "DiceAppshakeToRollSwitch")
    }
    @IBOutlet weak var backgroudColorPicker: UIPickerView!
    
    
    
    
    
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
