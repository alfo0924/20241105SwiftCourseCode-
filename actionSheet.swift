import SwiftUI

struct ContentView: View {
    // 狀態管理
    @State var restaurants = [ Restaurant(name: "Cafe Deadend", chineseName: "死胡同咖啡", image: "cafedeadend"),
                             Restaurant(name: "Homei", chineseName: "好美食府", image: "homei"),
                             Restaurant(name: "Teakha", chineseName: "茶。家", image: "teakha"),
                             Restaurant(name: "Cafe Loisl", chineseName: "洛伊斯咖啡", image: "cafeloisl"),
                             Restaurant(name: "Petite Oyster", chineseName: "小蠔", image: "petiteoyster"),
                             Restaurant(name: "For Kee Restaurant", chineseName: "科記餐廳", image: "forkeerestaurant"),
                             Restaurant(name: "Po's Atelier", chineseName: "波的工作室", image: "posatelier"),
                             Restaurant(name: "Bourke Street Bakery", chineseName: "伯克街麵包店", image: "bourkestreetbakery"),
                             Restaurant(name: "Haigh's Chocolate", chineseName: "海格巧克力", image: "haighschocolate"),
                             Restaurant(name: "Palomino Espresso", chineseName: "帕洛米諾咖啡", image: "palominoespresso"),
                             Restaurant(name: "Homei", chineseName: "好美食府", image: "upstate"),
                             Restaurant(name: "Traif", chineseName: "特拉伊夫", image: "traif"),
                             Restaurant(name: "Graham Avenue Meats And Deli", chineseName: "格雷厄姆大道肉店", image: "grahamavenuemeats"),
                             Restaurant(name: "Waffle & Wolf", chineseName: "窩夫與狼", image: "wafflewolf"),
                             Restaurant(name: "Five Leaves", chineseName: "五葉", image: "fiveleaves"),
                             Restaurant(name: "Cafe Lore", chineseName: "傳說咖啡", image: "cafelore"),
                             Restaurant(name: "Confessional", chineseName: "告解室", image: "confessional"),
                             Restaurant(name: "Barrafina", chineseName: "巴拉菲納", image: "barrafina"),
                             Restaurant(name: "Donostia", chineseName: "多諾斯提亞", image: "donostia"),
                             Restaurant(name: "Royal Oak", chineseName: "皇家橡樹", image: "royaloak"),
                             Restaurant(name: "CASK Pub and Kitchen", chineseName: "卡斯克酒吧廚房", image: "caskpubkitchen")
    ]
    
    @State private var selectedRestaurant: Restaurant?
    @State private var showActionSheet = false
    
    // 使用@AppStorage替代@State來持久化儲存使用者偏好
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isChinese") private var isChinese = false
    
    @Environment(\.colorScheme) var colorScheme
    
    // 儲存收藏狀態的key
    private let favoritesKey = "RestaurantFavorites"
    
    init() {
        // 載入收藏狀態
        if let savedData = UserDefaults.standard.data(forKey: favoritesKey),
           let decodedFavorites = try? JSONDecoder().decode([String: Bool].self, from: savedData) {
            // 更新餐廳的收藏狀態
            _restaurants = State(initialValue: restaurants.map { restaurant in
                var updatedRestaurant = restaurant
                updatedRestaurant.isFavorite = decodedFavorites[restaurant.id.uuidString] ?? false
                return updatedRestaurant
            })
        }
    }
    
    // 儲存收藏狀態的函數
    private func saveFavorites() {
        let favorites = restaurants.reduce(into: [String: Bool]()) { dict, restaurant in
            dict[restaurant.id.uuidString] = restaurant.isFavorite
        }
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    BasicImageRow(restaurant: restaurant, isChinese: isChinese)
                        .onTapGesture {
                            self.selectedRestaurant = restaurant
                            self.showActionSheet = true
                        }
                }
                .onDelete { indexSet in
                    restaurants.remove(atOffsets: indexSet)
                    saveFavorites() // 儲存更新後的狀態
                }
            }
            .navigationTitle(isChinese ? "餐廳列表" : "Restaurants")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            isDarkMode.toggle()
                        }) {
                            Image(systemName: isDarkMode ? "moon.fill" : "moon")
                        }
                        
                        Button(action: {
                            isChinese.toggle()
                        }) {
                            Text(isChinese ? "EN" : "中")
                        }
                    }
                }
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text(isChinese ? "你想要做什麼？" : "What do you want to do"),
                buttons: [
                    .default(Text(isChinese ? "標記為最愛" : "Mark as Favorite")) {
                        if let restaurant = selectedRestaurant,
                           let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                            restaurants[index].isFavorite.toggle()
                            saveFavorites() // 儲存收藏狀態
                        }
                    },
                    .destructive(Text(isChinese ? "刪除" : "Delete")) {
                        if let restaurant = selectedRestaurant,
                           let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                            restaurants.remove(at: index)
                            saveFavorites() // 儲存更新後的狀態
                        }
                    },
                    .cancel(Text(isChinese ? "取消" : "Cancel"))
                ]
            )
        }
    }
}

// Restaurant結構需要符合Codable協議以支援JSON編碼解碼
struct Restaurant: Identifiable, Codable {
    var id = UUID()
    var name: String
    var chineseName: String
    var image: String
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    var isChinese: Bool
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(isChinese ? restaurant.chineseName : restaurant.name)
            if restaurant.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

#Preview {
    ContentView()
}
