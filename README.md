# 🧠 Pokémon Card Price Database

Este proyecto organiza y analiza cartas Pokémon y sus precios desde múltiples archivos CSV mensuales.

---

## 📁 Estructura del Proyecto

```
📦 proyecto_pokemon_db/
├── DDL.sql                         # Crea todas las tablas principales
├── Import_data.sql                 # Crea tabla temporal y carga los CSVs
├── Insert_ata.sql                  # Inserta datos limpios desde raw_data
├── Consultas.sql                   # Consultas SQL del análisis
├── /csv/                           # Carpeta con los archivos CSV
│   ├── vintage_pkmn_cards_feb2025.csv
│   ├── vintage_pkmn_cards_mar2025.csv
│   ├── modern_pkmn_cards_feb2025.csv
│   └── modern_pkmn_cards_mar2025.csv
```

---

## ⚙️ Requisitos

- PostgreSQL instalado (idealmente v13+)
- pgAdmin o cliente SQL compatible
- Archivos `.csv` con cabecera

---

## 🚀 Instrucciones para ejecutar

### 1. Crear las tablas reales

Ejecutar el siguiente script en pgAdmin o psql:

```sql
-- Ejecutar este script primero
\i DDL.sql
```

---

### 2. Crear tabla temporal e importar los CSVs

Ejecutar:

```sql
\i Import_data.sql
```

Luego importar cada CSV manualmente:

```bash
-- Desde psql:
\copy raw_data FROM 'C:/ruta/a/archivo.csv' DELIMITER ',' CSV HEADER;
```

O usando pgAdmin:
- Clic derecho sobre `raw_data` → Import/Export
- Seleccionar archivo
- CSV, Delimiter: `,`, Header: ✓, Quote: `"`

---

### 3. Insertar los datos en tablas reales

Ejecutar:

```sql
\i Insert_data.sql
```

### 4. Ejecutar las consultas de análisis

```sql
\i Consultas.sql
```

📊 Contiene respuestas a preguntas como:
- ¿Cuáles son las cartas más caras?
- ¿Cuál es el precio promedio más reciente?
- ¿Cuántas cartas tienen precios en todas sus versiones?
- Etc.

---

## 🧼 Limpieza opcional

Una vez los datos hayan sido insertados en las tablas reales, puedes borrar la tabla temporal:

```sql
DROP TABLE raw_data;
```

También puedes descomentar la línea al final del archivo `Insert_data.sql` si quieres automatizar esta limpieza.

---

## 📝 Créditos

Proyecto realizado por
Vianka Castro 23201 
Ricardo Godínez 23247

Análisis de precios de cartas Pokémon usando PostgreSQL.
