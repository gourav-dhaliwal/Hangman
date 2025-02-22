import UIKit

class ViewController: UIViewController {
    // Existing IBOutlets remain unchanged
    @IBOutlet weak var hangManImage: UIImageView!
    
    @IBOutlet weak var m: UIButton!
    @IBOutlet weak var n: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var v: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var x: UIButton!
    @IBOutlet weak var z: UIButton!
    @IBOutlet weak var l: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var s: UIButton!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var o: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var u: UIButton!
    @IBOutlet weak var y: UIButton!
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var w: UIButton!
    @IBOutlet weak var q: UIButton!
    @IBOutlet weak var row3: UIStackView!
    @IBOutlet weak var row2: UIStackView!
    @IBOutlet weak var row1: UIStackView!
    @IBOutlet weak var lossesCount: UILabel!
    @IBOutlet weak var winsCount: UILabel!
    @IBOutlet weak var seventhLetterOfWord: UILabel!
    @IBOutlet weak var SixthLetterOfWord: UILabel!
    @IBOutlet weak var fifthLetterOfWord: UILabel!
    @IBOutlet weak var fourthLetterOfWord: UILabel!
    @IBOutlet weak var thirdLetterOfWord: UILabel!
    @IBOutlet weak var secondLetterOfWord: UILabel!
    @IBOutlet weak var firstLetterOfWord: UILabel!
    @IBOutlet weak var stackOfWord: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var currentWord: String = ""
    private var guessedLetters: Set<Character> = []
    private var wrongGuesses: Int = 0
    private var wins: Int = 0
    private var losses: Int = 0
    
    // Word list - i will add more later
    private let words = [
        "DOLPHIN", "HARMONY", "WHISPER", "JOURNEY", "PHOENIX",
        "MYSTERY", "RAINBOW", "ENDLESS", "WISDOM", "SUPREME",
        "BLOSSOM", "CRYSTAL", "FANTASY", "GRAVITY", "HORIZON",
        "LIBERTY", "VINTAGE", "MIRACLE", "CAPTURE", "GARDENS",
        "PIONEER", "STELLAR", "BREEZES", "SUNRISE", "MELODY",
        "WILDFLY", "FREEDOM", "OUTLOOK", "REVELRY", "MOSAICS",
        "BRAVERY", "BOUTIQUE", "ELEGANT", "RADIANT", "TRIBUTE",
        "GLOWING", "SINCERE", "BALANCE", "DAYDREAM", "INFINITY",
        "TWILIGHT", "GLACIER", "RESOLVE", "LANTERN", "EXPLORE",
        "CANYONS", "ORCHARD", "STARGAZE", "MARINER", "ADVENTS",
        "TREKKER", "CIRCLES", "WONDERS", "DYNAMIC", "ELEMENT",
        "EXCITED", "OPTIMAL", "NATURES", "MOMENTS", "SECRETS",
        "ABUNDANT", "EPICURE", "GEMSTONES", "INSPIRE", "MOSAICS",
        "EVOLVED", "VIBRANT", "GATEWAY", "RESCUES", "HARVEST",
        "GALLANT", "VORTEXS", "MARVELS", "WINTERS", "PASSION",
        "FIREFLY", "GARNISH", "REFLECT", "FORTUNE", "DELIGHT",
        "REJOICE", "STATURE", "OUTLOOK", "TROPICS", "DAYTIME",
        "SINCERE", "MYSTICS", "ASCENTS", "HORIZON", "CLIMBER",
        "DIVERSO", "ENCHANT", "SPARKLE", "SOARING", "NOBLEST",
        "BLOSSOM", "ROSETTE", "AWAKENS", "MELODIC", "TUNDRAA",
        "WANDERS", "TORNADO", "LANTERN", "CIRCUIT", "UPLIFTS",
        "DELIGHT", "INSPIRE", "EXPLORR", "CAVERNS", "TIDINGS",
        "MIRACLE", "PRIMROS", "SERENAA", "RIPTIDE", "FORGIVE",
        "HEAVENS", "CHARMER", "REVERIE", "FLORALS", "DYNAMIC",
        "VILLAGE", "HORIZON", "GOLDENS", "VICTORY", "MYSTICS",
        "WILLOWY", "STATURE", "ELEGANT", "HARBORS", "CITADEL",
        "ASCENDS", "INSIGHT", "SUMMITS", "TOPMOST", "VOYAGER",
        "OCEANIC", "TIDINGS", "FAITHLY", "VIRTUAL", "ABIDING",
        "GLOWING", "EXALTED", "REFINED", "UPBEATS", "GRACEFUL",
        "ARTISAN", "VESTIGE", "PERSIST", "JUBILEE", "NIMBLES",
        "BLISSFUL", "REUNITE", "BLOSSOM", "IMMENSE", "EXCITES",
        "SUNSETS", "PLUMAGE", "VIOLINS", "MINUETS", "GROOVES",
        "UNIVERS", "SPIRALS", "ELEVATE", "SUMMITS", "RIPPLES",
        "SYMPHON", "VISIONS", "CRESCEN", "CANDLES", "LUXURYS",
        "INTRIGU", "ORACLES", "FROSTED", "SHIMMER", "SUPREME",
        "FANTASY", "WONDERL", "RAPTURE", "LANTERN", "ADORNED",
        "MYSTICS", "ENCHANT", "SERENIT", "STARDOM", "EVOKING",
        "TRICKLE", "HEAVENS", "FIRELIT", "GLACIER", "FLUIDIC",
        "REMORSE", "ESSENCE", "COSMICS", "GOLDENS", "CRYSTAL",
        "VOYAGER", "BOLDNES", "GOSSAME", "QUIETUS", "PURITYS",
        "TEMPEST", "VIOLETS", "LUXURYS", "SHADOWS", "TWINKLE",
        "GLINTIN", "AURORAS", "HEARTEN", "WISTFUL", "SERENES",
        "MELODYS", "HORIZON", "ZEPHYRS", "WHIMSY", "PRISMS",
        "BLOSSOM", "VESTIGE", "ARTISAN", "MIRACLE", "UPBEATS"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setupNewGame()
    }
    
    private func configureUI() {
        let allButtons = [q, w, e, r, t, y, u, i, o, p,
                          a, s, d, f, g, h, j, k, l,
                          z, x, c, v, b, n, m]
        
        allButtons.forEach { button in
            button?.layer.cornerRadius = 5
            button?.backgroundColor = .systemGray5
            button?.setTitleColor(.blue, for: .normal)
        }
        
        winsCount.text = "# 0"
        lossesCount.text = "# 0"
        
        hangManImage.image = UIImage(named: "hangman0")
    }
    
    private func setupNewGame() {
        guessedLetters.removeAll()
        wrongGuesses = 0
        
        currentWord = words.randomElement() ?? "DOLPHIN"
        
        resetUI()
        
        hangManImage.image = UIImage(named: "hangman0")
        
        print("Debug - New Game Word: \(currentWord)")
    }
    
    
    private func resetUI() {
        let allButtons = [q, w, e, r, t, y, u, i, o, p,
                          a, s, d, f, g, h, j, k, l,
                          z, x, c, v, b, n, m]
        
        allButtons.forEach { button in
            button?.backgroundColor = .systemGray5
            button?.isEnabled = true
        }
        
        let wordLabels = [firstLetterOfWord, secondLetterOfWord, thirdLetterOfWord,
                          fourthLetterOfWord, fifthLetterOfWord, SixthLetterOfWord,
                          seventhLetterOfWord]
        
        for (index, label) in wordLabels.enumerated() {
            if index < currentWord.count {
                label?.text = "_"
            } else {
                label?.text = ""
            }
        }
    }
    
    @IBAction func letterTapped(_ sender: UIButton) {
        guard let letter = sender.titleLabel?.text?.uppercased() else { return }
        handleGuess(letter: Character(letter), button: sender)
    }
    private func handleGuess(letter: Character, button: UIButton) {
        guard button.isEnabled else { return }
        
        button.isEnabled = false
        guessedLetters.insert(letter)
        
        if currentWord.contains(letter) {
            // Correct guess
            button.backgroundColor = .systemGreen
            updateWordDisplay()
            checkWinCondition()
        } else {
            // Wrong guess
            button.backgroundColor = .systemRed
            wrongGuesses += 1
            updateHangmanImage()
            checkLoseCondition()
        }
    }
    
    
    private func updateWordDisplay() {
        let wordLabels = [firstLetterOfWord, secondLetterOfWord, thirdLetterOfWord,
                          fourthLetterOfWord, fifthLetterOfWord, SixthLetterOfWord,
                          seventhLetterOfWord]
        
        let wordArray = Array(currentWord)
        for (index, letter) in wordArray.enumerated() {
            if guessedLetters.contains(letter) {
                wordLabels[index]?.text = String(letter)
            }
        }
    }
    
    private func updateHangmanImage() {
        // Use the provided hangman images
        hangManImage.image = UIImage(named: "hangman\(wrongGuesses)")
    }
    private func checkWinCondition() {
        let wordSet = Set(currentWord)
        let isWin = wordSet.isSubset(of: guessedLetters)
        
        if isWin {
            wins += 1
            winsCount.text = "# \(wins)"
            showGameEndAlert(won: true)
        }
    }

    private func checkLoseCondition() {
        if wrongGuesses >= 6 {
            losses += 1
            lossesCount.text = "# \(losses)"
            showGameEndAlert(won: false)
        }
    }

    private func showGameEndAlert(won: Bool) {
        let title = won ? "Woohoo!" : "Uh oh"
        let message = won ? "You saved me! Would you like to play again?" :
        "The correct word was \(currentWord). Would you like to try again?"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            self?.setupNewGame()
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
}
