
The @required field 'roomDescriptions' of a new Room takes a Map, it should have 4 keys: 'FirstExplore', 'Explored', 'FirstInvestigate' and 'Investigated'

% in strings are to split them allowing a Prompt() 

To seed a room:
add it to the availableRooms list for the object,
add a corresponding string in the sAvailableRooms list for the object,
the last entry in availableRooms and sAvailableRooms
should always be the parent room so make sure the index 
of those is the second to last.

example: To seed the room NEWROOM
       
        PARENTROOM.availableRooms
            .insert(darkRoom.availableRooms.indexOf(PARENTROOM), NEWROOM);
        PARENTROOM.sAvailableRooms.insert(
            PARENTROOM.availableRooms.indexOf(PARENTROOM) - 1,
            'A door to the left');

