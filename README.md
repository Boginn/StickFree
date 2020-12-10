StickFree<br>(c) Finnbogi Jökull Pétursson, 2020

Some notes:<br>
/**/<br>
The @required field 'roomDescriptions' of a new Room takes a Map, it should have 4 keys: 'FirstExplore', 'Explored', 'FirstInvestigate' and 'Investigated'

% in strings are there to split them, for example, allowing a Prompt() in between

To seed a room:
call seed(Room, String)<br>
the last entry in availableRooms and availableRoomsDescriptions
should always be the parent(itself)<br>
see InitialSeed()


To seed a room during runtime:
call seedSpawn(Room, String)<br>
it places the seed at the next to last index of the 
current room's availableRooms/availableRoomsDescriptions<br>
if connecting to other rooms make sure to add any references to those rooms.

/**/

The highest recorded score: 1896

**Walkthrough**:<br>
Look Around<br>
Pick up the RubberChicken<br>

Open left<br>
Look Around<br>
Pick up the Triangle<br>
Pick up the Key<br>

Open left<br>
Look Around<br>
Pick up the Flashlight<br>

Open back<br>
Open back to the first room<br>

Open right<br>
Look Around<br>
Pick up the ChessManual<br>
Use Key<br>
Open balcony<br>
Look Around<br>
Pick up the Square<br>
Pick up the Knob<br>

Open back

Open right<br>
Use the Flashlight<br>
Look Around<br>
Use the Knob<br>

Open door at the end of the hallway<br>
Look Around<br>
Pick up Cloth<br>

Open back<br>
Open door to the living<br>
Open door to the first room<br>
Open door to a similar room<br>
Use Cloth<br>

Open a door in front of you<br>
Use KoolAid<br>
Look Around<br>
Pick up NotationBook<br>

Open back<br>
Open door to the first room<br>
Open door to the living room<br>
Open door to the dark room<br>

Open door to the chess room<br>
Use ChessManual<br>
Read the index<br>
Select 5, the immortal game<br>
Commit to memory<br>
Use NotationBook<br>
Pick up Circle<br>

Open back<br>
Open door to the living<br>
Open door to the first room<br>
Use Triangle<br>
Use Square<br>
Use Circle<br>

Open door to the lobby<br>
Look Around<br>
Use RubberChicken<br>

**Optional**:<br>
Go to the balcony with the ChessManual in your inventory and the flashlight turned on.<br>
Look Around once or twice and you will wake the Gargoyle.<br>
He will tell you what to do and provide a map for lots of bonus points.<br>
Careful though if you're going for max points, antagonizing the gargoyle subtracts points as well as turning off the flashlight.

