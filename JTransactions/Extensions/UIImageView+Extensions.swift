// https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift

import UIKit

extension UIImageView {
    func image(from url: URL?, contentMode mode: ContentMode = .scaleAspectFill) {
        guard let url = url else {
            return
        }
        
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType,
                  mimeType.hasPrefix("image"),
                  let data = data,
                  error == nil,
                  let image = UIImage(data: data)
            else {
                return
            }
            
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            
        }.resume()
    }
}
