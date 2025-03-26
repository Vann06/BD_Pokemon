-- Insertar sets únicos
INSERT INTO card_sets (set_name, release_date)
SELECT DISTINCT set_name, release_date
FROM raw_data
WHERE set_name IS NOT NULL;

-- Insertar cartas 
INSERT INTO pokemon_cards (
    id, name, pokedex_number, supertype, subtypes, hp, retreat_cost,
    set_id, artist, rarity, tcg_player_url
)
SELECT 
    r.id, r.name, FLOOR(r.pokedex_number)::INT, r.supertype, r.subtypes, r.hp, r.retreat_cost,
    s.id, r.artist, r.rarity, r.tcg_player_url
FROM raw_data r
JOIN card_sets s ON r.set_name = s.set_name AND r.release_date = s.release_date
ON CONFLICT (id) DO NOTHING;

-- Insertar precios
INSERT INTO pokemon_card_prices (
    card_id, tcg_price_date,
    tcg_market_price_usd_normal, tcg_low_price_usd_normal, tcg_high_price_usd_normal,
    tcg_market_price_usd_reverse_holofoil, tcg_low_price_usd_reverse_holofoil, tcg_high_price_usd_reverse_holofoil,
    tcg_market_price_usd_holofoil, tcg_low_price_usd_holofoil, tcg_high_price_usd_holofoil
)
SELECT
    id, tcg_price_date,
    tcg_market_price_usd_normal, tcg_low_price_usd_normal, tcg_high_price_usd_normal,
    tcg_market_price_usd_reverse_holofoil, tcg_low_price_usd_reverse_holofoil, tcg_high_price_usd_reverse_holofoil,
    tcg_market_price_usd_holofoil, tcg_low_price_usd_holofoil, tcg_high_price_usd_holofoil
FROM raw_data
WHERE tcg_price_date IS NOT NULL;

-- Insertar tipos
INSERT INTO card_types (card_id, types)
SELECT id, types
FROM raw_data
WHERE types IS NOT NULL;

-- Insertar ataques
INSERT INTO card_attacks (card_id, attacks)
SELECT id, attacks
FROM raw_data
WHERE attacks IS NOT NULL;

-- Insertar debilidades
INSERT INTO card_weaknesses (card_id, weaknesses)
SELECT id, weaknesses
FROM raw_data
WHERE weaknesses IS NOT NULL;


-- Ahora que los datos esten en las tablas,
-- se puede borrar opcionalmente la tabla raw_data
-- DROP TABLE raw_data;
