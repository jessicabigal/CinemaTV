//
//  HomeView.swift
//  CinemaTV
//
//  Created by Danilo Requena on 07/11/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    var body: some View {
        NavigationView {
            Group {
                ScrollView(.vertical) {
                    VStack(spacing: 32) {
                        DiscoverMoviesView(movies: viewModel.discoverMovies, selectionIndex: 0)
                            .buttonStyle(.plain)
                            .task {
                                await viewModel.getMoviesList()
                            }
                        
                        CarouselMoviesView(movies: viewModel.upcomingMovies, title: "Em breve", selectionIndex: 0)
                            .buttonStyle(.plain)
                            .task {
                                await viewModel.getUpcomingList()
                            }
                        
                        CarouselMoviesView(movies: viewModel.nowPlayngMovies, title: "Agora nos Cinemas", selectionIndex: 0)
                            .buttonStyle(.plain)
                            .task {
                                await viewModel.getNowPlayngList()
                            }
                        
                        CarouselMoviesView(movies: viewModel.popularMovies, title: "Filmes Populares", selectionIndex: 1)
                            .buttonStyle(.plain)
                            .task {
                                await viewModel.getPopularList()
                            }
                        
                        CarouselMoviesView(movies: viewModel.topRatedMovies, title: "Melhor avaliados", selectionIndex: 2)
                            .buttonStyle(.plain)
                            .task {
                                await viewModel.getTopVotedList()
                            }
                        
                        NavigationLink(destination: MoviesListView(title: "Movies", selectionIndex: 0)) {
                            VStack {
                                Text("Ver Todos")
                            }
                            .frame(width: UIScreen.main.bounds.width - 32, height: 56)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                    }
                }
            }
            .navigationTitle("Discover")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
