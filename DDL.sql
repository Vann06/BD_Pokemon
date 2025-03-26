-- Tabla de sets de cartas
CREATE TABLE card_sets (
    id SERIAL PRIMARY KEY,
    set_name VARCHAR(255) NOT NULL,
    release_date DATE
);

-- Tabla principal de cartas Pokémon
CREATE TABLE pokemon_cards (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    pokedex_number INT NOT NULL,
    supertype VARCHAR(50) NOT NULL,
    subtypes VARCHAR(255),
    hp INT,
    retreat_cost INT,
    set_id INT REFERENCES card_sets(id),
    artist VARCHAR(255),
    rarity VARCHAR(100),
    tcg_player_url VARCHAR(500)
);

-- Tabla de precios de cartas
CREATE TABLE pokemon_card_prices (
    price_id SERIAL PRIMARY KEY,
    card_id VARCHAR(50) REFERENCES pokemon_cards(id),
    tcg_price_date DATE,
    tcg_market_price_usd_normal DECIMAL(10,2),
    tcg_low_price_usd_normal DECIMAL(10,2),
    tcg_high_price_usd_normal DECIMAL(10,2),
    tcg_market_price_usd_reverse_holofoil DECIMAL(10,2),
    tcg_low_price_usd_reverse_holofoil DECIMAL(10,2),
    tcg_high_price_usd_reverse_holofoil DECIMAL(10,2),
    tcg_market_price_usd_holofoil DECIMAL(10,2),
    tcg_low_price_usd_holofoil DECIMAL(10,2),
    tcg_high_price_usd_holofoil DECIMAL(10,2)
);

-- Tabla de tipos de Pokémon (puede haber varios por carta)
CREATE TABLE card_types (
    type_id SERIAL PRIMARY KEY,
    card_id VARCHAR(50) REFERENCES pokemon_cards(id),
    type VARCHAR(50)
);

-- Tabla de ataques por carta
CREATE TABLE card_attacks (
    attack_id SERIAL PRIMARY KEY,
    card_id VARCHAR(50) REFERENCES pokemon_cards(id),
    attack_name VARCHAR(255),
    attack_damage VARCHAR(50),
    attack_cost VARCHAR(255)
);

-- Tabla de debilidades
CREATE TABLE card_weaknesses (
    weakness_id SERIAL PRIMARY KEY,
    card_id VARCHAR(50) REFERENCES pokemon_cards(id),
    weakness_type VARCHAR(50),
    weakness_multiplier VARCHAR(10)
);
