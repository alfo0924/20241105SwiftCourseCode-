import SwiftUI

// 建立一個結構來存放多語言文字
struct LocalizedStrings {
    static let restaurants: [String: [String: String]] = [
        "Cafe Deadend": ["en": "Cafe Deadend", "zh": "死胡同咖啡館"],
        "Homei": ["en": "Homei", "zh": "好美餐廳"],
        "Teakha": ["en": "Teakha", "zh": "茶。家"],
        "Cafe Loisl": ["en": "Cafe Loisl", "zh": "露易絲咖啡"],
        "Petite Oyster": ["en": "Petite Oyster", "zh": "小生蠔"],
        "For Kee Restaurant": ["en": "For Kee Restaurant", "zh": "科記餐廳"],
        "Po's Atelier": ["en": "Po's Atelier", "zh": "波的工作室"],
        "Bourke Street Bakery": ["en": "Bourke Street Bakery", "zh": "伯克街麵包店"],
        "Haigh's Chocolate": ["en": "Haigh's Chocolate", "zh": "海格巧克力"],
        "Palomino Espresso": ["en": "Palomino Espresso", "zh": "帕洛米諾咖啡"],
        "Upstate": ["en": "Upstate", "zh": "上州餐廳"],
        "Traif": ["en": "Traif", "zh": "特拉伊夫"],
        "Graham Avenue Meats And Deli": ["en": "Graham Avenue Meats And Deli", "zh": "格雷厄姆大道肉店"],
        "Waffle & Wolf": ["en": "Waffle & Wolf", "zh": "鬆餅與狼"],
        "Five Leaves": ["en": "Five Leaves", "zh": "五葉餐廳"],
        "Cafe Lore": ["en": "Cafe Lore", "zh": "洛爾咖啡"],
        "Confessional": ["en": "Confessional", "zh": "告解餐廳"],
        "Barrafina": ["en": "Barrafina", "zh": "巴拉菲娜"],
        "Donostia": ["en": "Donostia", "zh": "多諾斯提亞"],
        "Royal Oak": ["en": "Royal Oak", "zh": "皇家橡樹"],
        "CASK Pub and Kitchen": ["en": "CASK Pub and Kitchen", "zh": "卡斯克酒館"]
    ]
    
    static let navigationTitle = ["en": "Restaurants", "zh": "餐廳列表"]
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    
    func localizedName(language: String) -> String {
        return LocalizedStrings.restaurants[name]?[language] ?? name
    }
}

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    let language: String
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .cornerRadius(20)
                .padding()
                .shadow(radius: 10)
            
            Text(restaurant.localizedName(language: language))
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("language") private var language = "en"
    
    let restaurants = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
        Restaurant(name: "Homei", image: "homei"),
        Restaurant(name: "Teakha", image: "teakha"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant(name: "Po's Atelier", image: "posatelier"),
        Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
        Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant(name: "Upstate", image: "upstate"),
        Restaurant(name: "Traif", image: "traif"),
        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
        Restaurant(name: "Waffle & Wolf", image: "wafflewolf"),
        Restaurant(name: "Five Leaves", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", image: "cafelore"),
        Restaurant(name: "Confessional", image: "confessional"),
        Restaurant(name: "Barrafina", image: "barrafina"),
        Restaurant(name: "Donostia", image: "donostia"),
        Restaurant(name: "Royal Oak", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        NavigationView {
            List(restaurants) { restaurant in
                NavigationLink(destination: RestaurantDetailView(restaurant: restaurant, language: language)) {
                    HStack {
                        Image(restaurant.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .clipped()
                        
                        Text(restaurant.localizedName(language: language))
                            .font(.system(.body, design: .rounded))
                    }
                    .padding(.vertical, 8)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(LocalizedStrings.navigationTitle[language] ?? "Restaurants")
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            language = language == "en" ? "zh" : "en"
                        }) {
                            Text(language == "en" ? "中文" : "EN")
                                .foregroundColor(.primary)
                                .padding(8)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            isDarkMode.toggle()
                        }) {
                            Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                                .foregroundColor(isDarkMode ? .yellow : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
