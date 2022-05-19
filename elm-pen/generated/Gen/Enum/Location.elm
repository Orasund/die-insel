module Gen.Enum.Location exposing (..)

{-| Module generated by [Elm-Pen](https://orasund.github.io/elm-pen).

This module contains the Location Enum.

    type Location
        = Camp
        | Woods
        | Beach
        | Ruin


# Basics

@docs Location, asList, first, next, prev, last


# Converters

@docs toInt, fromInt, toString, fromString

-}

import Array exposing (Array)



-- This is a generated file. DO NOT CHANGE ANYTHING IN HERE.
-------------------------------------------------------------------------------
-- BASICS
-------------------------------------------------------------------------------


{-| Location type.
-}
type Location
    = Camp
    | Woods
    | Beach
    | Ruin


{-| Lists all possible values of Location

    asList : List Location
    asList =
        [ Camp
        , Woods
        , Beach
        , Ruin
        ]

-}
asList : List Location
asList =
    [ Camp
    , Woods
    , Beach
    , Ruin
    ]


{-| Get the first constructor of the Location

    first : Location
    first =
        Camp

-}
first : Location
first =
    Camp


{-| Get the next Location.

Returns Nothing if its the last

-}
next : Location -> Maybe Location
next location =
    location
        |> toInt
        |> (+) 1
        |> fromInt


{-| Get the next Location.

Returns Nothing if its the first

-}
prev : Location -> Maybe Location
prev location =
    location
        |> toInt
        |> (+) -1
        |> fromInt


{-| Get the last constructor of the Location

    last : Location
    last =
        Ruin

-}
last : Location
last =
    Ruin



-------------------------------------------------------------------------------
-- CONVERTERS
-------------------------------------------------------------------------------


{-| Convert `Location` into `Int`.

    toInt : Location -> Int
    toInt arg =
        case arg of
            Camp ->
                0

            Woods ->
                1

            Beach ->
                2

            Ruin ->
                3

If you need to convert all values of Location into ints, use `asList` instead.

    asList |> List.indexedMap (\i _ -> i)
        --> asList |> List.map toInt

-}
toInt : Location -> Int
toInt location =
    case location of
        Camp ->
            0

        Woods ->
            1

        Beach ->
            2

        Ruin ->
            3


{-| Convert `Int` into `Location`

Returns `Nothing` if the values is out of bounds.

    fromInt : Int -> Maybe Location
    fromInt int =
        case int of
            0 ->
                Just Camp

            1 ->
                Just Woods

            2 ->
                Just Beach

            3 ->
                Just Ruin

            _ ->
                Nothing

-}
fromInt : Int -> Maybe Location
fromInt int =
    case int of
        0 ->
            Just Camp

        1 ->
            Just Woods

        2 ->
            Just Beach

        3 ->
            Just Ruin

        _ ->
            Nothing


{-| Convert Location into String

    toString : Location -> String
    toString arg =
        case arg of
            Camp ->
                "Camp"

            Woods ->
                "Woods"

            Beach ->
                "Beach"

            Ruin ->
                "Ruin"

-}
toString : Location -> String
toString location =
    case location of
        Camp ->
            "Camp"

        Woods ->
            "Woods"

        Beach ->
            "Beach"

        Ruin ->
            "Ruin"


{-| Convert a String into a Location

Returns Nothing if the string is not valid.

    fromString : String -> Maybe Location
    fromString arg =
        case arg of
            "Camp" ->
                Just Camp

            "Woods" ->
                Just Woods

            "Beach" ->
                Just Beach

            "Ruin" ->
                Just Ruin

            _ ->
                Nothing

-}
fromString : String -> Maybe Location
fromString string =
    case string of
        "Camp" ->
            Just Camp

        "Woods" ->
            Just Woods

        "Beach" ->
            Just Beach

        "Ruin" ->
            Just Ruin

        _ ->
            Nothing



-- Generated with [Elm-Pen](https://orasund.github.io/elm-pen) Version 0.0.5