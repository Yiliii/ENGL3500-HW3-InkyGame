// Once upon a time...

//  * There were two choices.
//  * There were four lines of content.

// - They lived happily ever after.
//     -> END

//mafia game mini version: 4 players, one sheriff, two civilians, and one mafia.
//role assignment: 1 sheriff (Kally) 2 civilian (Sam) 3 mafia (Player; Alex) 4 civilian (Casey)
Mayor: Welcome, everyone, to the game of Mafia—a battle of deception, deduction, and survival...
In this town, we have four players: one Sheriff, two Civilians, and one Mafia hiding among us...
Each night, the Mafia will strike in secret, while the Sheriff investigates and the Civilians try to stay alive. By day, we vote and debate to uncover the truth.
(You opened the card...you are the bad, evil mafia in this game...)
// First, let the denstiny decides your. Please draw your role.
// When it is your turn to draw the card, only two cards are left:
//     * Choose the left card -> mafia
//     * Choose the right card -> sheriff
  // Maybe add options for civillian??
Now, the sun sets, and the town falls into silence... Close your eyes. Night has begun.

    * Close eyes -> game_start
    * [Asks about the rules]-> game_rules
    
=== game_rules ===
"Wait! I am still confused!"

Mayor: More on the game rules blahblahblah
    * ["Okay it all makes sense now"] -> game_start
    * [Ummm, I might need a sec to digest this...] -> newbie

=== newbie ===
    Kally: "Hi, ummm...hi, are you good? You look confused?"
    * ["Uh haha yeah sure, let's begin!"] -> game_start
    * ["Well, I am actually not really getting this..."] -> Kally_friendly

=== Kally_friendly ===
    "It's my first time playing this game, so..."
    Kally: "Hey, don't worry about it! I've been there! My name is Kally by the way!"
    "I am Alex!"
    Kally: "Really nice to meet you Alex! Do you have specific questions about the game rules? I am happy to help explain!"
    * ["Umm...yes..."] -> annoyed_Casey
    * ["Thank you Kally, but I am good!"] -> game_start
    = annoyed_Casey
    "I am a question about the nights, so when the ——"
    Casey: "Come on guys...why can't we just start now?!! Like Alex —— your name is Alex right? —— you can learn while you play it, it's not a big deal."
    Kally: "Casey!"
    Casey: "Look at Sam! Sam never played Mafia before as well but why is he not wasting our time?"
    Sam: "......"
    * ["Casey you *****%@&%$!!!!"] -> game_never_played
    * ["It's fine Kally, I will learn as I go"] -> game_start
    = game_never_played
    (You sweared Casey with all the [censored] words you have known, and Casey sweared back brutally. Kally, Sam, and the Mayor guy all had to step in and pull you two apart. You were over angry and You don't even remember how you left the place and got back home. Well, eventually you didn't get to learn how to play Mafia, but you definely learned a lot of swear words that you will add to your vocab list...)
    -> END
=== game_start ===
    (Everyone closed their eyes...)
    Mayor: Sheriff please open your eyes. Who do you find suspcious and want to go after to investigate tonight?
    Got it. This person is...(the Mayor gave the hand gesture). Now you can close your eyes go back to sleep.
    Mafia, you are awake now to excecute your order now. Who will be your target tonight?
    (You looked around to see everyone. Everyone is sitting on the same side of a long conference table, while the mayor is on the other side. Each of the players have their own name tag by their sides. From the Mayor's left to right, you see Kally, Casey, Sam, and lastly Alex which is yourself.) //insert image
    * Point at Kally immediately -> first_night_Kally
    * Point at Casey immediately -> first_night_Casey
    * Point at Sam immediately -> first_night_Sam
    * [Hold on, I need some time to think about it] -> first_night_hesitant
    
=== first_night_hesitant ===
    It seems like they are all in the same sitting position as when they closed their eyes. You can't find any flaw points from that to simple hack the game and tell who is the sheriff. At the same time, you don't know any of them —— even though it seems like the rest of them all know each other already —— and feel sorry for elimating any of them so early. You have been hesitanted for a moment and the Mayor's expression is reminding you that you should make the choice right now!
    * [Point at Kally] -> first_night_Kally
    * [Point at Casey] -> first_night_Casey
    * [Point at Sam] -> first_night_Sam

=== first_night_Kally ===
    Mayor: Last night, Kally was murderred by the Mafia.
    Now takes turn to speak. The person to the right of the dealth speak first. Start with Casey, Sam you will be the next.
    Casey: Ugh why am I the first one to start. I am just a civilian. I don't have ANY information. This speaking order sucks, sorry for you guys, you won't get the chance to hear my inference, good luck now. I will say this...Alex is definetly more suspcious than Sam. (waves to indicate Sam to speak now)
    Sam: Ummm, I am a new player, not like Casey, so sorry that I don't have much information to share either. I am also a civilian. That's all sorry.
    (Now is your turn to speak...)
    * "I think Sam is suspcious" -> lose
    * "I think Casey is suspcious" -> lose
    * "I am the sheriff" -> successful_sheriff_disguise //successful if say Casey is Mafia (because Sam is newbie and didn't realize you are hiding the possibility of Kally is the sheriff), unsuccessful if say Sam is Mafia. If say Kally is civilian and suspcious of Casey, successful. If say Kally is civilian and suspcious of Sam, and if first_night_hesititate, win (Casey thinks saying Kally is civilian adds to Alex's credits, also it feels like a newbie thing cuz the night took forever), if not first_night hesititae, loose (sam would take a longer time deciding I know her.)
    
=== first_night_Casey ===
    Mayor: Last night, Casey was murderred by the Mafia.
    //Kally checked you as Mafia
    Sam:
    Alex:
    Kally:
     * "I think Kally is suspcious" -> lose //Kally: I checked you as the Mafia. Also the sheriff must show their identity because we only have three people left and the game will end after voting. You only say I am suspcious but don't say your are the sheriff, so you logically can only be the Mafia. 
    * "I think Sam is suspcious" -> lose //Kally: I checked you as the Mafia. Also the sheriff must show their identity because we only have three people left and the game will end after voting. You only say Casey is suspcious but don't say your are the sheriff, so you logically can only be the Mafia.
    * "I am the sheriff" -> successful_sheriff_argue // -> successful_sheriff_argue (say Kally is the Mafia. "Casey's out? Don't worry, I will sort out the logics for you. if Kally say she is sheriff.... ) or unsuccessful_sheriff_argue (say Sam is the Mafia or say Casey is civilian, Kally: I am the real sheriff because otherwise I would't need to say this. and Sam looses trust) 

=== first_night_Sam ===
    Mayor: Last night, Sam was murderred by the Mafia.
    //Kally checked Sam as Cillvian
    Alex, Kally, Casey
     * "I think Kally is suspcious" -> lose 
    * "I think Casey is suspcious" -> win //if first_night_hestitate, lose; if not, win
    * "I am the sheriff" -> unsuccessful_sheriff_disguise // ->  Kally: I am the real sheriff because otherwise I would't need to say this. and Casey looses trust on you because of this) 


=== successful_sheriff_disguise ===
    I am the sheriff and last night I found out Casey is the Mafia. I chose her  because she is sitting next to me. You know yourself is not the sheriff, and if Casey is the sheriff, that will be the first thing she says in her statements, and she probably would emphasis ten times over and over again. I am the only one annoucing the sheriff indentity so you can trust me.
    You porposefully didn't mention the possibility of elimiated Kally being the sheriff.
    Sam seems convinced.
    ->first_day_voting
    
=== unsuccessful_frame ===
    No one seems convinced, including yourself.
    ->first_day_voting

=== first_day_voting ===
Mayor: Time to vote for execution.
    * Vote for Casey -> trust_check
    * Vote for Sam -> trust_check
= trust_check
//unsuccessful_frame
->mafia_exposed
// successful_sheriff_disguise
->win_through_voting


=== mafia_exposed ===
You exposed your identity as the Mafia and got voted out for excecution...
YOU LOST THE GAME.
->END

=== win_through_voting ===
You know that it was an innocent person got voted out and you know that you were not innocent in this —— give them a little push, they fall apart —— you put the last surivior to the long lasting sleep at night. Poor guy.
    YOU WIN THE GAME.
->END
//wait a longer time
//hear noises
//who is the real sheriff
