<a href="link https://drive.google.com/drive/folders/1WLpgHL1t_AIcz7x77nh07r_rn2blvPVA?usp=drive_link
">proj link </a>
## contentView2.swift 核心數據結構

**LocalizedStrings 結構**
- 用於管理多語言內容的靜態字典
- 每個餐廳包含英文("en")和中文("zh")兩種語言的資訊
- 每個餐廳的資訊包含：名稱、描述、營業時間、價格範圍和特色

**Restaurant 結構**
- 遵循 Identifiable 協議，確保每個餐廳有唯一識別符
- 包含基本屬性：id、name 和 image
- 提供 localizedContent 方法用於獲取指定語言的餐廳資訊

## 主要視圖組件

**RestaurantDetailView**
- 顯示單個餐廳的詳細資訊
- 包含：
  - 餐廳圖片（支援圓角和陰影效果）
  - 餐廳名稱和收藏按鈕
  - 詳細描述
  - 營業資訊（使用圖標展示）
  - 地圖預覽區域（目前為佔位）
  - 預訂按鈕

**ContentView**
- 應用程式的主視圖
- 功能包括：
  - 支援深色/淺色模式切換
  - 語言切換（英文/中文）
  - 餐廳列表顯示
  - 搜尋功能

**SearchBar**
- 自定義搜尋欄組件
- 支援多語言提示文字
- 包含清除搜尋內容的功能

## 特色功能

**多語言支援**
- 使用 @AppStorage 持久化存儲語言設置
- 所有界面元素支援中英文切換
- 包含導航標題、按鈕文字等的本地化

**搜尋功能**
- 即時過濾餐廳列表
- 支援當前語言的搜尋
- 使用 localizedCaseInsensitiveContains 進行不區分大小寫的搜尋

**深色模式**
- 支援系統深色/淺色模式切換
- 使用 @AppStorage 記住用戶偏好
- 提供直觀的切換按鈕

**餐廳詳情**
- 提供完整的餐廳資訊展示
- 支援收藏功能
- 包含預訂功能（目前為示意）
- 使用圖標增強視覺效果

## 使用者介面設計

**列表視圖**
- 使用 NavigationView 提供導航功能
- 每個餐廳項目包含縮略圖和簡要信息
- 支援點擊導航到詳細頁面

**詳情頁面**
- 使用 ScrollView 支援內容滾動
- 清晰的視覺層次
- 互動元素（收藏、預訂）
- 資訊卡片式設計

這個應用程式展示了 SwiftUI 的多項重要特性，包括：
- 狀態管理（@State, @AppStorage）
- 導航系統
- 列表處理
- 多語言支援
- 深色模式
- 自定義組件
- 響應式設計


