module Maybe exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Nothing ->
            "Mighty Magician"

        Just existingName ->
            existingName


revive : Player -> Maybe Player
revive player =
    if player.health <= 0 && player.level >= 10 then
        Just { player | health = 100, mana = Just 100 }

    else if player.health <= 0 && player.level < 10 then
        Just { player | health = 100, mana = Nothing }

    else
        Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Nothing ->
            ( { player
                | health =
                    if player.health - manaCost < 0 then
                        0

                    else
                        player.health - manaCost
              }
            , 0
            )

        Just mana ->
            if mana <= manaCost then
                ( player, 0 )

            else
                ( { player | mana = Just (mana - manaCost) }, 2 * manaCost )
