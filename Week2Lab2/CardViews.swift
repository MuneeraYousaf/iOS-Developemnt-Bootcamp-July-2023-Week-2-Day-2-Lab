import Foundation
import SwiftUI
struct CardView: View
{
    let data:CardData
    var body: some View {
         
        GeometryReader {geometry in
            ZStack{
                    
                    //MARK: Image
                    AsyncImage(url: data.imageURL) { result in
                        if let image = result.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else {
        //                    Rectangle()
        //                        .fill(Color.black.opacity(0.1))
                            ProgressView()
                        }
                        
                    }.frame(height: 200)
                    
                    VStack {
                        Spacer()
                        Text(data.title)
                           
                        HStack{
                            Text(data.subTitle)
                            
                            Text(data.minutes.description)
                                
                        }
                        
                    } .frame(maxWidth: .infinity, alignment: .leading).foregroundColor(Color.white)
                    .padding(10)
                   
                  
                } .frame(height: 200)
                    .clipped()
                .background(Gradient(colors: [Color.clear,Color.clear, Color.clear  ,Color.black]))
        }.frame(height: 200)
        }
           
        
            
    
    
}
//
//  CardViews.swift
//  Week2Lab2
//
//  Created by Muneera Y on 14/01/1445 AH.
//

import Foundation
