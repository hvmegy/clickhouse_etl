## 🎯 Star Schema: Video Game Sales

### 🧮 Fact Table

#### fact_sales
| Column         | Type          | Description                          |
|----------------|---------------|--------------------------------------|
| game_id       | Int32         | Foreign key to `Game`                |
| platform_id   | Int32         | Foreign key to `Platform`            |
| publiser_id  | Int32 (null)  | Foreign key to `Publisher`           |
| year_id    | Int32 (null)  | Foreign key to `Year`                |
| genre_id      | Int32         | Foreign key to `Genre`               |
| country_id | Int32 | Foregin key to `Country` | 
| sales | Float64 | Sales | 

---

### 🌟 Dimension Tables

#### dim_country
| Column     | Type    | Description           |
|------------|---------|-----------------------|
| country_id   | Int32   | Unique country ID        |
| country   | String  | country name             |

#### dim_game
| Column     | Type    | Description           |
|------------|---------|-----------------------|
| game_id   | Int32   | Unique game ID        |
| name   | String  | Game name             |

#### dim_platform
| Column       | Type    | Description         |
|--------------|---------|---------------------|
| platform_ID | Int32   | Unique platform ID  |
| platform   | String  | Platform name       |

#### dim_publisher
| Column        | Type             | Description         |
|---------------|------------------|---------------------|
| publisher_id | Int32            | Unique publisher ID |
| publisher_name   | Nullable(String) | Publisher name      |

#### dim_year
| Column     | Type             | Description           |
|------------|------------------|-----------------------|
| year_id | Int32            | Unique year ID        |
| year  | Nullable(Int32)  | Release year          |

#### dim_genre
| Column     | Type    | Description        |
|------------|---------|--------------------|
| genre_id | Int32   | Unique genre ID    |
| genre    | String  | Genre name         |

---

