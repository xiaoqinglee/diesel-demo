# https://diesel.rs/guides/getting-started

cargo install diesel_cli

# Installing /Users/xiaoqinglee/.cargo/bin/diesel
#   Installed package `diesel_cli v2.0.1` (executable `diesel`)

diesel setup
# This will create our database (if it didn’t already exist),
# and create an empty migrations directory that we can use to manage our schema (more on that later).

# create a table
diesel migration generate create_posts

# We can apply our new migration:
diesel migration run

# It’s a good idea to make sure that down.sql is correct.
# You can quickly confirm that your down.sql rolls back your migration correctly by redoing the migration:
diesel migration redo

# A Note on Using Migrations in Production:
#
# When preparing your app for use in production,
# you may want to run your migrations during the application’s initialization phase.
# You may also want to include the migration scripts as a part of your code,
# to avoid having to copy them to your deployment location/image etc.
#
# The diesel_migrations crate provides the embed_migrations! macro,
# allowing you to embed migration scripts in the final binary.
# Once your code uses it,
# you can simply include connection.run_pending_migrations(MIGRATIONS) at the start of your main function
# to run migrations every time the application starts.
