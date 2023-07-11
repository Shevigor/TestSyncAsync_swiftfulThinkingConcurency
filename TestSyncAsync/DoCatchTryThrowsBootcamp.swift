//
//  DoCatchTryThrowsBootcamp.swift
//  TestSyncAsync
//
//  Created by user on 11.07.2023.
//

import SwiftUI

// do-catch
// try
// throws

class DoCatchTryThrowsBootcampDataManager {
    
    private let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            print("NEW TEXT")
            return ("NEW TEXT", nil)
        } else {
            print("nil")
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("NEW TEXT")
        } else {
            return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
        }
    }
    
    func getTitle3() throws -> String {
        if isActive {
            return "NEW TEXT"
        } else {
            throw URLError(.badServerResponse)
        }
    }

    func getTitle4() throws -> String {
        if isActive {
            return "FINAL TEXT"
        } else {
            throw URLError(.cancelled)
        }
    }
    
}


class DoCatchTryThrowsBootcampViewModel: ObservableObject {
    
    @Published var myText: String = "Starting text."
    let manager = DoCatchTryThrowsBootcampDataManager()
    
    func fetchTitle() {
        /*
        let returnValue = manager.getTitle()
        if let newTitle = returnValue.title {
            self.myText = newTitle
        } else if let error = returnValue.error{
            self.myText = error.localizedDescription
        }
        */
        
        /*
        let resultValue = manager.getTitle2()
        switch resultValue {
        case .success(let newTitle):
            self.myText = newTitle
        case .failure(let error):
            self.myText = error.localizedDescription
        }
        */
         
        do {                            // попробуй сделай
            let resultValue = try manager.getTitle3()
            self.myText = resultValue
            
//            let newResultValue = try? manager.getTitle3()     // необязательный try, в блок catch не идем
//            if let newResultValue = newResultValue {
//                self.myText = newResultValue
//            }
            
            let finalValue = try manager.getTitle4()
            self.myText += finalValue
            
        } catch let myError {             // ловим ошибку и даем ей имя
            self.myText = myError.localizedDescription
        }
        
//        let resultValue = try? manager.getTitle3()
//        if let resultValue = resultValue {
//            self.myText = resultValue
//        }
        
    }
}

struct DoCatchTryThrowsBootcamp: View {
    @StateObject private var viewModel = DoCatchTryThrowsBootcampViewModel()
    var body: some View {
        Text(viewModel.myText)
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .onTapGesture {
                viewModel.fetchTitle()
            }
    }
}

struct DoCatchTryThrowsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrowsBootcamp()
    }
}
