--Diese Funktion laesst die Turtel einen Baum faellen.
--Es wird erwartet, dass sich die Turtel vor dem Aufruf
--der Funktion ein Block über dem Boden und ein Block
--vor dem zufaellenden Baum befindet. Ist das Faellen des Baumes
--abgeschlossen, befindet sich die Turtel wieder auf
--ihrer startposition
local function choppTree()
    turtle.dig()
    turtle.forward()

    turtle.digDown()
    turtle.placeDown()

    local start = 1
    local faellhoehe = 12

    for i=start,faellhoehe do
        turtle.digUp()
        turtle.up()
    end

    for i=start,faellhoehe do
        turtle.down()
    end
    
    turtle.back()
end

--Es wird davon ausgegangen, dass ein Block vor und hinter der Turtel jeweils eine Bahn
--befindlich ist. Diese Bahnen existieren nicht wirklich, dienen der Turtle aber dazu, genau
--die faellplaetze anzusteuern.
--Diese Funktion bewegt die Turtel auf dieser Bahn. Es ist die laufweite, also
--wie weit die Turtel nach links oder rechts laufen soll anzugeben, negative und
--positive werte sind entsprechend moeglich. Des weiteren ist die bahn anzugeben.
--Die obere bahn hat die bahnId 0, die untere, die bahnId 1. Die Funktion ist nur
--wirksahm, wenn die Turtel auf ihrer startposition steht.
local function bahnpositionAendern(bahnId, laufweite)

    --steuert die obere Bahn an
    if tonumber(bahnId)==0 then
        
        turtle.up()
        turtle.forward()

        --laesst die turtel nach links laufen
        if tonumber(laufweite)<=0 then
            turtle.turnLeft()
            for i=1,-1*laufweite do
                turtle.forward()
            end
            turtle.turnRight()
        else --laesst die Turtle nach rechts laufen
            turtle.turnRight()
            for i=1,laufweite do
                turtle.forward()
            end
            turtle.turnLeft()
        end
    end

    --steuert die untere Bahn an
    if tonumber(bahnId)==1 then
    
        turtle.up()
        turtle.turnLeft()
        turtle.turnLeft()
        turtle.forward()

        --laesst die turtel nach links laufen
        if tonumber(laufweite)<=0 then
           turtle.turnRight()
            for i=1,-1*laufweite do
                turtle.forward()
            end
            turtle.turnLeftt()
        else --laesst die Turtle nach rechts laufen
            turtle.turnLeft()
            for i=1,laufweite do
                turtle.forward()
            end
            turtle.turnRight()
        end
    end    
end

--bahnId beschreibt, ob die obere oder die Untere Bahn angesteuert werden soll
local function choppA(bahnId)
        bahnpositionAendern(bahnId, -4)
        choppTree()

        --obere Bahn
        if tonumber(bahnId)==0 then
            turtle.turnRight()
        else
            turtle.turnLeft()
        end

        for i=1,4 do
            turtle.forward()
        end

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.down()
    else --untere Bahn
        turtle.turnLeft()
        turtle.forward()
        turtle.down()
    end
end

local function choppB(bahnId)

    bahnpositionAendern(bahnId, -1)
    for i=1,5 do
        turtle.forward()
    end
    choppTree()
    turtle.turnRight()
    turtle.turnRight()
    for i=1,5 do
        turtle.forward()
    end

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnLeft()
    else
        turtle.turnRight()
    end

    turtle.forward()

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnRight()
        turtle.forward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.down()
    else --untere Bahn
        turtle.turnLeft()
        turtle.forward()
        turtle.down()
    end
end

local function choppC(bahnId)

    bahnpositionAendern(bahnId, 1)
    for i=1,10 do
        turtle.forward()
    end
    choppTree()
    turtle.turnRight()
    turtle.turnRight()
    for i=1,10 do
        turtle.forward()
    end

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end

    turtle.forward()

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.down()
    else --untere Bahn
        turtle.turnRight()
        turtle.forward()
        turtle.down()
    end
end

local function choppD(bahnId)

    bahnpositionAendern(bahnId, 4)
    for i=1,5 do
        turtle.forward()
    end
    choppTree()
    turtle.turnRight()
    turtle.turnRight()
    for i=1,5 do
        turtle.forward()
    end

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnRight()
    else
        turtle.turnLeft()
    end

    for i=1,3 do
        turtle.forward()
    end

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.down()
    else --untere Bahn
        turtle.turnRight()
        turtle.forward()
        turtle.down()
    end
end

local function choppE(bahnId)

    bahnpositionAendern(bahnId, 6)
    choppTree()

    -- obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnLeft()
    else
        turtle.turnRight()
    end

    for i=1,6 do
        turtle.forward()
    end

    --obere Bahn
    if tonumber(bahnId)==0 then
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight()
        turtle.turnRight()
        turtle.down()
    else --untere Bahn
        turtle.turnRight()
        turtle.forward()
        turtle.down()
    end
end

choppA(1)
chopB(1)
chopC(1)
choppD(1)
choppE(1)
