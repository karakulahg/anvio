module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Model, defaultModel)
import Plot exposing (plotData)
import Set exposing (..)
import Types exposing (Contig, Gene)



-- Flags


type alias Flags =
    { data :
        { contigs : List Contig
        , genes : List Gene
        }
    }



-- Msg


type Msg
    = NoOp
    | UpdateParam String String



-- MAIN


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- INIT


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { defaultModel
        | contigs = flags.data.contigs
        , genes = flags.data.genes
      }
    , Cmd.none
    )



-- VIEW


view : Model -> Browser.Document msg
view model =
    { title = "Anvi'o Genome Viewer"
    , body =
        [ div [ class "o-grid--full" ]
            [ div [ class "o-grid__cell" ]
                [ plotData model ]
            , node "aside"
                [ class "o-drawer u-highest o-drawer--left o-drawer--visible" ]
                -- DEBUG
                [ text (String.fromInt (List.length model.contigs)) ]
            ]
        ]
    }



-- plotData
-- model
-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )
