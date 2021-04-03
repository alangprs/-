

import UIKit

class topicViewController: UIViewController {
    //導入自定義資料
    var topic = [Topics]()
    //題號label
    @IBOutlet weak var topicNumberLael: UILabel!
    //題目 label
    @IBOutlet weak var topicLabel: UILabel!
    //選項button
    @IBOutlet var chooseAnserButton: [UIButton]!
    
    
    var topicNumber = 1 //題號
    var index = 0 //控制題目
    var score = 0 //得分
    
    func 顯示題目(){
            topicNumberLael.text = "第\(topicNumber)題" //顯示題號
            topicLabel.text = topic[index].topics //顯示題目
            chooseAnserButton.shuffle() //打亂button答案順序
            //顯示答案的button文字
            chooseAnserButton[0].setTitle(topic[index].answer, for: .normal)
            chooseAnserButton[0].titleLabel?.numberOfLines = 0 //讓button可以顯示超過一行文字
            chooseAnserButton[1].setTitle(topic[index].option01, for: .normal)
            chooseAnserButton[1].titleLabel?.numberOfLines = 0
            chooseAnserButton[2].setTitle(topic[index].Options02, for: .normal)
            chooseAnserButton[2].titleLabel?.numberOfLines = 0
            chooseAnserButton[3].setTitle(topic[index].Options03, for: .normal)
            chooseAnserButton[3].titleLabel?.numberOfLines = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //創照題目
        topic.append(Topics.init(topics: "台灣最高山是？", answer: "玉山", option01: "雪山", Options02: "阿里山", Options03: "大霸尖山"))
        topic.append(Topics.init(topics: "雪霸國家公園所涵蓋的行政區域不包括下列那一個縣市?", answer: "臺中市", option01: "桃園巿", Options02: "新竹縣", Options03: "苗栗縣"))
        topic.append(Topics.init(topics: "下列何者不是高山型國家公園?", answer: "太魯閣", option01: "雪霸", Options02: "陽明山", Options03: "玉山"))
        topic.append(Topics.init(topics: "旅客與導遊經過幾天相處有了好交情後，對導遊所犯的小差錯較能諒解，是基於態度的何種因素?", answer: "情感因素", option01: "認知因素", Options02: "道德因素", Options03: "社會因素"))
        topic.append(Topics.init(topics: "國立故宮博物院館藏的明初工藝器物的製作過程中，所謂「剔紅」應屬下列何種器物的工藝技法?", answer: "琺瑯器", option01: "雕漆器", Options02: "陶瓷器", Options03: "玉石器"))
        topic.append((Topics.init(topics: "下列何者不屬於策劃戶外解說教學活動時，行前應考慮的細節?", answer: "提供誘捕動物的香料", option01: "列出攜帶物品", Options02: "學員分組", Options03: "準備急救箱")))
        topic.append(Topics.init(topics: "請問聞名中外的「八二三炮戰」發生於西元幾年?", answer: "1948", option01: "1947", Options02: "1957", Options03: "1958"))
        topic.append(Topics.init(topics: "觀霧遊憩區位於:", answer: "雪霸國家公園", option01: "玉山國家公園", Options02: "墾丁國家公園", Options03: "太魯閣國家公園"))
        topic.append((Topics.init(topics: "「舊好茶」部落中分布許多的石板屋，此部落以那一原住民族為代表?", answer: "泰雅族", option01: "排灣族", Options02: "魯凱族", Options03: "賽夏族")))
        topic.append((Topics.init(topics: "為了報謝七娘媽護佑孩子長大成人，在臺灣傳統節慶中有「作十六歲」的節日，請問是下列那一個節慶?", answer: "中元節", option01: "七夕", Options02: "上元節", Options03: "媽祖誕辰日")))
        topic.append(Topics.init(topics: "中華料理中的「螞蟻上樹」是何地方的料理?", answer: "四川", option01: "北平", Options02: "湖南", Options03: "廣東"))
        //打亂topic array排序
        topic.shuffle()
        顯示題目()
        
    }
    
    //選擇答案button
    @IBAction func chooseAnswe(_ sender: UIButton) {
        if index < 9{
            if sender.titleLabel?.text == topic[index].answer{ //如果選擇的答案跟正確答案一樣
                score += 10
            }else{ //如果答錯
                score -= 10
            }
            index += 1
            topicNumber += 1
            顯示題目()
        }else if index == 9{ //如果題目結束
            performSegue(withIdentifier: "show", sender: nil)
        }
        
        
        
    }
    
    //傳分數到下一頁
    @IBSegueAction func giveTheNextPageScore(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> fractionViewController? {
        let controller = fractionViewController(coder: coder)
        controller?.fraction = Fractions(fraction: score)
        
        return controller
    }
}
