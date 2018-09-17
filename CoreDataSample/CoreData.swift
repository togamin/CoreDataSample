//
//  CoreData.swift
//  CoreDataSample
//
//  Created by Togami Yuki on 2018/09/17.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import CoreData

//CoreDataからデータを取り出すために必要な構造体.構造体とは、データをまとめて一つの塊にしたもの。
struct question {
    var question:String!
    var memo:String!
    init(question:String,memo:String){
        self.question = question
        self.memo = memo
    }
}

//CoreDataにデータを登録する関数
func Qregist(question:String,memo:String){
    
    //AppDelegateを使う用意をしておく
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    //Entityのオブジェクトを作成
    let Question = NSEntityDescription.entity(forEntityName: "Entity", in: viewContext)
    //レコードを挿入するためのオブジェクトを作成
    let newRecode = NSManagedObject(entity: Question!, insertInto: viewContext)
    //値のセット
    newRecode.setValue(question, forKey: "question")
    newRecode.setValue(memo, forKey: "memo")
    do{
        //レコード(行)の即時保存
        try viewContext.save()
        //print("ArticleInfo登録完了")
    }catch{
        print("error")
    }
}

//CoreDataからデータを読み出す関数
func Qread()->[question]{
    var QInfo:[question] = []
    
    //AppDelegateを使う用意をしておく
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //Entityを操作するためのオブジェクトを作成
    let viewContext = appDelegate.persistentContainer.viewContext
    
    //どのEntity(テーブル)からデータを取り出して来るかの設定
    let query:NSFetchRequest<Entity> = Entity.fetchRequest()
    
    do{
        //データを一括取得
        let fetchResults = try! viewContext.fetch(query)
        //データの取得
        for result:AnyObject in fetchResults{
            QInfo.append(question(question:result.value(forKey:"question")! as! String,memo:result.value(forKey:"memo")! as! String))
        }
    }catch{
    }
        
    return QInfo
}



