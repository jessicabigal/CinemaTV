//
//  MoviesListCell.swift
//  CinemaTV
//
//  Created by Danilo Requena on 20/02/22.
//

import SwiftUI

struct MoviesListCell: View {
    let image: URL?
    let title: String
    let subTitle: String
    var body: some View {
        HStack (alignment: .top){
            if let image = image, let imageData = try? Data(contentsOf: image), let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .background(.ultraThinMaterial)
                    .cornerRadius(16)
                    .frame(width: 100, height: 120)
                
                VStack(spacing: 6) {
                    Text(title)
                        .frame(width: 200)
                        .font(.title3)
                        .lineLimit(1)
                    Text(subTitle)
                        .font(.subheadline)
                        .lineLimit(4)
                }
            } else {
                Image("placeholder-image")
            }
        }
        .background(.bar)
        .cornerRadius(16)
    }
}

struct MoviesListCell_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListCell(
            image: URL(
                string: "\(Constants.basePosters)/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg"
            ),
            title: "Steve Jobs",
            subTitle: "Três momentos importantes da vida do inventor, empresário e magnata Steve Jobs: os bastidores do lançamento do computador Macintosh, em 1984; da empresa NeXT, doze anos depois e do iPod, no ano de 2001."
        )
    }
}