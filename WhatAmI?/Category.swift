//
//  Category.swift
//  WhatAmI?
//
//  Created by itkhld on 30.01.2025.
//
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    
    init(name: String, imageName: String, description: String) {
        self.name = name
        self.imageName = imageName
        self.description = description
    }
}


let categories: [Category] = [
    Category(name: "Your Category", imageName: "usercategory", description: "Everything under the sun"),
    Category(name: "Food", imageName: "food", description: "From everyday favorites to exotic dishes"),
    Category(name: "Sport", imageName: "sport", description: "From legendary athletes to iconic games"),
    Category(name: "Country", imageName: "country", description: "From famous landmarks to rich cultures"),
    Category(name: "Singer", imageName: "singer", description: "From pop sensations and rappers to rock legends"),
    Category(name: "Movies", imageName: "movie", description: "From Hollywood blockbusters to cinematic masterpieces")
]


let categoryWords: [String: [String]] = [
    "Food": [
        "Pizza", "Burger", "Sushi", "Pasta", "Salad", "Steak", "Tacos", "Ramen", "Pancakes", "Curry",
        "Donut", "Falafel", "Lasagna", "DimSum", "Burrito", "Croissant", "Cheesecake", "Hotdog", "Paella", "Waffles",
        "Muffin", "Sandwich", "Baguette", "Noodles", "FriedRice", "IceCream", "Chocolate", "ApplePie", "MisoSoup", "Shrimp",
        "BBQRibs", "Dumplings", "MacAndCheese", "ChowMein", "Pita", "Tortilla", "Goulash", "PekingDuck", "ClamChowder", "Pho",
        "Omelette", "Bagel", "Samosa", "Churros", "Tiramisu", "Moussaka", "Sashimi", "Porridge", "Lobster", "Hummus",
        "Kebab", "PecanPie", "Gazpacho", "Scone", "Meatballs", "ShepherdsPie", "Pavlova", "PorkBelly", "Ceviche", "Gnocchi",
        "Cornbread", "Bruschetta", "Gumbo", "Fajitas", "Biryani", "BeefStew", "PekingSoup", "MangoStickyRice", "Tempura", "Gingerbread",
        "Jambalaya", "Frittata", "Coleslaw", "ChickenWings", "SpringRolls", "StuffedPeppers", "CabbageRolls", "FishTacos", "Ratatouille", "PannaCotta",
        "Sauerbraten", "Katsu", "Meringue", "BangersAndMash", "Polenta", "Crepes", "Haggis", "ClottedCream", "Mochi", "Babka",
        "Arepas", "Empanadas", "Tamales", "PastelDeNata", "Borscht", "Couscous", "JollofRice", "Shakshuka", "Pierogi", "GadoGado"
    ],
    
    "Sport": [
        "Football", "Basketball", "Tennis", "Cricket", "Running", "Baseball", "Golf", "Boxing", "Wrestling", "Hockey",
        "Rugby", "Cycling", "Swimming", "Badminton", "Skiing", "Surfing", "Archery", "Fencing", "Karate", "Darts",
        "Volleyball", "Snowboarding", "TableTennis", "Athletics", "Rowing", "Handball", "IceSkating", "Bobsledding", "PoleVault", "Gymnastics",
        "Judo", "Taekwondo", "Triathlon", "Shooting", "Weightlifting", "Equestrian", "Dodgeball", "Parkour", "BMX", "Lacrosse",
        "Bowling", "Snooker", "Kickboxing", "Squash", "Kayaking", "Motocross", "Paragliding", "Climbing", "Freediving", "SepakTakraw",
        "Softball", "Chess", "E-Sports", "Billiards", "Racquetball", "DragonBoat", "SpeedSkating", "Zorbing",
        "Canoeing", "CricketT20", "RollerDerby", "NordicSkiing", "Kitesurfing", "Caving", "Futsal", "HandCycling", "GaelicFootball", "BullRiding",
        "BaseJumping", "Curling", "Sandboarding", "WaterPolo", "MuayThai", "ArmWrestling", "SledgeHockey", "TugOfWar", "Orienteering", "Padel",
        "RockClimbing", "Powerlifting", "ParkSkating", "Tetherball", "FellRunning", "Speedway", "LogRolling", "ExtremeIroning", "StreetLuge", "Fencing"
    ],
    
    "Country": [
        "Italy", "France", "Brazil", "USA", "Germany", "Canada", "Japan", "Australia", "India", "China",
        "Mexico", "Russia", "Spain", "Argentina", "Egypt", "Sweden", "Norway", "SouthKorea", "Portugal", "Greece",
        "Turkey", "SouthAfrica", "Netherlands", "Switzerland", "Thailand", "Indonesia", "Colombia", "Vietnam", "Philippines", "Malaysia",
        "Singapore", "Denmark", "NewZealand", "Poland", "SaudiArabia", "Iran", "Ireland", "Chile", "Pakistan", "Belgium",
        "CzechRepublic", "UAE", "Austria", "Hungary", "Israel", "Peru", "Ukraine", "Romania", "Qatar", "Bangladesh",
        "Finland", "Morocco", "Slovakia", "Serbia", "Tunisia", "Ecuador", "Kazakhstan", "Croatia", "SriLanka", "Lithuania",
        "Slovenia", "Lebanon", "Oman", "Bulgaria", "Jordan", "Estonia", "Panama", "Latvia", "CostaRica", "Cyprus",
        "Uruguay", "Venezuela", "Azerbaijan", "Iceland", "Bahrain", "Algeria", "Luxembourg", "Georgia", "Armenia", "Myanmar",
        "Paraguay", "Malta", "Nepal", "Moldova", "Bosnia", "Belarus", "Macedonia", "Kuwait", "ElSalvador", "Fiji", "Afghanistan"
    ],
    
    "Singer": [
        "ElvisPresley", "FreddieMercury", "WhitneyHouston", "MichaelJackson", "Adele", "Beyonce", "EdSheeran", "LadyGaga", "BrunoMars", "TaylorSwift",
        "JustinBieber", "ArianaGrande", "BillieEilish", "FrankSinatra", "Madonna", "BobMarley", "CelineDion", "JohnLennon", "Shakira", "Rihanna",
        "DuaLipa", "SelenaGomez", "Eminem", "Drake", "KatyPerry", "ChrisBrown", "TheWeeknd", "PostMalone", "SamSmith", "HarryStyles",
        "PaulMcCartney", "StevieWonder", "DollyParton", "Prince", "MariahCarey", "SnoopDogg", "EltonJohn", "ShawnMendes", "TravisScott", "DojaCat",
        "JenniferLopez", "AvrilLavigne", "LilNasX", "CarlyRaeJepsen", "BritneySpears", "KellyClarkson", "JamesBrown", "BBKing", "Usher", "Brandy",
        "NorahJones", "BillyJoel", "AndreaBocelli", "GarthBrooks", "AmyWinehouse", "BarryWhite", "LutherVandross", "JimiHendrix", "JohnnyCash", "MichaelBuble",
        "TaylorHicks", "DavidBowie", "MileyCyrus", "JonBonJovi", "ChrisStapleton", "KeithUrban", "LanaDelRey", "ZaynMalik", "TinaTurner", "OliviaRodrigo",
        "EdithPiaf", "KennyRogers", "PatsyCline", "Halsey", "RodStewart", "VanMorrison", "Pitbull", "Blackpink", "BTS", "LuisFonsi"
    ],
    
    "Movies": [
        "Inception", "Titanic", "Avatar", "Joker", "Interstellar", "Gladiator", "TheGodfather", "HarryPotter", "Frozen", "Avengers",
        "TheDarkKnight", "ForrestGump", "Parasite", "TheShining", "StarWars", "TheMatrix", "JurassicPark", "TheLionKing", "BlackPanther", "Spiderman",
        "IronMan", "TheShawshankRedemption", "TheDeparted", "TheGreenMile", "TheSilenceOfTheLambs", "SavingPrivateRyan", "SchindlersList", "Casablanca", "PulpFiction", "Goodfellas",
        "TheWolfOfWallStreet", "TheGrandBudapestHotel", "DjangoUnchained", "TheIrishman", "LaLaLand", "Whiplash", "AStarIsBorn", "TheRevenant", "MadMax", "It",
        "DoctorStrange", "ThorRagnarok", "GuardiansOfTheGalaxy", "CaptainMarvel", "XMen", "Deadpool", "TheHungerGames", "Twilight", "FantasticBeasts", "Dune",
        "TheConjuring", "Hereditary", "AQuietPlace", "Us", "Saw", "Insidious", "Halloween", "TheExorcist", "Scream", "ItFollows",
        "Coco", "ToyStory", "Up", "Ratatouille", "FindingNemo", "Shrek", "KungFuPanda", "HowToTrainYourDragon", "TheLegoMovie", "InsideOut",
        "TheTrumanShow", "ThePrestige", "TheGreatGatsby", "BladeRunner", "TheHatefulEight", "Memento", "Se7en", "Prisoners", "GoneGirl", "KnivesOut",
        "BohemianRhapsody", "Rocketman", "LesMiserables", "Chicago", "TheSoundOfMusic", "WestSideStory", "MoulinRouge", "SingStreet", "LaDolceVita", "CitizenKane"
    ]
]

