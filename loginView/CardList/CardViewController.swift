//
//  CardViewController.swift
//  CartList
//
//  Created by Derrick on 2021/03/08.
//

import UIKit

class CardViewController: UIViewController, UITextFieldDelegate {

    //---------------
    // Properties
    //---------------
    
    @IBOutlet weak var buttonCheckBox: UIButton!
    @IBOutlet weak var btnPersonal: UIButton!
    @IBOutlet weak var btnCorporation: UIButton!
    
    @IBOutlet weak var textFirstNumber: UITextField!
    @IBOutlet weak var textSecondNumber: UITextField!
    @IBOutlet weak var textThirdNumber: UITextField!
    @IBOutlet weak var textFourthNumber: UITextField!
    @IBOutlet weak var textMonth: UITextField!
    @IBOutlet weak var textYear: UITextField!
    @IBOutlet weak var textBirthDay: UITextField!
    
    var checkOn = true
    var personal = true
    var corporation = true
    var cType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        basicInit()
        
    }
    
    //---------------
    // Actions
    //---------------
    
    // CheckBox
    @IBAction func btnCheckBox(_ sender: UIButton) {
        if checkOn {
            buttonCheckBox.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            checkOn = false
        }else{
            buttonCheckBox.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            checkOn = true
        }
        
    }
    
    // KeyBoard Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    
    @IBAction func buttonPersonal(_ sender: UIButton) {
        if personal{
            btnPersonal.backgroundColor = UIColor.black
            cType = "개인"
            personal = false
        }else{
            btnPersonal.backgroundColor = UIColor.gray
            cType = ""
            personal = true
        }
    }
    @IBAction func buttonCorporation(_ sender: UIButton) {
        if corporation{
            btnCorporation.backgroundColor = UIColor.black
            cType = "법인"
            corporation = false
        }else{
            btnCorporation.backgroundColor = UIColor.gray
            cType = ""
            corporation = true
        }
        
    }
    
    @IBAction func buttonInsert(_ sender: UIButton) {
        
        let firstNum = textFirstNumber.text
        let secondNum = textSecondNumber.text
        let thirdNum = textThirdNumber.text
        let fourthNum = textFourthNumber.text
        
        let cNumber = "\(firstNum)-\(secondNum)-\(thirdNum)-\(fourthNum)"
        let cValidDate = "\(textMonth)/\(textYear)"
        let cBirthday = textBirthDay.text
        
        let insertModel = InsertModel()
        
        if checkOn == false{
            //Bool 값으로 처리
            let result = insertModel.insertItems(cType: cType, cNumber: cNumber, cValidDate: cValidDate, cBirthday: cBirthday!)
            if result == true {
                let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                    
                })
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)
                
            }else{
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)
                
            }
        }else{
            let agreeAlert = UIAlertController(title: "동의체크", message: "동의버튼을 체크하세요.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            agreeAlert.addAction(onAction)
            present(agreeAlert, animated: true, completion: nil)
            
        }
      
    }
    
    @IBAction func buttonCancel(_ sender: UIButton) {
        
    }
    
    
    func checkCardNumberMaxLength(textField: UITextField!, maxLength: Int) {
        
        if (textField.text?.count ?? 5 > maxLength) {
            textField.deleteBackward()
        }
       }//-----
    func checkValidDate(textField: UITextField!, maxLength: Int) {
        if textField.text?.count ?? 3 > maxLength {
           textField.deleteBackward()
        }
    }

    func checkBirthDay(textField: UITextField!, maxLength: Int) {
        if textField.text?.count ?? 7 > maxLength {
            textField.deleteBackward()
         }
    }
    
    
    @IBAction func textFirstNumber(_ sender: UITextField) {
        checkCardNumberMaxLength(textField: textFirstNumber, maxLength: 4)
    }
    @IBAction func textSecondNumber(_ sender: UITextField) {
        checkCardNumberMaxLength(textField: textSecondNumber, maxLength: 4)
    }
    @IBAction func textThirdNumber(_ sender: UITextField) {
        checkCardNumberMaxLength(textField: textThirdNumber, maxLength: 4)
    }
    @IBAction func textFourthNumber(_ sender: UITextField) {
        checkCardNumberMaxLength(textField: textFourthNumber, maxLength: 4)
    }
    

    @IBAction func textMonth(_ sender: UITextField) {
        checkValidDate(textField: textMonth, maxLength: 2)
    }
   
    @IBAction func textYear(_ sender: UITextField) {
        checkValidDate(textField: textYear, maxLength: 2)
    }

    @IBAction func textBirthDay(_ sender: UITextField) {
        checkBirthDay(textField: textBirthDay, maxLength: 6)
    }
    
    
    func basicInit(){
        textFirstNumber.delegate = self
        textSecondNumber.delegate = self
        textThirdNumber.delegate = self
        textFourthNumber.delegate = self
        textMonth.delegate = self
        textYear.delegate = self
        textBirthDay.delegate = self
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
