# Some notes

As I initially started recreating the switch-based cutscene to an array-based cutscene, I quickly discovered that additional macro-like scripts are needed. For example, when moving characters around, the object's sprite needs to be managed. This can turn into 5 steps in the cutscene array, unless I roll up the entire idea of walking right into its own script. Doing this would also require something of the actors in the scene. Namely, actors would need methods or data that dictate which sprites, speeds, etc. they use when in a particular state. If a character is told that they are walking right, then they would set a sprite index to their walking right sprite, set an image speed for how fast the sprite advances through its frames, etc. RPG Maker manages this with direction and whether the sprite is walking, iirc.

So, this system would probably also help with spinning up NPCs in towns and scripting their movements about town, etc. etc. etc. Of course, I'm veering into RPG Maker territory because I'm making an RPG of sorts 😉. Still, GMS 2 provides a level of flexibility that, while I am indeed going to recreate some conveniences from RPG Maker, I will also be able to completely customize this system for whatever game I'm making. So, here goes another case where, in order to really use this particular system well, I need another sub-system created that will help keep the lines of cutscene entries down.

## Consequence of switching to arrays of arrays

In the switch approach, there is absolute control over the process. This is probably ok for smaller games and cutscenes. For an RPG of any respectable length, there will be enough cutscenes to merit using a system.

Likewise, in turning in absolute imperative control from the switch approach in exchange for the data-driven approach, we are forced to develop other systems, such as an Object Movement system to support characters walking, running, facing, and even jumping. This is not a bad thing, I think. It means we will be ultimately writing less code, and the game will have a more consistent structure. Changes to how characters look, walk, run, are able to be more easily dynamic, rather than requiring changes and checks in multiple cutscene objects.

So, basically, going data-driven results in faster iteration during the design phase whil requiring some upfront thought about classes of objects, and forcing oneself to design these systems intentionally creates an economy of scale.

And yet, if you ever need a switch-based cutscene for absolute control, you can certainly have it, while also using something faster and easier for the bulk of the game's cutscenes. This is a crucial point: I can use all of these techniques in concert with one another; each is well-suited for a particular type of cutscene.

## Dialogues...

One of my plans is to incorporate my dialogue system as a proof of concept on how to integrate these disparate game systems. I'm hoping it goes well. I will likely expand the dialogue system with some new options and features as a result of this mini-project.