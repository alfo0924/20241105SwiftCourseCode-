import SwiftUI

struct ContentView: View {
    // 餐廳資料陣列,使用@State來管理狀態
    @State var restaurants = [ Restaurant(name: "Cafe Deadend", image: "cafedeadend"),
                             Restaurant(name: "Homei", image: "homei"),
                             Restaurant(name: "Teakha", image: "teakha"),
                             Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
                             Restaurant(name: "Petite Oyster", image: "petiteoyster"),
                             Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
                             Restaurant(name: "Po's Atelier", image: "posatelier"),
                             Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
                             Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"),
                             Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
                             Restaurant(name: "Homei", image: "upstate"),
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
    
    // 儲存被選中的餐廳
    @State private var selectedRestaurant: Restaurant?
    // 控制動作表單的顯示狀態
    @State private var showActionSheet = false
    
    var body: some View {
        List {
            // 使用ForEach遍歷餐廳陣列
            ForEach(restaurants) { restaurant in
                BasicImageRow(restaurant: restaurant)
                    // 點擊時觸發動作表單
                    .onTapGesture {
                        self.selectedRestaurant = restaurant
                        self.showActionSheet = true
                    }
            }
            // 啟用滑動刪除功能
            .onDelete { indexSet in
                restaurants.remove(atOffsets: indexSet)
            }
        }
        // 設定動作表單
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("What do you want to do"),
                buttons: [
                    // 收藏按鈕
                    .default(Text("Mark as Favorite")) {
                        if let restaurant = selectedRestaurant,
                           let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                            restaurants[index].isFavorite.toggle()
                        }
                    },
                    // 刪除按鈕
                    .destructive(Text("Delete")) {
                        if let restaurant = selectedRestaurant,
                           let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
                            restaurants.remove(at: index)
                        }
                    },
                    // 取消按鈕
                    .cancel()
                ]
            )
        }
    }
}

// 餐廳資料結構
struct Restaurant: Identifiable {
    var id = UUID() // 唯一識別碼
    var name: String // 餐廳名稱
    var image: String // 圖片名稱
    var isFavorite: Bool = false // 收藏狀態
    var isCheckIn: Bool = false // 打卡狀態
}

// 自定義餐廳列表項目視圖
struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            // 顯示餐廳圖片
            Image(restaurant.image)
                .resizable() // 可調整大小
                .frame(width: 40, height: 40) // 設定圖片大小
                .cornerRadius(5) // 設定圓角
            // 顯示餐廳名稱
            Text(restaurant.name)
        }
    }
}

// 預覽視圖
#Preview {
    ContentView()
}
