import UIKit

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 <  $1
}

print(captainFirstTeam)

let reverseTeam = team.sorted {
    $0 > $1
}

let tOnly = team.filter { $0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam =  team.map { $0.uppercased() }
print(uppercaseTeam)

func animate(duration: Double, animations: () -> Void) {
    print("Starting a \(duration) second animation...")
    animations()
}

animate(duration: 3, animations: {
    print("Fade out the image")
})

animate(duration:3) {
    print("Fade out the image")
}
