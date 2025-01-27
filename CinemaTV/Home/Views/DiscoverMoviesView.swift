//
//  DiscoverMoviesView.swift
//  CinemaTV
//
//  Created by Danilo Requena on 07/11/21.
//

import SwiftUI

struct DiscoverMoviesView: View {
    let movies: [MovieResult]
    var selectionIndex: Int
    var body: some View {
        if movies.isEmpty {
            CinemaTVProgressView()
        } else {
            VStack(alignment: .trailing) {
                NavigationLink(
                    destination: MoviesListView(
                        title: "Discover",
                        selectionIndex: selectionIndex
                    )
                ) {
                    Text("ver todos")
                        .font(.subheadline)
                        .padding(.trailing, 16)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(movies) { movie in
                            NavigationLink(destination: DetailView(movieID: movie.id)) {
                                GeometryReader { proxy in
                                    MovieCell(image: URL(string: Constants.basePosters + (movie.posterPath ?? "")))
                                        .rotation3DEffect(Angle(degrees: (Double(proxy.frame(in: .global).minX) - 40) / -20), axis: (x: 0, y: 10.0, z: 0))
                                }
                                .frame(width: 246, height: 150)
                            }
                        }
                    }
                    .padding(.top, 10)
                    .padding(.trailing, 40)
                    .padding(.leading, 40)
                    .padding(.bottom, 40)
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: 460)
        }
    }
}

struct DiscoverMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMoviesView(movies: MovieResult.stubbedMovies(), selectionIndex: 0)
    }
}
