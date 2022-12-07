struct Post {
    var title: String
}

struct NewPost {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let firstPost = NewPost(author: "Школа ремонта", description: "Современный ремонт в нейтральных тонах с темными элементами. Отлично подойдет для квартир среднего размера с совмещенными гостинной и кухней", image: "firstPost", likes: 10, views: 38)
let secondPost = NewPost(author: "В мире животных", description: "Очередная фотография с кошькой в этом проекте, но теперь кошька спит. Ну только посмотрите какая грация, красота, великолепие. В ней еще есть куча ласки и тонна хитрости, но она сейчас спит, так что это незаметно", image: "secondPost", likes: 51, views: 74)
let thirdPost = NewPost(author: "В мире животных", description: "Опа, собака, не ожидали, да? Это Бублик, но если бы я мог переименовать его, то назвал бы Дурилой. Ну а как еще назвать собаку, которая из всех полезных навыков усвоила только то, как перегрызть игрушечной курице пищалку в горле так, чтобы она больше не пищала. Никогда не пищала...", image: "thirdPost", likes: 37, views: 89)
let fourthPost = NewPost(author: "aesthetic pics", description: "Нужно больше подсветки, подсветки никогда не бывает мало! Я хотел навернуть RGB-лент под подоконник, но это оказалось невозможным по определенным причинам. До сих пор грустно, но что поделать(", image: "fourthPost", likes: 22, views: 58)

var postArray: [NewPost] = [firstPost, secondPost, thirdPost, fourthPost]
