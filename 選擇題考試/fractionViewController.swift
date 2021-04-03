

import UIKit

class fractionViewController: UIViewController {
    //顯示分數label
    @IBOutlet weak var ShowFractionLabel: UILabel!

    var fraction:Fractions!
    var showTex = String()
    
    //依照分數顯示不同文字func
    func go() -> String{
        switch fraction.fraction {
        case 100:
            showTex = "恭喜榜首"
        case 70...90:
            showTex = "恭喜合格"
        default:
            showTex = "明年再接再勵"
        }
        return showTex
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ShowFractionLabel.text = "\(fraction.fraction)" //顯示分數
        
        //設定條跳出通知
        let alertControoler = UIAlertController(title: "通知", message: go(), preferredStyle: .alert)
        let okAlerAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertControoler.addAction(okAlerAction)
        present(alertControoler, animated: true, completion: nil)
        
        
        
    }
    
    
    
    //點選按鈕回首頁
    @IBAction func agaib(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true) //回首頁
    }
    
   

}
