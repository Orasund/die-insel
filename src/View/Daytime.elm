module View.Daytime exposing (..)

import Gen.Enum.Daytime exposing (Daytime(..))


view : Daytime -> String
view daytime =
    case daytime of
        Morning ->
            "Vormittag"

        Midday ->
            "Mittag"

        Evening ->
            "Nachmittag"

        Night ->
            "Abend"
