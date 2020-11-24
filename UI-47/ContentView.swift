//
//  ContentView.swift
//  UI-47
//
//  Created by にゃんにゃん丸 on 2020/11/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var txt = ""
    @State var datas = ["あいうえお","abc","MLB","NBA","NFL","マイケルジョーダン"]
    var body: some View {
        VStack{
            
            SearchView(txt: $txt)
            
            List(datas.filter{txt == "" ? true : $0.localizedCaseInsensitiveContains(txt)},id:\.self){i in
                
                Text(i)
            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchView : UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return SearchView.Coordinator(parcent1: self)
    }
    
    
    @Binding var txt : String
    func makeUIView(context: Context) -> UISearchBar {
        
        let view = UISearchBar()
        view.barStyle = .default
        view.autocapitalizationType = .none
        view.delegate = context.coordinator
        return view
        
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }
    
    class Coordinator : NSObject,UISearchBarDelegate{
        
        var parcent : SearchView!
        
        init(parcent1:SearchView) {
            parcent = parcent1
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parcent.txt = searchText
        }
        
        
    }
}
