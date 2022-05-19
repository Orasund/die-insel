module Gen.Union.Msg exposing (..)

{-| This module contains the Msg Union.

@docs Msg


## Is

@docs isApplyActions, isGotSeed


## If

@docs ifApplyActions, ifGotSeed


## Map

@docs mapApplyActions, mapGotSeed

-}

import Gen.Union.Action exposing (Action)
import Random exposing (Seed)



-- This is a generated file. DO NOT CHANGE ANYTHING IN HERE.


{-| Msg type
-}
type Msg
    = ApplyActions (List Action)
    | GotSeed Seed



-------------------------------------------------------------------------------
-- IS
-------------------------------------------------------------------------------


{-| Compute if the value is a ApplyActions.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isApplyActions : Msg -> Bool
isApplyActions msg =
    case msg of
        ApplyActions _ ->
            True

        GotSeed _ ->
            False


{-| Compute if the value is a GotSeed.

Useful if you don't want to do a full case distinction inside an if condition.

-}
isGotSeed : Msg -> Bool
isGotSeed msg =
    case msg of
        ApplyActions _ ->
            False

        GotSeed _ ->
            True



-------------------------------------------------------------------------------
-- IF
-------------------------------------------------------------------------------


{-| Calls a function, if the value is a ApplyActions.

You can turn the function into a getter by passing the identity as function

-}
ifApplyActions : (List Action -> out) -> Msg -> Maybe out
ifApplyActions fun msg =
    case msg of
        ApplyActions t ->
            Just (fun t)

        GotSeed a ->
            Nothing


{-| Calls a function, if the value is a GotSeed.

You can turn the function into a getter by passing the identity as function

-}
ifGotSeed : (Seed -> out) -> Msg -> Maybe out
ifGotSeed fun msg =
    case msg of
        ApplyActions a ->
            Nothing

        GotSeed t ->
            Just (fun t)



-------------------------------------------------------------------------------
-- MAP
-------------------------------------------------------------------------------


{-| Map the argument of ApplyActions.
-}
mapApplyActions : (List Action -> List Action) -> Msg -> Msg
mapApplyActions fun msg =
    case msg of
        ApplyActions t ->
            ApplyActions (fun t)

        GotSeed a ->
            GotSeed a


{-| Map the argument of GotSeed.
-}
mapGotSeed : (Seed -> Seed) -> Msg -> Msg
mapGotSeed fun msg =
    case msg of
        ApplyActions a ->
            ApplyActions a

        GotSeed t ->
            GotSeed (fun t)



-- Generated with [Elm-pen](https://orasund.github.io/elm-pen) Version 0.0.5
