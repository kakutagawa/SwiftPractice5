//
//  ContentView.swift
//  MyOkashi5
//
//  Created by 芥川浩平 on 2023/12/04.
//

import SwiftUI

struct ContentView: View {
    @StateObject var okashiDataList = OkashiData()
    @State var inputText = ""

    var body: some View {
        VStack {
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
                .onSubmit {
                    okashiDataList.searchOkashi(keyword: inputText)
                }
                .submitLabel(.search)
                .padding()

            List(okashiDataList.okashiList) { okashi in
                HStack {
                    AsyncImage(url: okashi.image) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                    } placeholder: {
                         ProgressView()
                    }
                    Text(okashi.name)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
