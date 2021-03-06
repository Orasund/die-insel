module Gen.Enum.Daytime exposing (..)

{-| Module generated by [Elm-Pen](https://orasund.github.io/elm-pen).

This module contains the Daytime Enum.

    type Daytime
        = Morning
        | Midday
        | Evening
        | Night


# Basics

@docs Daytime, asList, first, next, prev, last


# Converters

@docs toInt, fromInt, toString, fromString

-}

import Array exposing (Array)



-- This is a generated file. DO NOT CHANGE ANYTHING IN HERE.
-------------------------------------------------------------------------------
-- BASICS
-------------------------------------------------------------------------------


{-| Daytime type.
-}
type Daytime
    = Morning
    | Midday
    | Evening
    | Night


{-| Lists all possible values of Daytime

    asList : List Daytime
    asList =
        [ Morning
        , Midday
        , Evening
        , Night
        ]

-}
asList : List Daytime
asList =
    [ Morning
    , Midday
    , Evening
    , Night
    ]


{-| Get the first constructor of the Daytime

    first : Daytime
    first =
        Morning

-}
first : Daytime
first =
    Morning


{-| Get the next Daytime.

Returns Nothing if its the last

-}
next : Daytime -> Maybe Daytime
next daytime =
    daytime
        |> toInt
        |> (+) 1
        |> fromInt


{-| Get the next Daytime.

Returns Nothing if its the first

-}
prev : Daytime -> Maybe Daytime
prev daytime =
    daytime
        |> toInt
        |> (+) -1
        |> fromInt


{-| Get the last constructor of the Daytime

    last : Daytime
    last =
        Night

-}
last : Daytime
last =
    Night



-------------------------------------------------------------------------------
-- CONVERTERS
-------------------------------------------------------------------------------


{-| Convert `Daytime` into `Int`.

    toInt : Daytime -> Int
    toInt arg =
        case arg of
            Morning ->
                0

            Midday ->
                1

            Evening ->
                2

            Night ->
                3

If you need to convert all values of Daytime into ints, use `asList` instead.

    asList |> List.indexedMap (\i _ -> i)
        --> asList |> List.map toInt

-}
toInt : Daytime -> Int
toInt daytime =
    case daytime of
        Morning ->
            0

        Midday ->
            1

        Evening ->
            2

        Night ->
            3


{-| Convert `Int` into `Daytime`

Returns `Nothing` if the values is out of bounds.

    fromInt : Int -> Maybe Daytime
    fromInt int =
        case int of
            0 ->
                Just Morning

            1 ->
                Just Midday

            2 ->
                Just Evening

            3 ->
                Just Night

            _ ->
                Nothing

-}
fromInt : Int -> Maybe Daytime
fromInt int =
    case int of
        0 ->
            Just Morning

        1 ->
            Just Midday

        2 ->
            Just Evening

        3 ->
            Just Night

        _ ->
            Nothing


{-| Convert Daytime into String

    toString : Daytime -> String
    toString arg =
        case arg of
            Morning ->
                "Morning"

            Midday ->
                "Midday"

            Evening ->
                "Evening"

            Night ->
                "Night"

-}
toString : Daytime -> String
toString daytime =
    case daytime of
        Morning ->
            "Morning"

        Midday ->
            "Midday"

        Evening ->
            "Evening"

        Night ->
            "Night"


{-| Convert a String into a Daytime

Returns Nothing if the string is not valid.

    fromString : String -> Maybe Daytime
    fromString arg =
        case arg of
            "Morning" ->
                Just Morning

            "Midday" ->
                Just Midday

            "Evening" ->
                Just Evening

            "Night" ->
                Just Night

            _ ->
                Nothing

-}
fromString : String -> Maybe Daytime
fromString string =
    case string of
        "Morning" ->
            Just Morning

        "Midday" ->
            Just Midday

        "Evening" ->
            Just Evening

        "Night" ->
            Just Night

        _ ->
            Nothing



-- Generated with [Elm-Pen](https://orasund.github.io/elm-pen) Version 0.0.5
