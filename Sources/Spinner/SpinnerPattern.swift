public enum SpinnerPattern {
    case dots
    case dots2
    case dots3
    case dots4
    case dots5
    case dots6
    case dots7
    case dots8
    case dots9
    case dots10
    case dots11
    case dots12
    case dots8Bit
    case line
    case line2
    case pipe
    case simpleDots
    case simpleDotsScrolling
    case star
    case star2
    case flip
    case hamburger
    case growVertical
    case growHorizontal
    case balloon
    case balloon2
    case noise
    case bounce
    case boxBounce
    case boxBounce2
    case triangle
    case arc
    case circle
    case squareCorners
    case circleQuarters
    case circleHalves
    case squish
    case toggle
    case toggle2
    case toggle3
    case toggle4
    case toggle5
    case toggle6
    case toggle7
    case toggle8
    case toggle9
    case toggle10
    case toggle11
    case toggle12
    case toggle13
    case arrow
    case arrow2
    case arrow3
    case bouncingBar
    case bouncingBall
    case smiley
    case monkey
    case hearts
    case clock
    case earth
    case material
    case moon
    case runner
    case pong
    case shark
    case dqpb
    case rain
    case christmas
    case grenade
    case point
    case layer
    case betaWave
    case fingerDance
    case fistBump
    case soccerHeader
    case mindblown
    case speaker
    case orangePulse
    case bluePulse
    case orangeBluePulse
    case aesthetic
    case singleFrame(String)
    case multiFrame([String])

    public init(singleFrame: String) {
        self = .singleFrame(singleFrame)
    }

    public init(multiFrame: [String]) {
        self = .multiFrame(multiFrame)
    } 

    public var frames: [String] {
        switch self {
            case .dots: return ["⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"]
            case .dots2: return ["⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"]
            case .dots3: return ["⠋", "⠙", "⠚", "⠞", "⠖", "⠦", "⠴", "⠲", "⠳", "⠓"]
            case .dots4: return ["⠄", "⠆", "⠇", "⠋", "⠙", "⠸", "⠰", "⠠", "⠰", "⠸", "⠙", "⠋", "⠇", "⠆"]
            case .dots5: return ["⠋", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋"]
            case .dots6: return ["⠁", "⠉", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠤", "⠄", "⠄", "⠤", "⠴", "⠲", "⠒", "⠂", "⠂", "⠒", "⠚", "⠙", "⠉", "⠁"]
            case .dots7: return ["⠈", "⠉", "⠋", "⠓", "⠒", "⠐", "⠐", "⠒", "⠖", "⠦", "⠤", "⠠", "⠠", "⠤", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋", "⠉", "⠈"]
            case .dots8: return ["⠁", "⠁", "⠉", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠤", "⠄", "⠄", "⠤", "⠠", "⠠", "⠤", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋", "⠉", "⠈", "⠈"]
            case .dots9: return ["⢹", "⢺", "⢼", "⣸", "⣇", "⡧", "⡗", "⡏"]
            case .dots10: return ["⢄", "⢂", "⢁", "⡁", "⡈", "⡐", "⡠"]
            case .dots11: return ["⠁", "⠂", "⠄", "⡀", "⢀", "⠠", "⠐", "⠈"]
            case .dots12: return ["⢀⠀", "⡀⠀", "⠄⠀", "⢂⠀", "⡂⠀", "⠅⠀", "⢃⠀", "⡃⠀", "⠍⠀", "⢋⠀", "⡋⠀", "⠍⠁", "⢋⠁", "⡋⠁", "⠍⠉", "⠋⠉", "⠋⠉", "⠉⠙", "⠉⠙", "⠉⠩", "⠈⢙", "⠈⡙", "⢈⠩", "⡀⢙", "⠄⡙", "⢂⠩", "⡂⢘", "⠅⡘", "⢃⠨", "⡃⢐", "⠍⡐", "⢋⠠", "⡋⢀", "⠍⡁", "⢋⠁", "⡋⠁", "⠍⠉", "⠋⠉", "⠋⠉", "⠉⠙", "⠉⠙", "⠉⠩", "⠈⢙", "⠈⡙", "⠈⠩", "⠀⢙", "⠀⡙", "⠀⠩", "⠀⢘", "⠀⡘", "⠀⠨", "⠀⢐", "⠀⡐", "⠀⠠", "⠀⢀", "⠀⡀"]
            case .dots8Bit: return ["⠀", "⠁", "⠂", "⠃", "⠄", "⠅", "⠆", "⠇", "⡀", "⡁", "⡂", "⡃", "⡄", "⡅", "⡆", "⡇", "⠈", "⠉", "⠊", "⠋", "⠌", "⠍", "⠎", "⠏", "⡈", "⡉", "⡊", "⡋", "⡌", "⡍", "⡎", "⡏", "⠐", "⠑", "⠒", "⠓", "⠔", "⠕", "⠖", "⠗", "⡐", "⡑", "⡒", "⡓", "⡔", "⡕", "⡖", "⡗", "⠘", "⠙", "⠚", "⠛", "⠜", "⠝", "⠞", "⠟", "⡘", "⡙", "⡚", "⡛", "⡜", "⡝", "⡞", "⡟", "⠠", "⠡", "⠢", "⠣", "⠤", "⠥", "⠦", "⠧", "⡠", "⡡", "⡢", "⡣", "⡤", "⡥", "⡦", "⡧", "⠨", "⠩", "⠪", "⠫", "⠬", "⠭", "⠮", "⠯", "⡨", "⡩", "⡪", "⡫", "⡬", "⡭", "⡮", "⡯", "⠰", "⠱", "⠲", "⠳", "⠴", "⠵", "⠶", "⠷", "⡰", "⡱", "⡲", "⡳", "⡴", "⡵", "⡶", "⡷", "⠸", "⠹", "⠺", "⠻", "⠼", "⠽", "⠾", "⠿", "⡸", "⡹", "⡺", "⡻", "⡼", "⡽", "⡾", "⡿", "⢀", "⢁", "⢂", "⢃", "⢄", "⢅", "⢆", "⢇", "⣀", "⣁", "⣂", "⣃", "⣄", "⣅", "⣆", "⣇", "⢈", "⢉", "⢊", "⢋", "⢌", "⢍", "⢎", "⢏", "⣈", "⣉", "⣊", "⣋", "⣌", "⣍", "⣎", "⣏", "⢐", "⢑", "⢒", "⢓", "⢔", "⢕", "⢖", "⢗", "⣐", "⣑", "⣒", "⣓", "⣔", "⣕", "⣖", "⣗", "⢘", "⢙", "⢚", "⢛", "⢜", "⢝", "⢞", "⢟", "⣘", "⣙", "⣚", "⣛", "⣜", "⣝", "⣞", "⣟", "⢠", "⢡", "⢢", "⢣", "⢤", "⢥", "⢦", "⢧", "⣠", "⣡", "⣢", "⣣", "⣤", "⣥", "⣦", "⣧", "⢨", "⢩", "⢪", "⢫", "⢬", "⢭", "⢮", "⢯", "⣨", "⣩", "⣪", "⣫", "⣬", "⣭", "⣮", "⣯", "⢰", "⢱", "⢲", "⢳", "⢴", "⢵", "⢶", "⢷", "⣰", "⣱", "⣲", "⣳", "⣴", "⣵", "⣶", "⣷", "⢸", "⢹", "⢺", "⢻", "⢼", "⢽", "⢾", "⢿", "⣸", "⣹", "⣺", "⣻", "⣼", "⣽", "⣾", "⣿"]
            case .line: return ["-", "\\", "|", "/"]
            case .line2: return ["⠂", "-", "–", "—", "–", "-"]
            case .pipe: return ["┤", "┘", "┴", "└", "├", "┌", "┬", "┐"]
            case .simpleDots: return [".  ", ".. ", "...", "   "]
            case .simpleDotsScrolling: return [".  ", ".. ", "...", " ..", "  .", "   "]
            case .star: return ["✶", "✸", "✹", "✺", "✹", "✷"]
            case .star2: return ["+", "x", "*"]
            case .flip: return ["_", "_", "_", "-", "`", "`", "'", "´", "-", "_", "_", "_"]
            case .hamburger: return ["☱", "☲", "☴"]
            case .growVertical: return ["▁", "▃", "▄", "▅", "▆", "▇", "▆", "▅","▄","▃"]
            case .growHorizontal: return ["▏","▎","▍","▌","▋","▊","▉","▊","▋","▌","▍","▎"]
            case .balloon: return [" ", ".", "o", "O", "@", "*", " "]
            case .balloon2: return [".", "o", "O", "°", "O", "o", "."]
            case .noise: return ["▓", "▒", "░"]
            case .bounce: return ["⠁", "⠂", "⠄", "⠂"]
            case .boxBounce: return ["▖", "▘", "▝", "▗"]
            case .boxBounce2: return ["▌", "▀", "▐", "▄"]
            case .triangle: return ["◢", "◣", "◤", "◥"]
            case .arc: return ["◜", "◠", "◝", "◞", "◡", "◟"]
            case .circle: return ["◡", "⊙", "◠"]
            case .squareCorners: return ["◰", "◳" ,"◲", "◱"]
            case .circleQuarters: return ["◴" ,"◷", "◶", "◵"]
            case .circleHalves: return ["◐", "◓", "◑", "◒"]
            case .squish: return ["╫", "╪"]
            case .toggle: return ["⊶", "⊷"]
            case .toggle2: return ["▫" ,"▪"]
            case .toggle3: return ["□", "■"]
            case .toggle4: return ["■", "□", "▪", "▫"]
            case .toggle5: return ["▮", "▯"]
            case .toggle6: return ["ဝ", "၀"]
            case .toggle7: return ["⦾", "⦿"]
            case .toggle8: return ["◍", "◌"]
            case .toggle9: return ["◉", "◎"]
            case .toggle10: return ["㊂", "㊀", "㊁"]
            case .toggle11: return ["⧇", "⧆"]
            case .toggle12: return ["☗", "☖"]
            case .toggle13: return ["=", "*", "-"]
            case .arrow: return ["←","↖","↑","↗","→","↘","↓","↙"]
            case .arrow2: return ["⬆️", "↗️", "➡️", "↘️", "⬇️", "↙️" ,"⬅️", "↖️"]
            case .arrow3: return ["▹▹▹▹▹", "▸▹▹▹▹", "▹▸▹▹▹", "▹▹▸▹▹", "▹▹▹▸▹", "▹▹▹▹▸"]
            case .bouncingBar: return ["[    ]", "[   =]", "[  ==]", "[ ===]", "[====]", "[=== ]", "[==  ]", "[=   ]"]
            case .bouncingBall: return ["( ●    )", "(  ●   )", "(   ●  )", "(    ● )", "(     ●)", "(    ● )", "(   ●  )", "(  ●   )", "( ●    )", "(●     )"]
            case .smiley: return ["😄", "😝"]
            case .monkey: return ["🙈", "🙈", "🙉", "🙊"]
            case .hearts: return ["💛", "💙", "💜", "💚", "❤️"]
            case .clock: return ["🕐", "🕑", "🕒", "🕓", "🕔", "🕕", "🕖", "🕗", "🕘", "🕙", "🕚"]
            case .earth: return ["🌍", "🌎", "🌏"]
            case .material: return ["█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "███▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "████▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "██████▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "██████▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "███████▁▁▁▁▁▁▁▁▁▁▁▁▁", "████████▁▁▁▁▁▁▁▁▁▁▁▁", "█████████▁▁▁▁▁▁▁▁▁▁▁", "█████████▁▁▁▁▁▁▁▁▁▁▁", "██████████▁▁▁▁▁▁▁▁▁▁", "███████████▁▁▁▁▁▁▁▁▁", "█████████████▁▁▁▁▁▁▁", "██████████████▁▁▁▁▁▁", "██████████████▁▁▁▁▁▁", "▁██████████████▁▁▁▁▁", "▁██████████████▁▁▁▁▁", "▁██████████████▁▁▁▁▁", "▁▁██████████████▁▁▁▁", "▁▁▁██████████████▁▁▁", "▁▁▁▁█████████████▁▁▁", "▁▁▁▁██████████████▁▁", "▁▁▁▁██████████████▁▁", "▁▁▁▁▁██████████████▁", "▁▁▁▁▁██████████████▁", "▁▁▁▁▁██████████████▁", "▁▁▁▁▁▁██████████████", "▁▁▁▁▁▁██████████████", "▁▁▁▁▁▁▁█████████████", "▁▁▁▁▁▁▁█████████████", "▁▁▁▁▁▁▁▁████████████", "▁▁▁▁▁▁▁▁████████████", "▁▁▁▁▁▁▁▁▁███████████", "▁▁▁▁▁▁▁▁▁███████████", "▁▁▁▁▁▁▁▁▁▁██████████", "▁▁▁▁▁▁▁▁▁▁██████████", "▁▁▁▁▁▁▁▁▁▁▁▁████████", "▁▁▁▁▁▁▁▁▁▁▁▁▁███████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁██████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████", "█▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████", "██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███", "██▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███", "███▁▁▁▁▁▁▁▁▁▁▁▁▁▁███", "████▁▁▁▁▁▁▁▁▁▁▁▁▁▁██", "█████▁▁▁▁▁▁▁▁▁▁▁▁▁▁█", "█████▁▁▁▁▁▁▁▁▁▁▁▁▁▁█", "██████▁▁▁▁▁▁▁▁▁▁▁▁▁█", "████████▁▁▁▁▁▁▁▁▁▁▁▁", "█████████▁▁▁▁▁▁▁▁▁▁▁", "█████████▁▁▁▁▁▁▁▁▁▁▁", "█████████▁▁▁▁▁▁▁▁▁▁▁", "█████████▁▁▁▁▁▁▁▁▁▁▁", "███████████▁▁▁▁▁▁▁▁▁", "████████████▁▁▁▁▁▁▁▁", "████████████▁▁▁▁▁▁▁▁", "██████████████▁▁▁▁▁▁", "██████████████▁▁▁▁▁▁", "▁██████████████▁▁▁▁▁", "▁██████████████▁▁▁▁▁", "▁▁▁█████████████▁▁▁▁", "▁▁▁▁▁████████████▁▁▁", "▁▁▁▁▁████████████▁▁▁", "▁▁▁▁▁▁███████████▁▁▁", "▁▁▁▁▁▁▁▁█████████▁▁▁", "▁▁▁▁▁▁▁▁█████████▁▁▁", "▁▁▁▁▁▁▁▁▁█████████▁▁", "▁▁▁▁▁▁▁▁▁█████████▁▁", "▁▁▁▁▁▁▁▁▁▁█████████▁", "▁▁▁▁▁▁▁▁▁▁▁████████▁", "▁▁▁▁▁▁▁▁▁▁▁████████▁", "▁▁▁▁▁▁▁▁▁▁▁▁███████▁", "▁▁▁▁▁▁▁▁▁▁▁▁███████▁", "▁▁▁▁▁▁▁▁▁▁▁▁▁███████", "▁▁▁▁▁▁▁▁▁▁▁▁▁███████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁████", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁███", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁██", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁█", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁", "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁"]
            case .moon: return ["🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘"]
            case .runner: return ["🚶", "🏃"]
            case .pong: return ["▐⠂       ▌", "▐⠈       ▌", "▐ ⠂      ▌", "▐ ⠠      ▌", "▐  ⡀     ▌", "▐  ⠠     ▌", "▐   ⠂    ▌", "▐   ⠈    ▌", "▐    ⠂   ▌", "▐    ⠠   ▌", "▐     ⡀  ▌", "▐     ⠠  ▌", "▐      ⠂ ▌", "▐      ⠈ ▌", "▐       ⠂▌", "▐       ⠠▌", "▐       ⡀▌", "▐      ⠠ ▌", "▐      ⠂ ▌", "▐     ⠈  ▌", "▐     ⠂  ▌", "▐    ⠠   ▌", "▐    ⡀   ▌", "▐   ⠠    ▌", "▐   ⠂    ▌", "▐  ⠈     ▌", "▐  ⠂     ▌", "▐ ⠠      ▌", "▐ ⡀      ▌", "▐⠠       ▌"]
            case .shark: return ["▐|\\____________▌", "▐_|\\___________▌", "▐__|\\__________▌", "▐___|\\_________▌", "▐____|\\________▌", "▐_____|\\_______▌", "▐______|\\______▌", "▐_______|\\_____▌", "▐________|\\____▌", "▐_________|\\___▌", "▐__________|\\__▌", "▐___________|\\_▌", "▐____________|\\▌", "▐____________/|▌", "▐___________/|_▌", "▐__________/|__▌", "▐_________/|___▌", "▐________/|____▌", "▐_______/|_____▌", "▐______/|______▌", "▐_____/|_______▌", "▐____/|________▌", "▐___/|_________▌", "▐__/|__________▌", "▐_/|___________▌", "▐/|____________▌"]
            case .dqpb: return ["d", "q", "p", "b"]
            case .rain: return ["🌧", "🌨"]
            case .christmas: return ["🌲", "🎄"]
            case .grenade: return ["،  ", "′  ", " ´ ", " ‾ ", "  ⸌", "  ⸊", "  |", "  ⁎", "  ⁕", " ෴ ", "  ⁓", "   ", "   ", "   "]
            case .point: return ["∙∙∙", "●∙∙", "∙●∙", "∙∙●", "∙∙∙"]
            case .layer: return ["-", "=", "≡"]
            case .betaWave: return ["ρββββββ", "βρβββββ", "ββρββββ", "βββρβββ", "ββββρββ", "βββββρβ", "ββββββρ"]
            case .fingerDance: return ["🤘", "🤟", "🖖", "✋", "🤚", "👆"]
            case .fistBump: return ["🤜     🤛", "🤜     🤛", " 🤜   🤛 ","  🤜 🤛  ", "  🤜✨🤛  ", " 🤜 ✨ 🤛 ", "🤜  ✨  🤛", "🤜  ✨  🤛"]
            case .soccerHeader: return [" 🧑⚽️       🧑 ", "🧑  ⚽️      🧑 ", "🧑   ⚽️     🧑 ", "🧑    ⚽️    🧑 ", "🧑     ⚽️   🧑 ", "🧑      ⚽️  🧑 ", "🧑       ⚽️🧑  ", "🧑      ⚽️  🧑 ", "🧑     ⚽️   🧑 ", "🧑    ⚽️    🧑 ", "🧑   ⚽️     🧑 ", "🧑  ⚽️      🧑 "]
            case .mindblown: return ["😐", "😐", "😮", "😮", "😦", "😦", "😧", "😧", "🤯", "💥"]
            case .speaker: return ["🔈", "🔉", "🔊", "🔉"]
            case .orangePulse: return ["🔸", "🔶", "🟠", "🟠", "🔶"]
            case .bluePulse: return ["🔹", "🔷", "🔵", "🔵", "🔷"]
            case .orangeBluePulse: return ["🔸", "🔶", "🟠", "🟠", "🔶", "🔹", "🔷", "🔵", "🔵", "🔷"]
            case .aesthetic: return ["▰▱▱▱▱▱▱", "▰▰▱▱▱▱▱", "▰▰▰▱▱▱▱", "▰▰▰▰▱▱▱", "▰▰▰▰▰▱▱", "▰▰▰▰▰▰▱", "▰▰▰▰▰▰▰", "▰▱▱▱▱▱▱"]
            case .singleFrame(let frame): return [frame]
            case .multiFrame(let frames): return frames
        }
    }

    public var defaultSpeed: Double {
        switch self {
            case .dots: return 0.08
            case .dots2: return 0.08
            case .dots3: return 0.08
            case .dots4: return 0.08
            case .dots5: return 0.08
            case .dots6: return 0.08
            case .dots7: return 0.08
            case .dots8: return 0.08
            case .dots9: return 0.08
            case .dots10: return 0.08
            case .dots11: return 0.1
            case .dots12: return 0.08
            case .dots8Bit: return 0.08
            case .line: return 0.13
            case .line2: return 0.1
            case .pipe: return 0.1
            case .simpleDots: return 0.4
            case .simpleDotsScrolling: return 0.2
            case .star: return 0.07
            case .star2: return 0.08
            case .flip: return 0.07
            case .hamburger: return 0.1
            case .growVertical: return 0.12
            case .growHorizontal: return 0.12
            case .balloon: return 0.14
            case .balloon2: return 0.12
            case .noise: return 0.1
            case .bounce: return 0.12
            case .boxBounce: return 0.12
            case .boxBounce2: return 0.1
            case .triangle: return 0.05
            case .arc: return 0.1
            case .circle: return 0.12
            case .squareCorners: return 0.18
            case .circleQuarters: return 0.12
            case .circleHalves: return 0.05
            case .squish: return 0.1
            case .toggle: return 0.25
            case .toggle2: return 0.08
            case .toggle3: return 0.12
            case .toggle4: return 0.1
            case .toggle5: return 0.1
            case .toggle6: return 0.3
            case .toggle7: return 0.08
            case .toggle8: return 0.1
            case .toggle9: return 0.1
            case .toggle10: return 0.1
            case .toggle11: return 0.1
            case .toggle12: return 0.12
            case .toggle13: return 0.08
            case .arrow: return 0.1
            case .arrow2: return 0.08
            case .arrow3: return 0.12
            case .bouncingBar: return 0.08
            case .bouncingBall: return 0.08
            case .smiley: return 0.2
            case .monkey: return 0.3
            case .hearts: return 0.1
            case .clock: return 0.1
            case .earth: return 0.18
            case .material: return 0.017
            case .moon: return 0.08
            case .runner: return 0.3
            case .pong: return 0.08
            case .shark: return 0.12
            case .dqpb: return 0.1
            case .rain: return 0.2
            case .christmas: return 0.4
            case .grenade: return 0.08
            case .point: return 0.125
            case .layer: return 0.15
            case .betaWave: return 0.08
            case .fingerDance: return 0.16
            case .fistBump: return 0.08
            case .soccerHeader: return 0.08
            case .mindblown: return 0.16
            case .speaker: return 0.16
            case .orangePulse: return 0.1
            case .bluePulse: return 0.1
            case .orangeBluePulse: return 0.1
            case .aesthetic: return 0.8
            case .singleFrame(_): return 1
            case .multiFrame(_): return 0.08
        }
    }
}