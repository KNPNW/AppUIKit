//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Кирилл Падалица on 18.09.2021.
//

import UIKit

class StoryPromptViewController: UIViewController {
    @IBOutlet weak var storyPromptTextView: UITextView!
    
    var storyPrompt: StoryPromptEntry?
    var isNewStoryPrompt = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyPromptTextView.text = storyPrompt?.description
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
        }
    }
    @objc func saveStoryPrompt() {
        NotificationCenter.default.post(name: .StoryPromptSaved, object: storyPrompt)
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func cancelStoryPrompt() {
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    
    
}
//test
