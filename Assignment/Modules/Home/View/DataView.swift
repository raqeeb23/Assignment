//
//  DataView.swift
//  Assignment
//
//  Created by Shaikh Rakib on 27/01/24.
//

import SwiftUI

class DataViewModel: NSObject, ObservableObject, URLSessionWebSocketDelegate {
    
    private var webSocket : URLSessionWebSocketTask?
    @Published var data: String = ""

    func connectToSocket(url: String) {
        guard webSocket == nil else {return}
        //Session
               let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
               
               //Server API
               let url = URL(string:  url)
               
               //Socket
               webSocket = session.webSocketTask(with: url!)
               
               //Connect and hanles handshake
               webSocket?.resume()
        
        
        
        webSocket?.receive(completionHandler: { (result) in
            switch result {
            case .success(let serverData):
                switch serverData {
                case .data(let data):
                    print(data)
                case .string(let serverMessage):
                    self.data = serverMessage
                @unknown default:
                    print("Unknown result")
                }
            case .failure(let failure):
                print(failure)
            }
        })
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Connected to server")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Disconnect from Server \(reason)")
    }
}

struct DataView: View {
    @ObservedObject var viewModel = DataViewModel()
    let data: ContentData
    
    init(data: ContentData) {
        self.data = data
        viewModel.connectToSocket(url: data.source)
    }
    
    
    var body: some View {
        VStack {
            Text(data.title)
            Text(data.source)
            Text("Message from server \(viewModel.data.isEmpty ? "loading..." : viewModel.data)")
        }
    }
}

#Preview {
    DataView(data: ContentData(title: "Data", source: "This is source", value: "This is value"))
}
