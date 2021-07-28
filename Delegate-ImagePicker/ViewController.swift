//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by 장우전 on 2021/07/28.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!

    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
}

// MARK: - 이미지 피커 컨트롤러 델리게이트 메서드
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) { () in
            let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.🧐", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) { () in
            let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}

// MARK: - 네비게이션 컨트롤러 델리게이트 메서드
extension ViewController: UINavigationControllerDelegate {
}
