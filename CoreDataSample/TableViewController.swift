//
//  TableViewController.swift
//  CoreDataSample
//
//  Created by Togami Yuki on 2018/09/17.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var QList:[question]!
    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableViewが読み込まれた時に、CoreDataからデータを読み出し、テーブルViewに表示。
        self.QList = Qread()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.QList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = self.QList[indexPath.row].question
        cell.detailTextLabel?.text = self.QList[indexPath.row].memo

        return cell
    }
    //追加ボタン
    @IBAction func AddQuestion(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "質問を登録しますか？", message:nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in
            //OKボタンを押したときの処理。
            //CoreDataに登録
            Qregist(question: alert.textFields![0].text!,memo:alert.textFields![1].text!)
            //CoreDataから再びデータを読み込む
            self.QList = Qread()
            //TableViewのリロード
            self.myTableView.reloadData()

        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {action in print("キャンセル")}))
        //アラートにテキスト追加
        alert.addTextField { textField -> Void in
            textField.placeholder = "質問を追加"
        }
        alert.addTextField { textField -> Void in
            textField.placeholder = "メモ"
        }
        //その他アラートオプション
        alert.view.layer.cornerRadius = 25 //角丸にする。
        present(alert,animated: true,completion: {()->Void in print("表示")})
    }
}
