# elixir_snippets
elixir_snippets


application/earth - Proccess, GenServer, Agent, :gen_statem
application/db - ecto-postgres, ecto-sqlite, xandra


Elixir deps:

#### Semvar - MAJOR.MINOR.PATCH

```
>, >=, <, <=, ==, ~>
```

```
"~> 2.0.0" 
```
Equates to:
```
">= 2.0.0 and < 2.1.0"   
```

```
~> TRANSLATION
~> 2.0.0        >= 2.0.0 and < 2.1.0
~> 2.1.2	    >= 2.1.2 and < 2.2.0
~> 2.1.3-dev	>= 2.1.3-dev and < 2.2.0
~> 2.0	        >= 2.0.0 and < 3.0.0
~> 2.1	        >= 2.1.0 and < 3.0.0
```