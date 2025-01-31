// Please fix the errors in this Ink file. 

// NOTE: some errors can be fixed multiple ways. As long as you fix the error and the story flows logically, your fix is good. 

// NOTE #2: some errors will not show as an error in Ink-- you will have to deduce what the "novice coder" meant to do, and change one interpretted code statement to another to make it work as intended. (These should be fairly obvious.) 

// NOTE #3: try to intuit the intent of the "novice coder"-- you can "fix" it by completely re-writing the story, but that would be inserting your author's voice into the story. Try to only fix the code based on what the original author intended. 

// When you are finished, please refine the Ink Story you wrote during Monday's in-class Ink Game Jam. Stories DO NOT need to incorporate all the code statements. You can turn in a story that ONLY uses basic Choices, and that would be sufficient. 

// By "refine" I mean turn in a complete game. More will be said in class about the constraints, but please remember "complete" does not necessarily mean "complex". You will hopefully be able to finish most of your game in class, and will only need to debug a bit of code to get it ready to turn in. 

// Extensions are available. If you spend more than two hours on this homework, you do not need to spend another two hours refining your game (unless you want to). 
VAR has_rabbit = false 
VAR has_hedgehog = true 
VAR checked_doors = 0
//Changed to the correct way to declare global variables
You stand before four doors. 

- (doors)
* Door one 
    Behind door one is a stuffed rabbit. You take the rabbit. 
    ~ has_rabbit = true // true should be without the quotation marks
    ~ checked_doors += 1 //fixed the error to correctly record checked_doors number
    -> doors
* Door two 
    Nothing is behind door two.
    ~ checked_doors +=1 //fixed the error to correctly record checked_doors number
    -> doors
* Door three 
    Behind door three is a stuffed hedgehog. You take the hedgehog. 
    ~ has_hedgehog = true
    ~ checked_doors += 1 //fixed the error to correctly record checked_doors number
    -> doors
* Door four 
    There is nothing behind door four. 
    ~ checked_doors += 1 //fixed the error to correctly record checked_doors number
        -> doors
+ How do I leave? // changed this to a sticky choice to make sure player can choose to leave anytime
    -> try_to_leave 


=== try_to_leave === //added three equal signs for the syntax
+ {checked_doors < 4} You need to check every door -> doors //the total number of doors is 4, so the condition that represents the player hasn't checked every door should be checked_doors < 4. Also changed it to a sticky choice to make sure this choice can be displayed multiple times.
+ {checked_doors == 4} You may leave. //fixed the syntax error. The equality operator is ==.

- {has_rabbit and has_hedgehog:
    The stuffed animals turn their stuffed-animal necks and beckon you to come closer.
    
    * Lean in?
        "Wake up, you're dreaming."
        -> how_do_i_wake_up
    * Screw this! I'm out of here! 
        -> how_do_i_wake_up
        } //used the {} to avoid printing out "has_rabbit and has_hedgehog:" condition
- {not (has_rabbit and has_hedgehog):
    You need some special items to leave...
    -> doors //the else statement means "if has_rabbit or/and has_hedgehog" is/are still false" which means the player hasn't checked door one and/or door three. To match the original author intention, if the player trigers this else statement, they should be diverted back to doors.
}
    

= how_do_i_wake_up
VAR chosen_animal = "" //changed from temporary variable to global variable to increase the scope and access to it. Also change it to a string variable because "rabbit" and "hedgehog" are string values.
VAR checked_actions = 0
{checked_actions == 4 and chosen_animal != "": -> you_finally_wake_up_on_your_own}
* Pinch yourself. 
    ~ checked_actions +=1
    -> how_do_i_wake_up
* Jump up and down 
    ~ checked_actions +=1
    -> how_do_i_wake_up
* Stare at the stuffed animals quizically. 
    ~ checked_actions +=1
    -> how_do_i_wake_up 
* "You must choose one of us."
    * * Choose rabbit. 
    ~ chosen_animal = "rabbit"
    ~ checked_actions +=1
    -> how_do_i_wake_up
    * * Choose hedgehog. 
    ~ chosen_animal = "hedgehog"
    ~ checked_actions +=1
    -> how_do_i_wake_up
// Based on how the original code is structured, it seems like the author intends to allow player to freely explore all three actions (Pinch yourself, Jump up and down, Stare at the stuffed animals) even if they choose the "You must choose one of us." choice first (since both animal subchoices are diverted back to how_do_i_wake_up and the you_finally_wake_up_on_your_own is on a sperate line that may indicate the author intends to design this to be trigered after four choices are all checked by player). I added a checked_actions variable and condition check so once all four actions (three actions + picking an animal) have been taken, the story automatically proceeds to you_finally_wake_up_on_your_own. This is just my take on the original author's design intention. However, if it is supposed to be directly diverted to you_finally_wake_up_on_your_own right after choosing an animal, the way to fix the code would be replacing the "-> how_do_i_wake_up" to "-> you_finally_wake_up_on_your_own" in the original code for both rabbit and hedgehog options.


= you_finally_wake_up_on_your_own //added the missing underscore to fix the stitch name

Phew! You're awake. 

* Rub your eyes. 

- When you rub your eyes, you notice something at the foot of your bed. It's the {chosen_animal}. Its button eye twitches. 
->END //explicitly declare the end
THE END
