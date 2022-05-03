--Diese Funktion lässt die Turtel einen Baum fällen.
--Es wird erwartet, dass sich die Turtel vor dem Aufruf
--der Funktion ein Block über dem Boden und ein Block
--vor dem zufällenden Baum befindet. Ist das Fällen des Baumes
--abgeschlossen, befindet sich die Turtel wieder auf
--ihrer startposition
local function choppTree()
    turtle.dig()
    turtle.forward()

    turtle.digDown()
    turtle.placeDown()

    start=1
    fällhöhe=12

    for i=start,fällhöhe do
        turtle.digUp()
        turtle.up()
    end

    for i=start,fällhöhe do
        turtle.down()
    end
    
    turtle.back()
end

--Es wird davon ausgegangen, dass ein Block vor und hinter der Turtel jeweils eine Bahn
--befindlich ist. Diese Bahnen existieren nicht wirklich, dienen der Turtle aber dazu, genau
--die fällplätze anzusteuern.
--Diese Funktion bewegt die Turtel auf dieser Bahn. Es ist die laufweite, also
--wie weit die Turtel nach links oder rechts laufen soll anzugeben, negative und
--positive werte sind entsprechend möglich. Des weiteren ist die bahn anzugeben.
--Die obere bahn hat die bahnId 0, die untere, die bahnId 1. Die Funktion ist nur
--wirksahm, wenn die Turtel auf ihrer startposition steht.
local function bahnpositionÄndern(bahnId, laufweite)

    --steuert die obere Bahn an
    if tonumber(bahnId)==0 then
        
        turtle.up()
        turtle.forward()

        --lässt die turtel nach links laufen
        if tonumber(laufweite)<=0 then
            turtle.turnLeft()
            for i=1,-1*laufweite do
                turtle.forward()
            end
            turtle.turnRight()
        else --lässt die Turtle nach rechts laufen
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

        --lässt die turtel nach links laufen
        if tonumber(laufweite)<=0 then
           turtle.turnRight()
            for i=1,-1*laufweite do
                turtle.forward()
            end
            turtle.turnLeftt()
        else --lässt die Turtle nach rechts laufen
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
        bahnpositionÄndern(bahnId, -4)
        choppTree()
        turtle.turnLeft()
        for i=1,4 do
            turtle.forward()
        end
        turtle.turnLeft()
        turtle.forward()
        turtle.down()
end

local function choppB(bahnId)

    bahnpositionÄndern(bahnId, -1)
    for i=1,5 do
        turtle.forward()
    end
    choppTree()
    turtle.turnRight()
    turtle.turnRight()
    for i=1,5 do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.forward()
    turtle.turnLeft()
    turtle.forward()
    turtle.down()
end

local function choppC(bahnId)

    bahnpositionÄndern(bahnId, 1)
    for i=1,10 do
        turtle.forward()
    end
    choppTree()
    turtle.turnRight()
    turtle.turnRight()
    for i=1,10 do
        turtle.forward()
    end
    turtle.turnLeft()
    turtle.forward()
    turtle.turnRight()
    turtle.forward()
    turtle.down()
end

local function choppD(bahnId)

    bahnpositionÄndern(bahnId, 4)
    for i=1,5 do
        turtle.forward()
    end
    choppTree()
    turtle.turnRight()
    turtle.turnRight()
    for i=1,5 do
        turtle.forward()
    end
    turtle.turnLeft() --oder turnRight hängt von der bahnId ab...
    for i=1,3 do 
        turtle.forward()
    end
    turtle.turnRight()
    turtle.forward()
    turtle.down()
end

local function choppE(bahnId)

    bahnpositionÄndern(bahnId, 6)
    choppTree()
    turtle.turnRight()
    for i=1,6 do
        turtle.forward()
    end
    turtle.turnRight()
    turtle.forward()
    turtle.down()
end

choppA()
chopB()
chopC()
choppD()
choppE()
