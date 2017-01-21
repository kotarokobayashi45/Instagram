//
//  ComentViewController.swift
//  Instagram
//
//  Created by 小林光太郎 on 2017/01/14.
//  Copyright © 2017年 kotarou.kobayashi. All rights reserved.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentTextField: UITextField!
    
    var postData: PostData!
    
    @IBAction func handlePostButton(_ sender: Any) {
        // コメントを投稿する
        let name = FIRAuth.auth()?.currentUser?.displayName
        let commentText = "\(name!) : \(commentTextField.text!)"
        postData.comments.append(commentText)
        let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comments": postData.comments]
        postRef.updateChildValues(comments)
        // 戻る
        dismiss(animated: true, completion: nil)
    }
    @IBAction func handleCancelButton(_ sender: Any) {
        // 戻る
        dismiss(animated: true, completion: nil)
    }
    
}
