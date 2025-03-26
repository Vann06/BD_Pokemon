-- Crear tabla temporal para traer los datos del csv 
CREATE TABLE IF NOT EXISTS raw_data (
    id VARCHAR(50),
    name VARCHAR(255),
    pokedex_number DECIMAL(5,1),
    supertype VARCHAR(50),
    subtypes VARCHAR(255),
    hp INT,
    types VARCHAR(255),
    attacks TEXT,
    weaknesses TEXT,
    retreat_cost INT,
    set_name VARCHAR(255),
    release_date DATE,
    artist VARCHAR(255),
    rarity VARCHAR(100),
    card_image_small TEXT,
    card_image_highres TEXT,
    tcg_player_url TEXT,
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

-- Instrucción COPY para importar CSV
-- Se importaron los datos utilizando el gestor de Import de PgAdmin 4