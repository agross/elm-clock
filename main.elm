module Clock exposing (..)

import Html
import Time exposing (Time)


type alias Model =
    Time


type Message
    = Tick Time


main : Program Never Time Message
main =
    Html.program
        { init = ( 0, Cmd.none )
        , update = update
        , view = view
        , subscriptions = always everySecond
        }


update : Message -> Model -> ( Model, Cmd Message )
update msg model =
    ( model, Cmd.none )


view : Model -> Html.Html Message
view time =
    Html.text (toString time)


everySecond : Sub Message
everySecond =
    Time.every Time.second Tick
