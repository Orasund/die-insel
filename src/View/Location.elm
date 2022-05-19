module View.Location exposing (..)

import Gen.Enum.Location exposing (Location(..))
import Gen.Union.Action exposing (Action(..))
import Gen.Union.Event exposing (Event(..))
import Gen.Union.Msg exposing (Msg)
import Html exposing (Html)
import Markdown
import Random exposing (Generator)
import View.Action exposing (ActionInfo)


type alias LocationInfo =
    { description : String
    , locations : List Location
    , actions : List ActionInfo
    }


toString : Location -> String
toString location =
    case location of
        Camp ->
            "Dein Lager"

        Woods ->
            "Im Wald"

        Beach ->
            "Am Strand"

        Ruin ->
            "Alte Ruine"


info : Int -> Location -> Generator LocationInfo
info sanity event =
    case event of
        Camp ->
            { description = """
Dein Lager liegt auf einem Hügel in der Nähe des Strands.

Es ist nicht viel, aber es muss genügen. Fürs erste.

Die Ausicht hat etwas beruhigendes an sich. Du merkst wie sich deine Gedanken wieder sammeln.

Wenn du hier schlafst, bist du morgen wieder etwas zurechnungsfähiger.

"""
            , locations = [ Woods, Beach ]
            , actions = [ { label = "Schlafen gehen", onClick = [ MapSanity 1, SetEvent (Just GoingToBed) ] } ]
            }
                |> Random.constant

        Woods ->
            Random.weighted
                ( 1, { description = "", actions = [] } )
                [ ( 1
                  , { description = "Eine Gruppe großer Pilze wachsen unter einem der Bäume. Sie sind vermutlich giftig aber was sollst du sonst essen?"
                    , actions = [ { label = "Pilze essen", onClick = [ MapSatiety 1, MapHealth -1, GenerateLocation ] } ]
                    }
                  )
                ]
                |> Random.map
                    (\{ description, actions } ->
                        { description =
                            """
Der Wald ist dicht und dunkel. Hin und wieder hörst du ein Knachsen oder ein Rascheln.

Es fühlt sich an, as wäre der Wald voller Wesen. Wesen die dich beobachten und dir folgen, während du durch den Wald stolperst.
"""
                                ++ "\n\n"
                                ++ description
                        , locations =
                            (if sanity < -3 then
                                []

                             else
                                [ Camp ]
                            )
                                ++ (if sanity < 0 then
                                        [ Ruin ]

                                    else
                                        []
                                   )
                        , actions = actions
                        }
                    )

        Beach ->
            Random.weighted
                ( 2, { description = "", actions = [] } )
                [ ( 1
                  , { description = "Halb angespült findest du einen toten Kraken. Gebraten könnte das tatsächlich eine gute Malzet sein."
                    , actions = [ { label = "Kraken braten", onClick = [ MapSatiety 2, MapSanity -1, GenerateLocation ] } ]
                    }
                  )
                ]
                |> Random.map
                    (\{ description, actions } ->
                        { description =
                            """
Der Strand ist sehr heiß mit nur wenig Schatten. Du versuchst dich zu beeilen um nicht von der Hitze zu kollabieren.

Eine Abdrücke von Tiere sind zu sehen. Welches Tier wohl so große Tatzen besitzt?
"""
                                ++ "\n\n"
                                ++ description
                        , locations = [ Camp ]
                        , actions = actions
                        }
                    )

        Ruin ->
            { description =
                """
Mitten im Wald ist eine alte Ruine.

Sie ist voller umbekannter Symbolik und Runen einer alten Zeit.

Wie seltsam, dass soetwas hier mitten in der Insel zu finden ist.

Um die Ruine herum sind violette Beeren, sie wirken etwas unheimlich, schmecken aber unbeschreibar gut.
Während du die Beeren isst fühlst du dich wieder besser.
"""
            , locations = [ Woods ]
            , actions = [ { label = "Beeren essen", onClick = [ MapSatiety 1, MapHealth 1, MapSanity -1 ] } ]
            }
                |> Random.constant


view : String -> LocationInfo -> Html Msg
view title { description, actions, locations } =
    [ [ "# " ++ title ++ "\n" ++ description |> Markdown.toHtml [] ]
    , actions |> List.map View.Action.view
    , [ Html.br [] [], Html.br [] [], "## Reisen" |> Markdown.toHtml [] ]
    , locations
        |> List.map
            (\location ->
                View.Action.view
                    { label = location |> toString
                    , onClick = [ MoveTo location ]
                    }
            )
    ]
        |> List.concat
        |> Html.div []
