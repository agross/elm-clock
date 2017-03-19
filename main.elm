module Clock exposing (..)

import Html
import Time exposing (Time)
import Time.DateTime as DT exposing (DateTime)


type alias Model =
    DateTime


type Message
    = Tick Time


main : Program Never Model Message
main =
    Html.program
        { init = ( DT.dateTime DT.zero, Cmd.none )
        , update = update
        , view = view
        , subscriptions = always everySecond
        }


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    case msg of
        Tick time ->
            ( DT.fromTimestamp time, Cmd.none )


view : Model -> Html.Html Message
view time =
    Html.text (timeString time)


timeString : DateTime -> String
timeString time =
    time |> DT.toISO8601


everySecond : Sub Message
everySecond =
    Time.every Time.second Tick
