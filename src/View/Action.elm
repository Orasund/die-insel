module View.Action exposing (..)

import Gen.Union.Action exposing (Action)
import Gen.Union.Msg exposing (Msg(..))
import Html exposing (Html)
import Html.Attributes
import Html.Events


type alias ActionInfo =
    { label : String
    , onClick : List Action
    }


view : ActionInfo -> Html Msg
view action =
    Html.button
        [ Html.Attributes.class "btn btn-default"
        , action.onClick |> ApplyActions |> Html.Events.onClick
        ]
        [ Html.text action.label ]
