import SwiftUI

// 建立一個結構來存放多語言文字
struct LocalizedStrings {
    static let restaurants: [String: [String: [String]]] = [
        "Cafe Deadend": [
            "en": ["Cafe Deadend", "A cozy cafe located at the end of a quiet street", "Opening Hours: 8:00 AM - 10:00 PM", "Price Range: $$$", "Specialty: Coffee and Pastries"],
            "zh": ["死胡同咖啡館", "位於寧靜街道盡頭的溫馨咖啡館", "營業時間：早上8:00 - 晚上10:00", "價位：$$$", "特色：咖啡和糕點"]
        ],
        "Homei": [
            "en": ["Homei", "Traditional Asian cuisine with modern twist", "Opening Hours: 11:00 AM - 9:00 PM", "Price Range: $$", "Specialty: Dim Sum"],
            "zh": ["好美餐廳", "具有現代風味的傳統亞洲料理", "營業時間：早上11:00 - 晚上9:00", "價位：$$", "特色：點心"]
        ],
        "Teakha": [
            "en": ["Teakha", "Artisanal tea house with Asian influences", "Opening Hours: 10:00 AM - 7:00 PM", "Price Range: $$", "Specialty: Artisanal Tea"],
            "zh": ["茶。家", "具有亞洲特色的手工茶館", "營業時間：早上10:00 - 晚上7:00", "價位：$$", "特色：手工茶"]
        ],
        "Cafe Loisl": [
            "en": ["Cafe Loisl", "Classic European cafe experience", "Opening Hours: 9:00 AM - 8:00 PM", "Price Range: $$", "Specialty: European Pastries"],
            "zh": ["露易絲咖啡", "經典歐式咖啡體驗", "營業時間：早上9:00 - 晚上8:00", "價位：$$", "特色：歐式糕點"]
        ],
        "Petite Oyster": [
            "en": ["Petite Oyster", "Fresh seafood and oyster bar", "Opening Hours: 12:00 PM - 11:00 PM", "Price Range: $$$", "Specialty: Fresh Oysters"],
            "zh": ["小生蠔", "新鮮海鮮和生蠔吧", "營業時間：中午12:00 - 晚上11:00", "價位：$$$", "特色：新鮮生蠔"]
        ],
        "For Kee Restaurant": [
            "en": ["For Kee Restaurant", "Traditional Hong Kong cuisine", "Opening Hours: 7:00 AM - 9:00 PM", "Price Range: $", "Specialty: Local Dishes"],
            "zh": ["科記餐廳", "傳統港式美食", "營業時間：早上7:00 - 晚上9:00", "價位：$", "特色：地道菜式"]
        ],
        "Po's Atelier": [
            "en": ["Po's Atelier", "Artisanal bakery and cafe", "Opening Hours: 8:00 AM - 6:00 PM", "Price Range: $$", "Specialty: Artisan Bread"],
            "zh": ["波的工作室", "手工麵包咖啡館", "營業時間：早上8:00 - 晚上6:00", "價位：$$", "特色：手工麵包"]
        ],
        "Bourke Street Bakery": [
            "en": ["Bourke Street Bakery", "Australian style bakery", "Opening Hours: 7:00 AM - 5:00 PM", "Price Range: $$", "Specialty: Sourdough Bread"],
            "zh": ["伯克街麵包店", "澳式麵包店", "營業時間：早上7:00 - 下午5:00", "價位：$$", "特色：酸種麵包"]
        ],
        "Haigh's Chocolate": [
            "en": ["Haigh's Chocolate", "Premium chocolate shop", "Opening Hours: 10:00 AM - 7:00 PM", "Price Range: $$$", "Specialty: Handmade Chocolates"],
            "zh": ["海格巧克力", "高級巧克力專門店", "營業時間：早上10:00 - 晚上7:00", "價位：$$$", "特色：手工巧克力"]
        ],
        "Palomino Espresso": [
            "en": ["Palomino Espresso", "Specialty coffee shop", "Opening Hours: 7:00 AM - 4:00 PM", "Price Range: $$", "Specialty: Single Origin Coffee"],
            "zh": ["帕洛米諾咖啡", "特色咖啡店", "營業時間：早上7:00 - 下午4:00", "價位：$$", "特色：單品咖啡"]
        ],
        "Upstate": [
            "en": ["Upstate", "Modern American cuisine", "Opening Hours: 5:00 PM - 11:00 PM", "Price Range: $$$", "Specialty: Seafood"],
            "zh": ["上州餐廳", "現代美式料理", "營業時間：下午5:00 - 晚上11:00", "價位：$$$", "特色：海鮮"]
        ],
        "Traif": [
            "en": ["Traif", "Creative fusion cuisine", "Opening Hours: 6:00 PM - 12:00 AM", "Price Range: $$$", "Specialty: Fusion Dishes"],
            "zh": ["特拉伊夫", "創意融合料理", "營業時間：晚上6:00 - 凌晨12:00", "價位：$$$", "特色：融合菜式"]
        ],
        "Graham Avenue Meats And Deli": [
            "en": ["Graham Avenue Meats And Deli", "Classic New York deli", "Opening Hours: 8:00 AM - 6:00 PM", "Price Range: $$", "Specialty: Sandwiches"],
            "zh": ["格雷厄姆大道肉店", "經典紐約熟食店", "營業時間：早上8:00 - 晚上6:00", "價位：$$", "特色：三明治"]
        ],
        "Waffle & Wolf": [
            "en": ["Waffle & Wolf", "Gourmet waffle house", "Opening Hours: 8:00 AM - 8:00 PM", "Price Range: $$", "Specialty: Creative Waffles"],
            "zh": ["鬆餅與狼", "美食鬆餅屋", "營業時間：早上8:00 - 晚上8:00", "價位：$$", "特色：創意鬆餅"]
        ],
        "Five Leaves": [
            "en": ["Five Leaves", "Modern Australian cuisine", "Opening Hours: 8:00 AM - 1:00 AM", "Price Range: $$$", "Specialty: Brunch"],
            "zh": ["五葉餐廳", "現代澳式料理", "營業時間：早上8:00 - 凌晨1:00", "價位：$$$", "特色：早午餐"]
        ],
        "Cafe Lore": [
            "en": ["Cafe Lore", "Storytelling cafe experience", "Opening Hours: 9:00 AM - 9:00 PM", "Price Range: $$", "Specialty: Theme Drinks"],
            "zh": ["洛爾咖啡", "故事主題咖啡體驗", "營業時間：早上9:00 - 晚上9:00", "價位：$$", "特色：主題飲品"]
        ],
        "Confessional": [
            "en": ["Confessional", "Speakeasy cocktail bar", "Opening Hours: 6:00 PM - 2:00 AM", "Price Range: $$$", "Specialty: Craft Cocktails"],
            "zh": ["告解餐廳", "復古雞尾酒吧", "營業時間：晚上6:00 - 凌晨2:00", "價位：$$$", "特色：手工雞尾酒"]
        ],
        "Barrafina": [
            "en": ["Barrafina", "Spanish tapas bar", "Opening Hours: 12:00 PM - 11:00 PM", "Price Range: $$$", "Specialty: Tapas"],
            "zh": ["巴拉菲娜", "西班牙小食酒吧", "營業時間：中午12:00 - 晚上11:00", "價位：$$$", "特色：塔帕斯"]
        ],
        "Donostia": [
            "en": ["Donostia", "Basque cuisine", "Opening Hours: 11:30 AM - 10:00 PM", "Price Range: $$$", "Specialty: Pintxos"],
            "zh": ["多諾斯提亞", "巴斯克料理", "營業時間：上午11:30 - 晚上10:00", "價位：$$$", "特色：品嘗小食"]
        ],
        "Royal Oak": [
            "en": ["Royal Oak", "Traditional British pub", "Opening Hours: 11:00 AM - 12:00 AM", "Price Range: $$", "Specialty: Pub Food"],
            "zh": ["皇家橡樹", "傳統英式酒吧", "營業時間：上午11:00 - 凌晨12:00", "價位：$$", "特色：酒吧美食"]
        ],
        "CASK Pub and Kitchen": [
            "en": ["CASK Pub and Kitchen", "Craft beer and gastropub", "Opening Hours: 12:00 PM - 11:00 PM", "Price Range: $$", "Specialty: Craft Beer"],
            "zh": ["卡斯克酒館", "精釀啤酒美食酒吧", "營業時間：中午12:00 - 晚上11:00", "價位：$$", "特色：精釀啤酒"]
        ]
    ]
    
    static let navigationTitle = ["en": "Restaurants", "zh": "餐廳列表"]
    static let detailsSection = ["en": "Restaurant Details", "zh": "餐廳詳情"]
}
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    
    func localizedContent(language: String) -> [String] {
        return LocalizedStrings.restaurants[name]?[language] ?? []
    }
}

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    let language: String
    @State private var isFavorite = false
    @State private var showingReservation = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // 圖片區域
                Image(restaurant.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding()
                
                // 內容區域
                VStack(alignment: .leading, spacing: 15) {
                    // 標題和收藏按鈕
                    HStack {
                        Text(restaurant.localizedContent(language: language)[0])
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button(action: {
                            isFavorite.toggle()
                        }) {
                            Image(systemName: isFavorite ? "heart.fill" : "heart")
                                .foregroundColor(isFavorite ? .red : .gray)
                                .font(.title2)
                        }
                    }
                    
                    // 分隔線
                    Divider()
                    
                    // 描述
                    Text(restaurant.localizedContent(language: language)[1])
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 4)
                    
                    // 詳細資訊卡片
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(2..<restaurant.localizedContent(language: language).count, id: \.self) { index in
                            HStack {
                                Image(systemName: getSystemImage(for: index))
                                    .foregroundColor(.blue)
                                Text(restaurant.localizedContent(language: language)[index])
                            }
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    // 地圖預覽
                    VStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(height: 150)
                            .cornerRadius(10)
                            .overlay(
                                Image(systemName: "map")
                                    .font(.largeTitle)
                                    .foregroundColor(.gray)
                            )
                        
                        Text(language == "en" ? "Location Map" : "位置地圖")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    // 預訂按鈕
                    Button(action: {
                        showingReservation = true
                    }) {
                        HStack {
                            Image(systemName: "calendar.badge.plus")
                            Text(language == "en" ? "Make Reservation" : "預訂座位")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingReservation) {
            Alert(
                title: Text(language == "en" ? "Reservation" : "預訂"),
                message: Text(language == "en" ? "Booking feature coming soon!" : "預訂功能即將推出！"),
                dismissButton: .default(Text(language == "en" ? "OK" : "確定"))
            )
        }
    }
    
    private func getSystemImage(for index: Int) -> String {
        switch index {
        case 2: return "clock"
        case 3: return "dollarsign.circle"
        case 4: return "star"
        default: return "info.circle"
        }
    }
}

struct ContentView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("language") private var language = "en"
    @State private var searchText = ""
    
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
    
    var filteredRestaurants: [Restaurant] {
        if searchText.isEmpty {
            return restaurants
        } else {
            return restaurants.filter { restaurant in
                restaurant.localizedContent(language: language)[0]
                    .localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // 搜尋欄
                SearchBar(text: $searchText, language: language)
                
                List(filteredRestaurants) { restaurant in
                    NavigationLink(destination: RestaurantDetailView(restaurant: restaurant, language: language)) {
                        HStack {
                            Image(restaurant.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .cornerRadius(10)
                                .clipped()
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.localizedContent(language: language)[0])
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.medium)
                                
                                Text(restaurant.localizedContent(language: language)[1])
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(1)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .listStyle(PlainListStyle())
            }
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

struct SearchBar: View {
    @Binding var text: String
    let language: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField(language == "en" ? "Search restaurants..." : "搜尋餐廳...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
