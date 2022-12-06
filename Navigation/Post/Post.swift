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

let firstPost = NewPost(author: "Школа ремонта", description: "Современный ремонт в нейтральных тонах с темными элементами", image: "firstPost", likes: 10, views: 38)
let secondPost = NewPost(author: "В мире животных", description: "Очередная фотография с кошькой в этом проекте, но теперь кошька спит", image: "secondPost", likes: 51, views: 74)
let thirdPost = NewPost(author: "В мире животных", description: "Опа, собака, не ожидали, да?", image: "thirdPost", likes: 37, views: 89)
let fourthPost = NewPost(author: "aesthetic pics", description: "Нужно больше подсветки, подсветки никогда не бывает мало!", image: "fourthPost", likes: 22, views: 58)

let postArray: [NewPost] = [firstPost, secondPost, thirdPost, fourthPost]
