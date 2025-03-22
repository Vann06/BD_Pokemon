-- 1. ¿Cuáles son las 5 cartas más caras actualmente en el mercado (holofoil)?
select distinct
c.name as card_name,
tcg_high_price_usd_holofoil as high_price_holofoil
from pokemon_card_prices as prices
right join pokemon_cards c on prices.card_id = c.id
where tcg_high_price_usd_holofoil is not null
order by high_price desc 
limit 5;

-- 2. ¿Cuántas cartas tienen un precio de mercado en holofoil mayor a $100?
-- Utilizamos el high_price_usd_holofoil ya que para no repetir la carta
-- es mas probable que supere los 100 en su precio mas alto que en los demas 
select 
count (distinct card_id)
from pokemon_card_prices
where tcg_high_price_usd_holofoil > 100.00;

-- 3. ¿Cuál es el precio promedio de una carta en holofoil en la última actualización?
select avg(tcg_market_price_usd_holofoil) as Promedio_holofoil
from pokemon_card_prices as prices
where tcg_price_date =(
	select max(tcg_price_date) from pokemon_card_prices
)
and tcg_market_price_usd_holofoil is not null;

-- 4. ¿Cuáles son las cartas que han bajado de precio en la última actualización?
select c.name as card_name
from pokemon_card_prices as prices
right join pokemon_cards c on prices.card_id = c.id
where tcg_price_date =(
	select max(tcg_price_date) from pokemon_card_prices
)

-- 5. ¿Qué tipo de Pokémon tiene el precio promedio más alto en holofoil?
select t.types as tipos,
avg(tcg_market_price_usd_holofoil) as Promedio_holofoil
from pokemon_card_prices as prices
left join pokemon_cards c on prices.card_id = c.id 
left join card_types t on c.id = t.card_id
group by tipos
order by Promedio_holofoil desc 
limit 1;

-- 6. ¿Cuál es la diferencia de precio entre la carta más cara y la más barata en holofoil?


-- 7. ¿Cuántas cartas tienen precios disponibles en todas las condiciones (normal, reverse holofoil y holofoil)?
select 
count(distinct card_id)
from pokemon_card_prices
where tcg_market_price_usd_normal is not null 
and tcg_market_price_usd_reverse_holofoil is not null 
and tcg_market_price_usd_holofoil is not null;
-- 8. ¿Cuál fue la fecha más reciente de actualización de precios?