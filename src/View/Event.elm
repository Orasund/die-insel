module View.Event exposing (..)

import Gen.Union.Action exposing (Action(..))
import Gen.Union.Event exposing (Event(..))
import Gen.Union.Msg exposing (Msg)
import Html exposing (Html)
import Markdown
import View.Action exposing (ActionInfo)


type alias EventInfo =
    { title : String
    , description : String
    , actions : List ActionInfo
    }


info : Event -> EventInfo
info event =
    case event of
        Introduction ->
            { title = "Der letzte Proviant"
            , description = """
Du blickst auf das Meer hinaus, wärend du mit deinen Fingern die letzten Bohnen aus der Dose vor dir isst.

Der Proviant wird langsam knapp und du hast auf dieser Insel noch immer keine essbare Nahrung gefunden.

Du schaust der Sonne noch beim Untergehen zu und dann legst auch du dich zum schlafen nieder.
            """
            , actions = [ { label = "Weiter", onClick = [ SetEvent Nothing, Sleep ] } ]
            }

        Dead { satiety, health, sanity } ->
            if sanity <= -5 then
                { title = "Selbstmord"
                , description = """
Du wanders zielos umher, bis du irgendwann an eine unbekannte Bucht gelangst.

Das Wasser in der Bucht zieht dich magisch an. "Komm zu mir" hörst du eine Stimme sagen.

Am Grund der Bucht siehst du wie sich etwas rießiges bewegt. Um so länger du hinschaust, umso faszinierter bist du von diesem Wesen.

Du springst in die Bucht und tauchst in Richtung des Wesens. Es kommt dir zu Hilfe. Mit seinen Tentakelarmen umarmt es dich saft.

Dann zieht es dich plötzlich ruckartig in die Tiefe. Deine letzte Luft entweicht dir vor lauter schreck.

Du versuchst nach Luft zu schnappen, doch um dich herum ist nur Wasser.

Deine Lungen füllen sich mit Wasser während du versuchst aufzutauchen, doch die Tentakelarme ziehen dich weiter nach unten.

"Bleib doch noch ein bischen" hörst du eine Stimme sagen und sofort hörst du auf dich zu wehren.

Vielleicht solltest du dich nicht dagegen wären. Vielleicht ist es besser so.

Dein Bewusstsein verschwimmt, während das Wesen dir belustigt beim Sterben zusieht.
"""
                , actions = []
                }

            else if satiety <= -5 then
                { title = "Verhungert"
                , description = """
Dein Hunger hat deinen Verstand komplett besessen.

Du kniest am Boden und wühlst nach Würmern und Insekten. Doch diese können deinen unendlichen Hunger nicht stillen.

Die Energie entschwindet deinem Körper und du sinkst zu Boden.

Aus deinem Augenwinkel siehst du eine schwarze Gestalt. Sie kommt langsam auf dich zu, während du reglos am Boden liegst.

Bei dir angekommen beugt sie sich zu dir hinab und fängt an, an deinen Füßen zu nagen. Du möchstest schreien, doch dir fehlt die Kraft dazu.

Langsam verlässt dich dein Bewusstsein, während das Wesen ein Körperteil nach dem anderen verschlingt.
"""
                , actions = []
                }

            else if health <= -5 then
                { title = "Vergiftet"
                , description = """
Dir ist etwas schwindelig und du musst hin und wieder würgen.

Dann fällst du auf einmal zu Boden und kotzt Blut. Viel Blut. Dir weicht die ganze Farbe vom Gesicht und regungslos fällst du in deine eigene Blutlache.

Einige Zeit liegst du nur da, hast kein Gefühl von Zeit mehr, als plötzlich jemand oder etwas dich hochhebt und an den Armen und Füßen trägt.

Du wirst auf etwas kaltes und hartes gehift. Es fällt dir schwer klar zu sehen, doch du bildest dir ein, dass Gestalten in roten Roben in einem Kreis um dich herum stehen.

Dann kommt einer der Gestalten auf dich zu, in der Hand einen Dolch. Er setzt den Dolch an deiner Kehle an und durchschneidet sie in einer glatten Bewegung.

Dein Bewusstsein verblasst langsam, während das Blut aus dir herausströmt.
"""
                , actions = []
                }

            else
                { title = "Tod"
                , description = """Du bist tod."""
                , actions = []
                }

        GoingToBed ->
            { title = "Schlafen gehen"
            , description = """
Deine Augen sind schon ganz schwer und so beschließt du schlafen zu gehen.

Du rollst dich auf dem Boden zusammen und versuchst zu schlafen, doch dein knurrender Bauch hält dich wach.
"""
            , actions =
                [ { label = "Hungrig einschlafen"
                  , onClick = [ MapSatiety -1, SetEvent Nothing, Sleep ]
                  }
                ]
            }


view : Event -> Html Msg
view event =
    let
        { title, description, actions } =
            info event
    in
    ("# " ++ title ++ "\n" ++ description |> Markdown.toHtml [])
        :: (actions |> List.map View.Action.view)
        |> Html.div []
