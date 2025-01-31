VAR suspicion_level = 0
VAR first_night_hesitated = false
VAR deception_success = false
VAR attack_target = ""
VAR vote_target = ""

Mayor: Welcome, everyone, to the game of Mafia —— a battle of deception, deduction, and survival...
In this town, we have four players: one Sheriff, two Civilians, and one Mafia hiding among us...
Each night, the Mafia will strike in secret, while the Sheriff investigates and the Civilians try to stay alive. By day, we vote and debate to uncover the truth.

(You opened the card...you are the bad, evil Mafia in this game...)

Now, the sun sets, and the town falls into silence... Close your eyes. Night has begun.

* [Close eyes] -> game_start
* [Asks about the rules] -> game_rules

=== game_rules ===

"Wait! I am still confused!"

Mayor: "Each night, the Sheriff investigates a player’s identity, while the Mafia secretly chooses a target to eliminate. During the night phase, I will call on the Sheriff, who will open their eyes and point to a player they want to investigate. I will respond with a hand signal —— thumbs up means the person is a good civilian, while thumbs down means they are the Mafia. Then, I will ask the Mafia to open their eyes and silently point to their chosen target. Once they decide, they will close their eyes again...

When morning comes, everyone opens their eyes, and I will announce whether someone has been eliminated. By day, the group discusses, debates, and votes to determine who they suspect is Mafia...

The goal? Outsmart your opponents, survive, and uncover the truth before it’s too late!"

* "Okay, it all makes sense now." -> game_start
* [Ummm, I might need a sec to digest this...] -> newbie

=== newbie ===

Kally: "Hey, you okay? You look a little lost."

* "Uh haha, no yeah I am okay, let's just begin!" -> game_start
* "Well, I am actually not really getting this...["] -> Kally_friendly

=== Kally_friendly ===

It's my first time playing this game, so..."

Kally: "Don't worry! We all start somewhere. I'm Kally, by the way."

"I'm Alex!"

Kally: "Nice to meet you, Alex! Any specific questions that I can help with?"

* ["Umm...yes!"] -> annoyed_Casey
* "Thank you Kally, but I’m good!" -> game_start

=== annoyed_Casey ===

"So, during the night phase..."

Casey: "Ughhh, can we just start already? Alex, you’ll learn as we go. No need to hold us up."

Kally: "Casey! Be nice."

Casey: "Come on, Sam’s new too, but he’s not making a big deal about it."

Sam: "..."

Kally: "Hey!"

* ["Casey, you *****%@&%$!!!!"] -> game_never_played
* "It’s fine, Kally, I’ll pick it up as I go." -> game_start

=== game_never_played ===

(You unleashed every insult word in your arsenal at Casey, who fired back just as viciously. The battle got so intense that Kally, Sam, and even the Mayor had to step in to physically pull you two apart. You were beyond furious —— so much so that you barely remember how you left the place or made it back home. In the end, you didn’t get to learn how to play Mafia, but you certainly expanded your vocabulary with a whole new set of creative insults...)
-> END

=== game_start ===

(Everyone closes their eyes...)

Mayor: "Sheriff, time to act —— please open your eyes —— Who do you find suspicious? Who would you like to investigate tonight?"

(Sheriff chooses.)

Mayor: "This person is… (The Mayor signals with a hand gesture.) Now, you may return to sleep and close your eyes. Mafia, you are now awake —— who will be your target tonight?"

(You glance at the name tags in front of each player. From left to right: Kally, Casey, Sam, and yourself, Alex.)

* [Point at Kally] -> first_night_Kally
* [Point at Casey] -> first_night_Casey
* [Point at Sam] -> first_night_Sam
* [Hold on, I need some time to think...] -> first_night_hesitant

=== first_night_hesitant ===

~ first_night_hesitated = true

(Everyone is still sitting exactly as they were when they closed their eyes —— no visible movements, no clues to exploit. There's no easy way to hack the game and figure out who the Sheriff is. At the same time, you realize you don’t know anyone here, even though they all seem familiar with each other. The thought of eliminating someone so early makes you hesitate. But the Mayor’s expectant gaze is pressing you —— your time is up. You need to make a decision. Now.)

* [Point at Kally] -> first_night_Kally
* [Point at Casey] -> first_night_Casey
* [Point at Sam] -> first_night_Sam


=== first_night_Kally ===
Mayor: "Last night, Kally was murdered by the Mafia, and the killer still walks among us, hidden in plain sight...

Now, it’s time to speak and uncover the truth. We will go in order, starting with the person seated to the right of the fallen. Casey, you will begin. Sam, you’re up next. Choose your words wisely —— your survival may depend on it."  

Casey: "Ugh, why do I have to go first? I’m just a civilian —— I don’t have ANY useful information. This speaking order is the worst! Sorry guys, but you won’t be getting any deep insights from me now. Good luck figuring things out... Alex definitely seems more suspicious than Sam though." 

(Casey casually waves to signal Sam to speak.)

Sam: "Umm... I’m new to this game, unlike Casey... so I don’t have much to add either. Sorry, but I’m just a civilian too. That’s all."

    (Now, it’s your turn to speak...)
    * "I think Sam is suspcious." -> Sam_suspcious
    * "I think Casey is suspcious.["] -> Casey_suspcious
    * ["I am the sheriff."] -> sheriff_disguise 
    = Sam_suspcious
    (Both Sam and Casey turn to stare at you the second you said that out. You suddenly feel the pressure)
        * "However..." -> sheriff_disguise
        * "Sam is suspcious because...["] -> Sam_suspcious_continue
    = Sam_suspcious_continue
    he..e...he didn't declare himself a civilian right away! If he were truly innocent, that should have been the first thing he said!"
    (You shout this out before it hits you —— you never declared yourself innocent civilian first either. Brilliant. You just played yourself perfectly...)
    ->first_day_voting
    = Casey_suspcious
    Because she thinks I’m suspicious! But I’m not Mafia —— why is she coming after me before I even get a chance to speak? She’s already made up her mind... she wants me gone!"
    (You scramble for a stronger argument, something —— anything —— to shift the suspicion onto Casey. But your reasoning feels weak, unconvincing. Sam isn’t buying it, and he doesn't want to vote his friend Casey out. You’ve misplayed this badly, and you can feel the noose tightening around you...)
    ->first_day_voting
    = sheriff_disguise
    (Your mind races, piecing together their interactions —— Sam and Casey clearly knew each other before the game. That bond could make them instinctively trust each other more than they trust you. One wrong move, one weak accusation, and you’ll only push them closer together. You need to be careful. You need to be convincing. Then it clicks —— Sam claimed to be new to the game. That might just be the key to turning this in your favor...)
    "I am the sheriff, and I checked...
        * Casey last night. Casey is the Mafia.["] -> successful_sheriff_disguise
        * Sam last night. Sam is the Mafia." -> unsuccessful_sheriff_disguise
    
    = successful_sheriff_disguise
    Trust me! I’m the only one claiming to be the sheriff. No one else has stepped forward, and I’m the last to speak. Logically, that leaves no room for doubt, I AM the sheriff."
    (You deliberately leave out the possibility that Kally was the real Sheriff. And it works —— Sam seems convinced. After all, he’s a slow, inexperienced player, unlikely to catch the flaw in your reasoning. The perfect target for your deception.)
    ~ deception_success = true
    ~ attack_target = "Casey"
    -> first_day_voting
    
    = unsuccessful_sheriff_disguise
     (The moment the words leave your mouth, Casey’s eyes narrow with suspicion. Regret sinks in instantly. Of course, someone as skilled as Casey would have already considered the possibility that the eliminated Kally was the real sheriff. And now, you've only cemented her doubts about you.
     She was suspicious of you from the start, and now there’s no turning back. No matter how much of a newbie Sam is, after you framing him of being Mafia… there’s no doubt, he’ll vote against you too.)
    -> first_day_voting
    
=== first_night_Casey ===
Mayor: "Last night, Casey was murdered by the Mafia, and the killer still walks among us, hidden in plain sight...

Now, it’s time to speak and uncover the truth. We will go in order, starting with the person seated to the right of the fallen. Kally, you will begin. Sam, you’re up next. Alex, you will go last. Choose your words wisely —— your survival may depend on it."

Kally: "I don’t need to hesitate on this one. I am the Sheriff, and I checked Alex last night. He is the Mafia."

Sam: "Oh... well, that makes sense, then."

    (Now, it’s your turn to speak...)
    * ["I think Kally is suspicious."] -> Kally_suspicious
    * ["I think Sam is suspicious."] -> Sam_suspicious

    = Kally_suspicious
    "That’s ridiculous! Kally is just saying that because she knows there’s no way to prove it! She could be the Mafia, trying to frame me!"
    
    (Sam frowns. Kally stays firm, but you can see a flicker of doubt in Sam’s eyes.)
    -> first_day_voting

    = Sam_suspicious
    "Why are you so quick to agree with Kally? You must be the Mafia and want to vote me out so badly...and wait, maybe you two are working together!"

    (Oops, you got ahead of yourself and overlooked the fact that there's only one Mafia —— accusing them of working together makes no sense... )
    -> first_day_voting

=== first_night_Sam ===
Mayor: "Last night, Sam was murdered by the Mafia, and the killer still walks among us, hidden in plain sight...

Now, it’s time to speak and uncover the truth. We will go in order, starting with the person seated to the right of the fallen. Kally, you will begin. Casey, you’re up next. Alex, you will go last. Choose your words wisely —— your survival may depend on it."

Kally: "I checked Sam last night. He was a civilian. That means the Mafia is still among us."

Casey: "Well, we know Sam was innocent now, but that doesn’t really help us much... but between me and Alex, I know I’m not Mafia. That leaves only one answer."

    (Now, it’s your turn to speak...)
    * ["I think Kally is suspicious."] -> Kally_suspicious
    * ["I think Casey is suspicious."] -> Casey_suspicious

    = Kally_suspicious
    "That’s ridiculous! Kally is just saying that because she knows there’s no way to prove it! She could be the Mafia, trying to frame me!"
    
    (Sam frowns. Kally stays firm, but you can see a flicker of doubt in Sam’s eyes.)
    -> first_day_voting

    = Casey_suspicious
    "Why are you so quick to agree with Kally? You must be the Mafia and want to vote me out so badly...and wait, maybe you two are working together!"

    (Oops, you got ahead of yourself and overlooked the fact that there's only one Mafia —— accusing them of working together makes no sense... )
    -> first_day_voting

=== first_day_voting ===

Mayor: "No more delays. Cast your votes —— who among us shall face judgment?"

* {first_night_Kally or first_night_Sam} [Vote for Casey] 
    ~ vote_target = "Casey"
    -> trust_check
* {first_night_Kally or first_night_Casey} [Vote for Sam] 
    ~ vote_target = "Sam"
    -> trust_check
* {first_night_Casey or first_night_Sam} [Vote for Kally]  
    ~ vote_target = "Kally"
    -> trust_check

=== trust_check ===
{deception_success == false: -> lose}
{deception_success == true: 
    -> check_target
    }

= check_target
{vote_target == attack_target: -> win_at_voting}
-> win_at_night

=== lose ===

(You failed to escape their suspicion. Their eyes, once uncertain, now burn with conviction. You’ve been caught and voted out.)

YOU LOST THE GAME.

-> END

=== win_at_voting ===

(An innocent has fallen to the vote. Under the cover of night, you strike the final blow. With no one left to oppose you, the Mafia now seize control.)

YOU WIN THE GAME.

-> END

=== win_at_night ===

(The vote ends in a deadlock —— one vote each. But it doesn’t matter. When night falls, you’ll have the final say. Even with one innocent left standing after the runrise, they are meant to be doomed —— gripped by fear by day, powerless by night. The day ends with an inevitable voting draw, yet they won’t survive to see another dawn.)

YOU WIN THE GAME.

-> END
