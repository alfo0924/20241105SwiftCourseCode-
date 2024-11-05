import SwiftUI

struct ContentView: View {
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
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("isChinese") private var isChinese = false
    
    // 儲存狀態的key
    private let favoritesKey = "RestaurantFavorites"
    private let checkInsKey = "RestaurantCheckIns"
    
    // 初始化時載入儲存的狀態
    init() {
        loadSavedStates()
    }
    
    // 載入儲存的狀態
    private func loadSavedStates() {
        if let savedFavorites = UserDefaults.standard.dictionary(forKey: favoritesKey) as? [String: Bool],
           let savedCheckIns = UserDefaults.standard.dictionary(forKey: checkInsKey) as? [String: Bool] {
            _restaurants = State(initialValue: restaurants.map { restaurant in
                var updatedRestaurant = restaurant
                updatedRestaurant.isFavorite = savedFavorites[restaurant.name] ?? false
                updatedRestaurant.isCheckIn = savedCheckIns[restaurant.name] ?? false
                return updatedRestaurant
            })
        }
    }
    
    // 儲存狀態
    private func saveStates() {
        let favorites = restaurants.reduce(into: [String: Bool]()) { dict, restaurant in
            dict[restaurant.name] = restaurant.isFavorite
        }
        let checkIns = restaurants.reduce(into: [String: Bool]()) { dict, restaurant in
            dict[restaurant.name] = restaurant.isCheckIn
        }
        
        UserDefaults.standard.set(favorites, forKey: favoritesKey)
        UserDefaults.standard.set(checkIns, forKey: checkInsKey)
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
                        .contextMenu {
                            Button {
                                if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                                    restaurants[index].isCheckIn.toggle()
                                    saveStates()
                                }
                            } label: {
                                HStack {
                                    Text(isChinese ? "打卡" : "Check-in")
                                    Image(systemName: "checkmark.seal.fill")
                                }
                            }
                            
                            Button {
                                if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                                    restaurants[index].isFavorite.toggle()
                                    saveStates()
                                }
                            } label: {
                                HStack {
                                    Text(isChinese ? "收藏" : "Favorite")
                                    Image(systemName: "star")
                                }
                            }
                            
                            Button {
                                if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                                    restaurants.remove(at: index)
                                    saveStates()
                                }
                            } label: {
                                HStack {
                                    Text(isChinese ? "刪除" : "Delete")
                                        .foregroundColor(.red)
                                    Image(systemName: "trash")
                                }
                            }
                        }
                }
                .onDelete { indexSet in
                    restaurants.remove(atOffsets: indexSet)
                    saveStates()
                }
            }
            .navigationBarTitle(isChinese ? "餐廳列表" : "Restaurants")
            .navigationBarItems(trailing: HStack {
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
            })
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text(isChinese ? "你想要做什麼？" : "What do you want to do"),
                message: nil,
                buttons: [
                    .default(Text(isChinese ? "打卡" : "Check-in")) {
                        if let restaurant = selectedRestaurant,
                           let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                            restaurants[index].isCheckIn.toggle()
                            saveStates()
                        }
                    },
                    .default(Text(isChinese ? "收藏" : "Favorite")) {
                        if let restaurant = selectedRestaurant,
                           let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                            restaurants[index].isFavorite.toggle()
                            saveStates()
                        }
                    },
                    .destructive(Text(isChinese ? "刪除" : "Delete")) {
                        if let restaurant = selectedRestaurant,
                           let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                            restaurants.remove(at: index)
                            saveStates()
                        }
                    },
                    .cancel(Text(isChinese ? "取消" : "Cancel"))
                ]
            )
        }
    }
}

struct Restaurant: Identifiable {
    let id = UUID()
    var name: String
    var chineseName: String
    var image: String
    var isFavorite: Bool = false
    var isCheckIn: Bool = false
}

struct BasicImageRow: View {
    let restaurant: Restaurant
    let isChinese: Bool
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(isChinese ? restaurant.chineseName : restaurant.name)
            Spacer()
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
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
