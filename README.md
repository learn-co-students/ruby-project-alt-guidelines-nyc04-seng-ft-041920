# Un Named Project V0.1.0 By Elisheva and Jonny

## 0.1.0 --- First Release

#### Summary -
Our first release consists of table creation and getting the barebones setup, ActiveRecord is connected and all of our gems are properly setup. The next goal is to hit mvp functionality without design work for release 0.2.0 .

### What's New

Jon:
1. Added 5 tables with their migration files.
    * The first table orders(Join Table)
        1. \<Integer :: recipe_id>
        2. \<Integer :: ingredient_id>
        3. \<Integer :: unit_id>
        4. \<Float :: amount>

    * Second is users
        1. \<String :: name>
        2. \<String :: password>

    * Third is recipes
        1. \<Integer :: user_id>
        2. \<String :: title>
        3. \<String :: category>

    * Fourth is ingredients
        1. \<String :: name>

    * Fifth is units
        1. \<String :: name>
