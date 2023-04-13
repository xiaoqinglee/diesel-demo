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

diesel migration help

#diesel-migration
#A group of commands for generating, running, and reverting migrations.
#
#USAGE:
#    diesel migration [OPTIONS] <SUBCOMMAND>
#
#OPTIONS:
#        --config-file <CONFIG_FILE>
#            The location of the configuration file to use. Falls back to the `DIESEL_CONFIG_FILE`
#            environment variable if unspecified. Defaults to `diesel.toml` in your project root. See
#            diesel.rs/guides/configuring-diesel-cli for documentation on this file.
#
#        --database-url <DATABASE_URL>
#            Specifies the database URL to connect to. Falls back to the DATABASE_URL environment
#            variable if unspecified.
#
#    -h, --help
#            Print help information
#
#        --locked-schema
#            When `print_schema.file` is specified in your config file, this flag will cause Diesel
#            CLI to error if any command would result in changes to that file. It is recommended that
#            you use this flag when running migrations in CI or production.
#
#        --migration-dir <MIGRATION_DIRECTORY>
#            The location of your migration directory. By default this will look for a directory
#            called `migrations` in the current directory and its parents.
#
#SUBCOMMANDS:
#    generate
#            Generate a new migration with the given name, and the current timestamp as the version.
#    help
#            Print this message or the help of the given subcommand(s)
#    list
#            Lists all available migrations, marking those that have been applied.
#    pending
#            Returns true if there are any pending migrations.
#    redo
#            Reverts and re-runs the latest migration. Useful for testing that a migration can in
#            fact be reverted.
#    revert
#            Reverts the specified migrations.
#    run
#            Runs all pending migrations.
