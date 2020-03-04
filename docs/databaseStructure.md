|------------------------------------------------------------------------------------------------------|
|                      Users                 |                  |                Empleados             |
|---------------|--------|--------|----------|------------------|----------------|--------|--|---------|
| id            | Int    | unique | notnull  |                  | id             | int    |  | notnull |
| Email         | String | unique | nullable |                  | name           | String |  | notnull |
| Name          | String |        | Nullable |                  | restaurante_id | int    |  | notnull |
| Password-hash | String |        | Nullable |                  | roll_id        | int    |  | notnull |
| uid           | String | unique | notnull  |                  |                |        |  |         |
| phone         | String | unique | Nullable |                  |                |        |  |         |
| lada_id       | int    |        | nullable |                  |                |        |  |         |
|------------------------------------------------------------------------------------------------------|


|------------------------------------------------------------------------------------------------------|
|               Roll_empleado               |             |               tipo_productos               |
|---------------|--------|--------|---------|-------------|----------------|--------|--------|---------|
| id            | int    | unique | notnull |             | id             | int    | unique | notnull |
| name          | String | unique | notnull |             | name           | string | unique | notnull |
|------------------------------------------------------------------------------------------------------|


|------------------------------------------------------------------------------------------------------|
|               restauran               |               |                    mesas                     |
|-----------|--------|--------|---------|---------------|----------------|----------|--------|---------|
| id        | int    | unique |         |               | id             | int      | unique | notnull |
| name      | String |        | notnull |               | restaurante_id | int      |        | notnull |
| polyline  | json   |        | notnull |               | name           | int      |        | notnull |
|           |        |        |         |               | available      | tiny int |        | notnull |
|------------------------------------------------------------------------------------------------------|


|------------------------------------------------------------------------------------------------------|
|                   ordenes                 |             |                productios                  |
|------------------|-----|--------|---------|-------------|----------------|--------|--------|---------|
| id               | int | unique | notnull |             | id             | int    | unique | notnull |
| producto_id      | int |        | notnull |             | name           | String |        | notnull |
| user_id          | int |        | notnull |             | price          | Double |        | notnull |
| table_session_id | int |        | notnull |             | restaurante_id | int    |        | notnull |
|------------------------------------------------------------------------------------------------------|


|-------------------------------------------|
|                table_session              |
|---------------|--------|--------|---------|
| id            | int    | unique | notnull |
| table_id      | int    |        | notnull |
| status        | enum   |        | notnull |
| password      | String | unique | notnull |
|-------------------------------------------|
