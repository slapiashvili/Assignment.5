import UIKit

//EXERCISE #1

enum DaysOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    func typeOfDay() -> String {
        if self == .saturday {
            return "It's a weekend!"
        } else if self == .sunday {
            return "It's a weekend"
        } else {
            return "It's a weekday!"
        }
    }
}

let today = DaysOfWeek.monday
let result = today.typeOfDay()
print(result)

//We have defined an enum with days of weeks. We have then come up with a method to sort those cases into weekends and weekdays. We used if else statement for that. at the very end, we created a variable called today and assigned an instance from the enum to that variable. Then, we called the function for that very same instance (monday).

//EXERCISE #2

enum Weather {
    case sunny (temperature: Int)
    case cloudy (temperature: Int)
    case rainy (temperature: Int)
    case snowy (temperature: Int)
    
}

func weatherAdvice(when weather: Weather) -> String {
    switch weather {
    case.sunny(let temperature):
        return "It's sunny, with \(temperature) degrees outside. Wear something light and don't forget your sunscreen!"
    case.cloudy(let temperature):
        return "It's cloudy, with \(temperature) degrees outside. Bringing a jacket might be a good idea!"
    case.rainy(let temperature):
        return "It's raining, with \(temperature) degrees outside. You might want to bring an umbrella!"
    case.snowy(let temperature):
        return "the earth is coated with snow, with \(temperature) degrees outside. You might want to bring a coat too!"
    }
}

let may4thWeather = Weather.sunny(temperature: 30)
var displayWeather = weatherAdvice(when: may4thWeather)
print(displayWeather)

//first we defined an enum with associated values of Int type. Then we came up with a function that utilizes a switch to cover all the cases. Eventually, we tested the code with an instance of may4thWeather. Eventually, we run the function for that day to see what needs to be displayed.

//EXERCISE #3

struct Book {
    var originalTitle: String
    var author: String
    var publicationYear: Int
}

var georgianBooks: [Book] = []

let book0 = Book(originalTitle: "Vepkhistkaosani", author: "Shota Rustaveli", publicationYear: 1712)
let book1 = Book(originalTitle: "Didostatis Marjvena", author: "Konstantine Gamsakhurdia", publicationYear: 1939)
let book2 = Book(originalTitle: "Samoseli Pirveli", author: "Guram Dochanashvili", publicationYear: 1975)
let book3 = Book(originalTitle: "Igi", author: "Jemal Karchkhadze", publicationYear: 1977)

georgianBooks.append(book0)
georgianBooks.append(book1)
georgianBooks.append(book2)
georgianBooks.append(book3)

func filterBooksByYear(for books: [Book], by year: Int) -> [Book] {
    let filteredBooks = books.filter { $0.publicationYear > year }
    return filteredBooks
}

let filteredBooks = filterBooksByYear(for: georgianBooks, by: 1900)
for book in filteredBooks {
    print("Title: \(book.originalTitle), Author: \(book.author), Year of Publication: \(book.publicationYear)")
}

//first we came up with a stuct with properties. then we made an array and have appeneded a few books into it. Then we came up with a function that filters out the books published after a certain year. then we came up with an instance, in which we only print the books published after 1900.


//EXERCISE #4

struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double
    
    mutating func depositMoney(adding amount: Double) {
        if amount <= 0 {
            print("Please choose a valid deposit amount")
        } else {
            balance += amount
            print("You have just deposited GEL \(amount) to your account. Current balance: \(balance)")
        }
    }
    
    mutating func withdrawMoney(withdrawing amount: Double) {
        if amount <= 0 {
            print("Please choose a valid withdraw amount")
        } else if amount > balance {
            print("Insufficient funds")
        } else {
            balance -= amount
            print("You have just withdrawn GEL \(amount) from your account. Current balance: \(balance)")
        }
    }
}


var salomesAccount = BankAccount(holderName: "Salome Lapiashvili", accountNumber: "AB099982", balance: 500)

salomesAccount.depositMoney(adding: 0)
salomesAccount.depositMoney(adding: 10)
salomesAccount.withdrawMoney(withdrawing: 10000)
salomesAccount.withdrawMoney(withdrawing: 10)

//we came up with struct with certain parameters and added two methods: mutating functions that chance the property balance accordingly if needed. We made sure that all possible cases were covered using if else statements.

//EXERCISE #5

enum Genre {
    case rock
    case jazz
    case pop
    case rap
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    
    lazy var publisher: String = {
        switch genre {
        case .rock:
            return "ABC"
        case .jazz:
            return "DEF"
        case .pop:
            return "GHI"
        case .rap:
            return "JKL"
        }
    }()
    
    var description: String {
        return "\(title) is a \(genre) song by \(artist)"
    }
}

var playlist: [Song] = []

var song0 = Song(title: "High Hopes", artist: "Pink Floyd", duration: 7.49, genre: .rock)
var song1 = Song(title: "Schism", artist: "TOOL", duration: 7.27, genre: .rock, publisher: "ABC")
var song2 = Song(title: "Gloomy Sunday", artist: "Billie Holiday", duration: 3.12, genre: .jazz)

playlist.append(song0)
playlist.append(song1)
playlist.append(song2)

func filterGenres (from songs: [Song], by genre: Genre) -> [Song] {
    var filteredSongs = songs.filter { $0.genre == genre}
    return filteredSongs
}

var filteredPlaylist = filterGenres(from: playlist, by: .rock)
for song in filteredPlaylist {
    print(song.title)
}

//we have an enum Genre and a structure in which we define different properties. We have a function that takes an array and a genre and gives out a filtered array with only songs of that very genre.
