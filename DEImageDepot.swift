// Developed by Mykola Darkngs Golyash
// 2020
// http://golyash.com

import UIKit

typealias ImageClosure = (_ image: UIImage?) -> Void

class DEImageDepot {
   
   static let shared = DEImageDepot()
   
   private let imagePrefix = "de-image-depot-"
   
   private init() {
      
   }
   
   // MARK: -
   
   private func documentsPath(forFileName fileName: String) -> String {
      guard let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else {
         return ""
      }
      
      return (documentsPath as NSString).appendingPathComponent(fileName)
   }
   
   private func downloadImage(withPath path: String, completion: @escaping ImageClosure) {
      guard let url = URL(string: path) else {
         completion(nil)
         return
      }
      
      DispatchQueue.global(qos: .userInteractive).async {
         do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
               completion(image)
            }
            
            self.saveImageData(data, withPath: path)
         } catch {
            print(error)
            
            DispatchQueue.main.async {
               completion(nil)
            }
         }
      }
   }
   
   private func imageName(withPath path: String) -> String {
      guard let name = path.split(separator: "/").last else {
         return path
      }
      
      return imagePrefix + name
   }
   
   private func saveImageData(_ data: Data, withPath path: String) {
      let name = imageName(withPath: path)
      let imagePath = documentsPath(forFileName: name)
      do {
         let url = URL(fileURLWithPath: imagePath)
         try data.write(to: url, options: .atomic)
         
         UserDefaults.standard.set(imagePath, forKey: name)
         UserDefaults.standard.synchronize()
      } catch {
         print(error)
      }
   }
   
   // MARK: -
   
   func clear() {
      let fileManager = FileManager.default
      
      guard let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
         return
      }
      
      do {
         let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
         for fileURL in fileURLs {
            if fileURL.lastPathComponent.hasPrefix(imagePrefix) {
               try fileManager.removeItem(at: fileURL)
            }
         }
      } catch {
         print(error)
      }
      
      let keys = UserDefaults.standard.dictionaryRepresentation().keys
      for key in keys {
         if key.hasPrefix(imagePrefix) {
            UserDefaults.standard.removeObject(forKey: key.description)
         }
      }
   }
   
   func image(withPath path: String, _ completion: @escaping ImageClosure) {
      let name = imageName(withPath: path)
      
      guard let imagePath = UserDefaults.standard.string(forKey: name) else {
         downloadImage(withPath: path, completion: completion)
         return
      }
      
      do {
         let url = URL(fileURLWithPath: imagePath)
         let data = try Data(contentsOf: url)
         if let image = UIImage(data: data) {
            completion(image)
            return
         }
      } catch {
         print(error)
      }
      
      downloadImage(withPath: path, completion: completion)
   }
}
