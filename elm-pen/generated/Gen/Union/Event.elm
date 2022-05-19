module Gen.Union.Event exposing (..)

{-| This module contains the Event Union.

@docs Event


## Is

@docs isIntroduction, isDead, isGoingToBed


## If

@docs ifDead


## Map

@docs mapDead

-}

-- This is a generated file. DO NOT CHANGE ANYTHING IN HERE.


{-| Event type
-}
type Event
    = Introduction
    | Dead { satiety : Int, health : Int, sanity : Int }
    | GoingToBed



-------------------------------------------------------------------------------
-- IS
-------------------------------------------------------------------------------


{-| Compute if the value is a Introduction.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isIntroduction : Event -> Bool
isIntroduction event =
    case event of
        Introduction ->
            True

        Dead _ ->
            False

        GoingToBed ->
            False


{-| Compute if the value is a Dead.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isDead : Event -> Bool
isDead event =
    case event of
        Introduction ->
            False

        Dead _ ->
            True

        GoingToBed ->
            False


{-| Compute if the value is a GoingToBed.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isGoingToBed : Event -> Bool
isGoingToBed event =
    case event of
        Introduction ->
            False

        Dead _ ->
            False

        GoingToBed ->
            True



-------------------------------------------------------------------------------
-- IF
-------------------------------------------------------------------------------


{-| Calls a function, if the value is a Dead.

You can turn the function into a getter by passing the identity as function

-}
ifDead : ({ satiety : Int, health : Int, sanity : Int } -> out) -> Event -> Maybe out
ifDead fun event =
    case event of
        Introduction ->
            Nothing

        Dead t ->
            Just (fun t)

        GoingToBed ->
            Nothing



-------------------------------------------------------------------------------
-- MAP
-------------------------------------------------------------------------------


{-| Map the argument of Dead.
-}
mapDead : ({ satiety : Int, health : Int, sanity : Int } -> { satiety : Int, health : Int, sanity : Int }) -> Event -> Event
mapDead fun event =
    case event of
        Introduction ->
            Introduction

        Dead t ->
            Dead (fun t)

        GoingToBed ->
            GoingToBed



-- Generated with [Elm-pen](https://orasund.github.io/elm-pen) Version 0.0.5
