//
//  ViewController.swift
//  SeeFood
//
//  Created by 206568245 on 3/10/23.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!

    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }

    override func viewWillAppear(_ animated: Bool) {

        guard let navBar = navigationController?.navigationBar else { fatalError("Navigation Controller does not exist") }

        guard let navBarUIColor = UIColor(hexString: K.navBarTintColor) else { return }

        navBar.scrollEdgeAppearance?.backgroundColor = navBarUIColor
        navBar.scrollEdgeAppearance?.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        guard let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }

        imageView.image = userPickedImage

        imagePicker.dismiss(animated: true)
    }

    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {

        present(imagePicker, animated: true)


    }

}

