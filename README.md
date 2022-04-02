# Photobase

### Application
Пример приложения для просмотра фотографий (за основу взят Instagramm).

*PS: Приложение реализованно для проработки переходов между экранами, функционалом TableView, CollectionView, NavigationController, TabBarController, Alert, ModelController,
построение UI через Storyboard, также отдельные экраны сделаны только с помощью кода и т.д.*

### Preview App
<img src="https://github.com/VitKhryapin/Photobase/blob/main/PhotoChat/Preview/0.png" width="150"> <img src="https://github.com/VitKhryapin/Photobase/blob/main/PhotoChat/Preview/1.png" width="150"> <img src="https://github.com/VitKhryapin/Photobase/blob/main/PhotoChat/Preview/3.png" width="150"> <img src="https://github.com/VitKhryapin/Photobase/blob/main/PhotoChat/Preview/4.png" width="150">  <img src="https://github.com/VitKhryapin/Photobase/blob/main/PhotoChat/Preview/4.png" width="150"> <img src="https://github.com/VitKhryapin/Photobase/blob/main/PhotoChat/Preview/5.png" width="150">  <img src="https://github.com/VitKhryapin/Photobase/blob/main/PhotoChat/Preview/6.png" width="150"> 

### Functionality
+ 1ый экран. Реализована лента заранее подготовленных пользователей и их фотографий в виде CollectionView и TableView. 
Есть возможность переходить на отдельные профили и просмотра всех фотографий пользователя которым можно делиться и просматривать. 
Также при переходите на основной профиль есть возможность изменить имя пользователя в ModelProfile и заменить его во всех контроллерах.
+ 2ой экран. Реализована функция просмотра всех фотографий всех пользователей и переход на отдельный экран для полноэкранного просмотра с возможность поделиться или сохранить.
+ 3ий экран. Реализован поиск фотографий через API Unsplash с подключением сторонней библиотеки SDWEBImage. 
Где можно выбрать фотографии которые можно сохранить и поделиться. Также выбранные фотографии добавляются в массив и выводятся на 4 экране.
+ 4ый экран. Добавляются понравившиеся фотографии которые в последствии можно выбрать, удалить, сохранить, поделиться.
+ 5ый экран. Профиль. Выполняется переход через TabBar на основной профиль на котором можно изменить имя, 
также осуществляется переход из CollectionView экрана историй на профиль отдельных User c просмотром их публикаций.



### Stack
+ Swift.
+ UIKit.
+ SDWEBImage
+ ModelController.
+ Storyboards.
+ Auto Layout.
+ Trait collections.
+ URLSession.
+ Codable.
+ Repository pattern.
+ API Unsplash.
+ MVC.

