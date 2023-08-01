//
//  ContentView.swift
//  Week2Lab2
//
//  Created by Muneera Y on 13/01/1445 AH.
//

import SwiftUI
struct CardData: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subTitle: String
    let minutes: String
    let imageURL: URL?
}

struct ContentView: View {
    
    let categories: Array<String> = [
        "Calm",
        "Sleep",
        "Anxious",
        "Music"
    ]
    //   var card: =  CardData(  title: "Football Game", subTitle: "Tommorrow", minutes:"",  imageURL:"image1")
 
////    var cardArray: Array<CardData> = [card, card2]
    let cardArray: Array<CardData> = Array(
        repeating: CardData(
            title: "first s",
            subTitle: "Description",
            minutes: "10",
            imageURL: URL(string: "https://source.unsplash.com/200x200/?[people]")
        ),
        count: 10
        )
    @State var title: String = "Calm"

    @State private var isToggleOn = true
    var body: some View {
        NavigationStack  {
            VStack {
                
                //MARK: Task 1: Understanding Views and Modifiers
                
    //            Create a SwiftUI View with multiple text and image views using the Text and Image views.
    //            Apply various modifiers such as font, color, padding, and alignment to customize the views.
                HStack{
                    Image(systemName: "menucard.fill")
                    Spacer()
                    Image(systemName: "menucard.fill")
                    Text(title
                    )
                    .font(.system(.largeTitle))
                    .padding(8)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                }
         
                Text("Wlcome Muneera!").font(.system(.largeTitle))
            
                // MARK: Search Box
                HStack {
    //                Image(systemName: "magnifyingglass")
                    Text("How are you feeling today?")
                        .font(.system(.title))
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                    
          
    //            .background(Color.gray.opacity(0),in: RoundedRectangle(cornerRadius: 5, style: RoundedCornerStyle.circular))
                ScrollView(.horizontal){
                    HStack {
                        ForEach(categories, id:
                                    \.self) { category in
                            Button(action: {
    //                        Text(categories[category].description)
                                title = category
                                print(category)
                            }, label: {
                                Text(category)
                            })
                            .padding(.horizontal, 12)
                                .padding(.vertical, 5)
                                .background(Color.gray.opacity(0.5))
                                .cornerRadius(16)
                                .foregroundColor(Color.black)
                            
                        }
                    }}
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
        
                ScrollView{
                    // MARK: Headline Card
                    CardView(data: CardData(
                        title: "Ready to start Your First Session?",
                        subTitle: "",
                        minutes: "20 Minutes",
                        imageURL: URL(string: "https://source.unsplash.com/200x200/?[people]"))).cornerRadius(16)
                        .padding(.horizontal, 3)
                        .padding(.vertical, 5)
                    
                    //GROUP وظيفته يزيد العدد عشان ما يطلع ايرور الفيو يكون اقصى شي ١٠ veiw
                    // MARK: Popular Cards
                    HStack {
                        Text("Meditations").padding(2)
                        Spacer()
                        NavigationLink{
                            //                        print("am clicked")
                            Text("first sessions")
                            
                        } label:{
                            Text("View All >")
                        } .foregroundColor(Color.gray)
                        
                    }
                    ScrollView (.horizontal){
                        HStack (spacing: 10) {
                            
                            ForEach(cardArray) { card in
                                CardView(data: CardData(title: card.title, subTitle: card.subTitle, minutes: card.minutes ,imageURL: card.imageURL))
                                
                                    .frame(width: 100, height: 200)
                                
                            }.cornerRadius(16)
                            Spacer()
                            //
                            
                        }
                        
                        
                    }
              
                    Toggle("Nignt Mode", isOn: $isToggleOn)
                        .preferredColorScheme(isToggleOn ? .dark : .light)
                    
                }
            }
           
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
