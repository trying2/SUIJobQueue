//
//  SearchHistoryScreen.swift
//  SuiApp3
//
//  Created by Александр Вяткин on 14.11.2021.
//

import SwiftUI

struct SearchHistoryScreen: View {
    @StateObject var viewModel = SearchHistoryViewModel()
    
    var suffixList: some View {
        List(self.viewModel.results, id: \.self) { result in
            let color = result.isMax ? Color.red : result.isMin ? Color.green : Color.black
            HStack {
                Text(result.searchText)
                Spacer()
                
                Text("\(result.timeResult)")
                    .foregroundColor(color)
            }
            
        }
    }
    
    var body: some View {
        suffixList
    }
}

struct SearchHistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryScreen()
    }
}
