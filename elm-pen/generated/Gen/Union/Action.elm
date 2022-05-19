module Gen.Union.Action exposing (..)

{-| This module contains the Action Union.

@docs Action


## Is

@docs isSetEvent, isMapSatiety, isMapHealth, isMapSanity, isMoveTo, isGenerateLocation, isSleep


## If

@docs ifSetEvent, ifMapSatiety, ifMapHealth, ifMapSanity, ifMoveTo


## Map

@docs mapSetEvent, mapMapSatiety, mapMapHealth, mapMapSanity, mapMoveTo

-}

import Gen.Enum.Location exposing (Location)
import Gen.Union.Event exposing (Event)



-- This is a generated file. DO NOT CHANGE ANYTHING IN HERE.


{-| Action type
-}
type Action
    = SetEvent (Maybe Event)
    | MapSatiety Int
    | MapHealth Int
    | MapSanity Int
    | MoveTo Location
    | GenerateLocation
    | Sleep



-------------------------------------------------------------------------------
-- IS
-------------------------------------------------------------------------------


{-| Compute if the value is a SetEvent.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isSetEvent : Action -> Bool
isSetEvent action =
    case action of
        SetEvent _ ->
            True

        MapSatiety _ ->
            False

        MapHealth _ ->
            False

        MapSanity _ ->
            False

        MoveTo _ ->
            False

        GenerateLocation ->
            False

        Sleep ->
            False


{-| Compute if the value is a MapSatiety.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isMapSatiety : Action -> Bool
isMapSatiety action =
    case action of
        SetEvent _ ->
            False

        MapSatiety _ ->
            True

        MapHealth _ ->
            False

        MapSanity _ ->
            False

        MoveTo _ ->
            False

        GenerateLocation ->
            False

        Sleep ->
            False


{-| Compute if the value is a MapHealth.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isMapHealth : Action -> Bool
isMapHealth action =
    case action of
        SetEvent _ ->
            False

        MapSatiety _ ->
            False

        MapHealth _ ->
            True

        MapSanity _ ->
            False

        MoveTo _ ->
            False

        GenerateLocation ->
            False

        Sleep ->
            False


{-| Compute if the value is a MapSanity.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isMapSanity : Action -> Bool
isMapSanity action =
    case action of
        SetEvent _ ->
            False

        MapSatiety _ ->
            False

        MapHealth _ ->
            False

        MapSanity _ ->
            True

        MoveTo _ ->
            False

        GenerateLocation ->
            False

        Sleep ->
            False


{-| Compute if the value is a MoveTo.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isMoveTo : Action -> Bool
isMoveTo action =
    case action of
        SetEvent _ ->
            False

        MapSatiety _ ->
            False

        MapHealth _ ->
            False

        MapSanity _ ->
            False

        MoveTo _ ->
            True

        GenerateLocation ->
            False

        Sleep ->
            False


{-| Compute if the value is a GenerateLocation.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isGenerateLocation : Action -> Bool
isGenerateLocation action =
    case action of
        SetEvent _ ->
            False

        MapSatiety _ ->
            False

        MapHealth _ ->
            False

        MapSanity _ ->
            False

        MoveTo _ ->
            False

        GenerateLocation ->
            True

        Sleep ->
            False


{-| Compute if the value is a Sleep.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isSleep : Action -> Bool
isSleep action =
    case action of
        SetEvent _ ->
            False

        MapSatiety _ ->
            False

        MapHealth _ ->
            False

        MapSanity _ ->
            False

        MoveTo _ ->
            False

        GenerateLocation ->
            False

        Sleep ->
            True



-------------------------------------------------------------------------------
-- IF
-------------------------------------------------------------------------------


{-| Calls a function, if the value is a SetEvent.

You can turn the function into a getter by passing the identity as function

-}
ifSetEvent : (Maybe Event -> out) -> Action -> Maybe out
ifSetEvent fun action =
    case action of
        SetEvent t ->
            Just (fun t)

        MapSatiety a ->
            Nothing

        MapHealth a ->
            Nothing

        MapSanity a ->
            Nothing

        MoveTo a ->
            Nothing

        GenerateLocation ->
            Nothing

        Sleep ->
            Nothing


{-| Calls a function, if the value is a MapSatiety.

You can turn the function into a getter by passing the identity as function

-}
ifMapSatiety : (Int -> out) -> Action -> Maybe out
ifMapSatiety fun action =
    case action of
        SetEvent a ->
            Nothing

        MapSatiety t ->
            Just (fun t)

        MapHealth a ->
            Nothing

        MapSanity a ->
            Nothing

        MoveTo a ->
            Nothing

        GenerateLocation ->
            Nothing

        Sleep ->
            Nothing


{-| Calls a function, if the value is a MapHealth.

You can turn the function into a getter by passing the identity as function

-}
ifMapHealth : (Int -> out) -> Action -> Maybe out
ifMapHealth fun action =
    case action of
        SetEvent a ->
            Nothing

        MapSatiety a ->
            Nothing

        MapHealth t ->
            Just (fun t)

        MapSanity a ->
            Nothing

        MoveTo a ->
            Nothing

        GenerateLocation ->
            Nothing

        Sleep ->
            Nothing


{-| Calls a function, if the value is a MapSanity.

You can turn the function into a getter by passing the identity as function

-}
ifMapSanity : (Int -> out) -> Action -> Maybe out
ifMapSanity fun action =
    case action of
        SetEvent a ->
            Nothing

        MapSatiety a ->
            Nothing

        MapHealth a ->
            Nothing

        MapSanity t ->
            Just (fun t)

        MoveTo a ->
            Nothing

        GenerateLocation ->
            Nothing

        Sleep ->
            Nothing


{-| Calls a function, if the value is a MoveTo.

You can turn the function into a getter by passing the identity as function

-}
ifMoveTo : (Location -> out) -> Action -> Maybe out
ifMoveTo fun action =
    case action of
        SetEvent a ->
            Nothing

        MapSatiety a ->
            Nothing

        MapHealth a ->
            Nothing

        MapSanity a ->
            Nothing

        MoveTo t ->
            Just (fun t)

        GenerateLocation ->
            Nothing

        Sleep ->
            Nothing



-------------------------------------------------------------------------------
-- MAP
-------------------------------------------------------------------------------


{-| Map the argument of SetEvent.
-}
mapSetEvent : (Maybe Event -> Maybe Event) -> Action -> Action
mapSetEvent fun action =
    case action of
        SetEvent t ->
            SetEvent (fun t)

        MapSatiety a ->
            MapSatiety a

        MapHealth a ->
            MapHealth a

        MapSanity a ->
            MapSanity a

        MoveTo a ->
            MoveTo a

        GenerateLocation ->
            GenerateLocation

        Sleep ->
            Sleep


{-| Map the argument of MapSatiety.
-}
mapMapSatiety : (Int -> Int) -> Action -> Action
mapMapSatiety fun action =
    case action of
        SetEvent a ->
            SetEvent a

        MapSatiety t ->
            MapSatiety (fun t)

        MapHealth a ->
            MapHealth a

        MapSanity a ->
            MapSanity a

        MoveTo a ->
            MoveTo a

        GenerateLocation ->
            GenerateLocation

        Sleep ->
            Sleep


{-| Map the argument of MapHealth.
-}
mapMapHealth : (Int -> Int) -> Action -> Action
mapMapHealth fun action =
    case action of
        SetEvent a ->
            SetEvent a

        MapSatiety a ->
            MapSatiety a

        MapHealth t ->
            MapHealth (fun t)

        MapSanity a ->
            MapSanity a

        MoveTo a ->
            MoveTo a

        GenerateLocation ->
            GenerateLocation

        Sleep ->
            Sleep


{-| Map the argument of MapSanity.
-}
mapMapSanity : (Int -> Int) -> Action -> Action
mapMapSanity fun action =
    case action of
        SetEvent a ->
            SetEvent a

        MapSatiety a ->
            MapSatiety a

        MapHealth a ->
            MapHealth a

        MapSanity t ->
            MapSanity (fun t)

        MoveTo a ->
            MoveTo a

        GenerateLocation ->
            GenerateLocation

        Sleep ->
            Sleep


{-| Map the argument of MoveTo.
-}
mapMoveTo : (Location -> Location) -> Action -> Action
mapMoveTo fun action =
    case action of
        SetEvent a ->
            SetEvent a

        MapSatiety a ->
            MapSatiety a

        MapHealth a ->
            MapHealth a

        MapSanity a ->
            MapSanity a

        MoveTo t ->
            MoveTo (fun t)

        GenerateLocation ->
            GenerateLocation

        Sleep ->
            Sleep



-- Generated with [Elm-pen](https://orasund.github.io/elm-pen) Version 0.0.5
