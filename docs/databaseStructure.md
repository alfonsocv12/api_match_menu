|------------------------------------------------------------------------------------------------------|
|                      Users                 |                  |                Empleados             |
|---------------|--------|--------|----------|------------------|----------------|--------|--|---------|
| id            | Int    | unique | notnull  |                  | id             | int    |  | notnull |
| Email         | String | unique | nullable |                  | name           | String |  | notnull |
| Name          | String |        | Nullable |                  | restaurant_id | int    |  | notnull |
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
|               restauran                    |          |                    mesas                     |
|---------------|--------|--------|----------|----------|----------------|----------|--------|---------|
| id            | int    | unique |          |          | id             | int      | unique | notnull |
| alias         | String | unique | notnull  |          | restaurant_id | int      |        | notnull |              
| name          | String |        | notnull  |          | name           | int      |        | notnull |
| polyline      | json   |        | notnull  |          | available      | tiny int |        | notnull |
| logo          | url    |        | nullable |          |                |          |        |         |
| password_hash | String |        | notnull  |          |                |          |        |         |
|------------------------------------------------------------------------------------------------------|


|------------------------------------------------------------------------------------------------------|
|                   ordenes                 |             |                productos                  |
|------------------|-----|--------|---------|-------------|----------------|--------|--------|---------|
| id               | int | unique | notnull |             | id             | int    | unique | notnull |
| producto_id      | int |        | notnull |             | name           | String |        | notnull |
| user_id          | int |        | notnull |             | price          | Double |        | notnull |
| table_session_id | int |        | notnull |             | restaurant_id | int    |        | notnull |
|------------------------------------------------------------------------------------------------------|


|------------------------------------------------------------------------------------------------------|            
|                   waitlist               |               |                table_session              |
|---------------|-----|--------|-----------|---------------|---------------|--------|--------|---------|
| id            | int | unique | notnull   |               | id            | int    | unique | notnull |
| restaurant_id | int | unique | notnull   |               | table_id      | int    |        | notnull |
| table_waiting | int |        | default=0 |               | status        | enum   |        | notnull |
|               |     |        |           |               | password      | String | unique | notnull |
|------------------------------------------------------------------------------------------------------|
