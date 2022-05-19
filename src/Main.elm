module Main exposing (main)

import Bag
import Browser exposing (Document)
import Config
import Gen.Enum.Daytime as Daytime exposing (Daytime(..))
import Gen.Enum.Location exposing (Location(..))
import Gen.Record.Model as Model exposing (Model)
import Gen.Union.Action exposing (Action(..))
import Gen.Union.Event exposing (Event(..))
import Gen.Union.Msg exposing (Msg(..))
import Html
import Html.Attributes
import Markdown
import Random
import View.Daytime
import View.Event
import View.Location


init : () -> ( Model, Cmd Msg )
init () =
    let
        sanity =
            0

        ( locationInfo, seed ) =
            Random.initialSeed 42
                |> Random.step (View.Location.info sanity Camp)
    in
    ( { satiety = 0
      , health = 0
      , sanity = sanity
      , location = Camp
      , locationInfo = locationInfo
      , event = Just Introduction
      , daytime = Night
      , seed = seed
      }
    , Cmd.none
    )


view : Model -> Document Msg
view model =
    { title = Config.title
    , body =
        [ Html.node "link"
            [ Html.Attributes.rel "stylesheet"
            , Html.Attributes.href "https://unpkg.com/terminal.css@0.7.2/dist/terminal.min.css"
            ]
            []
        , Html.node "style" [] [ Html.text Config.theme ]
        , [ case model.event of
                Just a ->
                    View.Event.view a

                Nothing ->
                    View.Location.view (View.Location.toString model.location) model.locationInfo
          , Html.hr [] []
          , model.daytime |> View.Daytime.view |> Html.text |> List.singleton |> Html.p []
          , "Sättigungsgefühl: "
                ++ String.fromInt model.satiety
                ++ " | Wohlbefinden: "
                ++ String.fromInt model.health
                ++ " | Zurechnungsfähigkeit: "
                ++ String.fromInt model.sanity
                |> Html.text
                |> List.singleton
                |> Html.p []
          ]
            |> Html.div [ Html.Attributes.style "width" "600px" ]
            |> List.singleton
            |> Html.div
                [ Html.Attributes.style "display" "flex"
                , Html.Attributes.style "align-items" "center"
                , Html.Attributes.style "display" "flex"
                , Html.Attributes.style "justify-content" "center"
                ]
        ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ApplyActions list ->
            ( list
                |> List.foldl
                    (\action ->
                        case action of
                            SetEvent maybeEvent ->
                                Model.setEvent maybeEvent

                            MapSatiety amount ->
                                Model.mapSatiety ((+) amount)

                            MapHealth amount ->
                                Model.mapHealth ((+) amount)

                            GenerateLocation ->
                                \m ->
                                    let
                                        ( locationInfo, seed ) =
                                            m.seed
                                                |> Random.step (View.Location.info m.sanity model.location)
                                    in
                                    m
                                        |> Model.setLocationInfo locationInfo
                                        |> Model.setSeed seed

                            Sleep ->
                                \m ->
                                    m
                                        |> Model.setDaytime Morning
                                        |> (if (m.satiety < -1) || (m.health < -1) then
                                                Model.mapSanity ((+) -1)

                                            else
                                                identity
                                           )

                            MoveTo location ->
                                \m ->
                                    let
                                        ( locationInfo, seed ) =
                                            m.seed
                                                |> Random.step (View.Location.info m.sanity location)
                                    in
                                    m
                                        |> Model.setLocation location
                                        |> Model.setLocationInfo locationInfo
                                        |> Model.setSeed seed
                                        |> (case m.daytime |> Daytime.next of
                                                Nothing ->
                                                    Model.setEvent (Just GoingToBed)

                                                Just daytime ->
                                                    Model.setDaytime daytime
                                           )

                            MapSanity amount ->
                                Model.mapSanity ((+) amount)
                    )
                    model
                |> (\m ->
                        if (m.satiety <= -5) || (m.health <= -5) || (m.sanity <= -5) then
                            { m | event = { satiety = m.satiety, health = m.health, sanity = m.sanity } |> Dead |> Just }

                        else
                            m
                   )
            , Cmd.none
            )

        GotSeed seed ->
            ( Model.setSeed seed model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
