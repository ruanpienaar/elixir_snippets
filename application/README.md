# Applications 

# Adding new app 

mix new APP --app APP_NAME --sup
cd APP
ln -s ../../Makefile Makefile
ln -s ../../.credo.exs .credo.exs
ln -s ../../generic_elixir_config_folder config

Add deps to mix.exs
make 