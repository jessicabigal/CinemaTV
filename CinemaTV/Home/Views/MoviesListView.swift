//
//  MoviesListView.swift
//  CinemaTV
//
//  Created by Danilo Requena on 20/02/22.
//

import SwiftUI

enum MoviesState {
    case discover
    case upcoming
    case topVoted
    case nowPlaying
}

struct MoviesListView: View {
    let title: String
    let state: MoviesState
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        if viewModel.isLoadingPage {
            CinemaTVProgressView()
        } else if state == .discover {
            List(viewModel.discoverMovies) { movie in
                MoviesListCell(
                    image: URL(string: Constants.basePosters + movie.posterPath),
                    title: movie.title,
                    subTitle: movie.overview
                )
                    .onAppear {
                        setupViews(state: state, movie: movie)
                    }
            }
            .navigationTitle(title)
        } else if state == .topVoted {
            List(viewModel.topRatedMovies) { movie in
                MoviesListCell(
                    image: URL(string: Constants.basePosters + movie.posterPath),
                    title: movie.title,
                    subTitle: movie.overview
                )
                    .onAppear {
                        setupViews(state: state, movie: movie)
                    }
            }
            .navigationTitle(title)
            
        } else if state == .nowPlaying {
            List(viewModel.nowPlayngMovies) { movie in
                MoviesListCell(
                    image: URL(string: Constants.basePosters + movie.posterPath),
                    title: movie.title,
                    subTitle: movie.overview
                )
                    .onAppear {
                        setupViews(state: state, movie: movie)
                    }
            }
            .navigationTitle(title)
            
        } else if state == .upcoming {
            List(viewModel.upcomingMovies) { movie in
                MoviesListCell(
                    image: URL(string: Constants.basePosters + movie.posterPath),
                    title: movie.title,
                    subTitle: movie.overview
                )
                    .onAppear {
                        setupViews(state: state, movie: movie)
                    }
            }
            .navigationTitle(title)
        }
    }
    
    private func setupViews(state: MoviesState, movie: MoviesResult) {
        switch state {
        case .discover:
            if movie == viewModel.discoverMovies.last {
                viewModel.getMoviesList()
            }
        case .upcoming:
            if movie == viewModel.upcomingMovies.last {
                viewModel.getUpcomingList()
            }
        case .topVoted:
            if movie == viewModel.topRatedMovies.last {
                viewModel.getTopVotedList()
            }
        case .nowPlaying:
            if movie == viewModel.nowPlayngMovies.last {
                viewModel.getNowPlayngList()
            }
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(
            title: "Movies", state: .topVoted
        )
    }
}