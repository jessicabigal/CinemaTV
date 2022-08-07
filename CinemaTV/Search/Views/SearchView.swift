//
//  SearchView.swift
//  CinemaTV
//
//  Created by Danilo Requena on 18/07/22.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State var searchText = ""
    @Environment(\.isSearching) var isSearching
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.viewModel.movies.filter { self.searchText.isEmpty ? true : $0.title.contains(self.searchText)}) { movie in
                    VStack(alignment: .leading) {
                        MoviesListCell(
                            image: URL(string: Constants.basePosters + (movie.posterPath ?? "")),
                            title: movie.title,
                            subTitle: movie.overview ?? ""
                        )
                    }
                }
            }
            .searchable(text: self.$searchText, placement: .toolbar)
            .navigationTitle("Search")
            .onChange(of: self.searchText, perform: { newQuery in
                self.viewModel.loadResults(searchText: newQuery)
            })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
