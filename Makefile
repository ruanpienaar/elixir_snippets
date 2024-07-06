# Elixir 1.16.2

build: deps_get compile

shell: build
	iex -S mix

phx.server:
	iex -S mix phx.server

check: credo dialyzer test

credo:
	mix credo
	
# !NB requires dialyxir ( Elixir dialyzer lib )
dialyzer:
	mix dialyzer

#
#
#Common Elixir ENV vars ---
#
#

# MIX_ARCHIVES = Custom archive install location
# MIX_HOME = (defaults to ~/.mix)

iex_node:
	elixir --sname node -S mix run --no-halt

#
#
# Mix ---
#
#

# mix                   # Runs the default task (current: "mix run")
# mix app.config        # Configures all registered apps
# mix app.start         # Starts all registered apps
# mix app.tree          # Prints the application tree
# mix archive           # Lists installed archives
# mix archive.build     # Archives this project into a .ez file
# mix archive.install   # Installs an archive locally
# mix archive.uninstall # Uninstalls archives
# mix clean             # Deletes generated application files
# mix cmd               # Executes the given command
# mix compile           # Compiles source files
# mix credo             # Run code analysis (use `--help` for options)
# mix credo.gen.check   # Generate a new custom check for Credo
# mix credo.gen.config  # Generate a new config for Credo
# mix deps              # Lists dependencies and their status
# mix deps.clean        # Deletes the given dependencies' files
# mix deps.compile      # Compiles dependencies
# mix deps.get          # Gets all out of date dependencies
# mix deps.tree         # Prints the dependency tree
# mix deps.unlock       # Unlocks the given dependencies
# mix deps.update       # Updates the given dependencies
# mix do                # Executes the tasks separated by plus
# mix escript           # Lists installed escripts
# mix escript.build     # Builds an escript for the project
# mix escript.install   # Installs an escript locally
# mix escript.uninstall # Uninstalls escripts
# mix eval              # Evaluates the given code
# mix format            # Formats the given files/patterns
# mix help              # Prints help information for tasks
# mix hex               # Prints Hex help information
# mix hex.audit         # Shows retired Hex deps for the current project
# mix hex.build         # Builds a new package version locally
# mix hex.config        # Reads, updates or deletes local Hex config
# mix hex.docs          # Fetches or opens documentation of a package
# mix hex.info          # Prints Hex information
# mix hex.organization  # Manages Hex.pm organizations
# mix hex.outdated      # Shows outdated Hex deps for the current project
# mix hex.owner         # Manages Hex package ownership
# mix hex.package       # Fetches or diffs packages
# mix hex.publish       # Publishes a new package version
# mix hex.registry      # Manages local Hex registries
# mix hex.repo          # Manages Hex repositories
# mix hex.retire        # Retires a package version
# mix hex.search        # Searches for package names
# mix hex.sponsor       # Show Hex packages accepting sponsorships
# mix hex.user          # Manages your Hex user account
# mix loadconfig        # Loads and persists the given configuration
# mix local             # Lists tasks installed locally via archives
# mix local.hex         # Installs Hex locally
# mix local.phx         # Updates the Phoenix project generator locally
# mix local.public_keys # Manages public keys
# mix local.rebar       # Installs Rebar locally
# mix new               # Creates a new Elixir project
# mix phx.new           # Creates a new Phoenix v1.7.11 application
# mix phx.new.ecto      # Creates a new Ecto project within an umbrella project
# mix phx.new.web       # Creates a new Phoenix web project within an umbrella project
# mix profile.cprof     # Profiles the given file or expression with cprof
# mix profile.eprof     # Profiles the given file or expression with eprof
# mix profile.fprof     # Profiles the given file or expression with fprof
# mix release           # Assembles a self-contained release
# mix release.init      # Generates sample files for releases
# mix run               # Runs the current application
# mix test              # Runs a project's tests
# mix test.coverage     # Build report from exported test coverage
# mix xref              # Prints cross reference information
# iex -S mix            # Starts IEx and runs the default task


# make ARGS="--force" app_config
app_config:
	mix app.config $(ARGS)
# Loads and configures all registered apps.

# This is done by loading config/runtime.exs if one exists. The application will
# be compiled if it was not compiled before.

# ## Command line options

#   • --force - forces compilation regardless of compilation times
#   • --preload-modules - preloads all modules defined in applications
#   • --no-archives-check - does not check archives
#   • --no-app-loading - does not load .app resource file after compilation
#   • --no-compile - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-elixir-version-check - does not check Elixir version
#   • --no-validate-compile-env - does not validate the application compile
#     environment

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARGS="--permanent" app_start
app_start: 
	mix app.start $(ARGS)
# Starts all registered apps.

# First, this task guarantees that all dependencies are in place and that the
# current project has been compiled. Then, the current application is started as
# a temporary application, unless :start_permanent is set to true in your project
# configuration or the --permanent option is given. Setting it to permanent
# guarantees the node will shut down if the application terminates (typically
# because its root supervisor has terminated).

# ## Configuration

#   • :start_permanent - the application and all of its children applications
#     are started in permanent mode. Defaults to false.
#   • :start_concurrently - applications are started concurrently whenever
#     possible. This option only has an effect on Erlang/OTP 26+. Defaults to
#     false.

# ## Command line options

#   • --force - forces compilation regardless of compilation times
#   • --temporary - starts the application as temporary
#   • --permanent - starts the application as permanent
#   • --preload-modules - preloads all modules defined in applications
#   • --no-archives-check - does not check archives
#   • --no-compile - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-elixir-version-check - does not check Elixir version
#   • --no-start - does not actually start applications, only compiles and
#     loads code

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARGS="--format pretty" app_tree
app_tree:
	mix app.tree $(ARGS)
# Prints the application tree.

#     $ mix app.tree --exclude logger --exclude elixir

# If no application is given, it uses the current application defined in the
# mix.exs file.

# ## Command line options

#   • --exclude - exclude applications which you do not want to see printed.
#     kernel, stdlib and compiler are always excluded from the tree.
#   • --format - Can be set to one of either:
#     • pretty - uses Unicode code points for formatting the tree. This is
#       the default except on Windows.

#     • plain - does not use Unicode code points for formatting the tree.
#       This is the default on Windows.

#     • dot - produces a DOT graph description of the application tree in
#       app_tree.dot in the current directory. Warning: this will overwrite any
#       previously generated file.


# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# NOTE: Archives should mostly be used for extending Mix with plugins and not much else.
# make ARGS="" archive 
archive:
	mix archive $(ARGS)
# Lists all installed archives.

# Archives are typically installed at ~/.mix/archives although the installation
# path can be customized by setting the MIX_ARCHIVES environment variable.

# Since archives are specific to Elixir versions, it is expected from build tools
# to swap the MIX_ARCHIVES variable to different locations based on a particular
# Elixir installation.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# Skipping archive as it seems very low volume, and related to interacting with mix specifically.
# mix archive.build     # Archives this project into a .ez file
# mix archive.install   # Installs an archive locally
# mix archive.uninstall # Uninstalls archives


# make ARGS="--deps" clean 
clean:
	mix clean $(ARGS)
# Deletes generated application files.

# This command deletes all build artifacts for the current project. Dependencies'
# sources and build files are cleaned only if the --deps option is given.

# By default this task works across all environments, unless --only is given.

# ## Command line options

#   • --deps - clean dependencies as well as the current project's files
#   • --only - only clean the given environment

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# skipping `mix cmd` as it's calling a OS.Cmd
# mix cmd

# make ARGS="--warnings-as-errors" compile
compile:
	mix compile $(ARGS)
# The main entry point to compile source files.

# It simply runs the compilers registered in your project and returns a tuple
# with the compilation status and a list of diagnostics.

# Before compiling code, it performs a series of checks to ensure all
# dependencies are compiled and the project is up to date. Then the code path of
# your Elixir system is pruned to only contain the dependencies and applications
# that you have explicitly listed in your mix.exs.

# ## Configuration

#   • :build_embedded - this option was used to copy all code and priv
#     content to the _build directory. However, this option no longer has an
#     effect as Elixir will now copy those at release time
#   • :compilers - compilers to run, defaults to Mix.compilers/0, which are
#     [:erlang, :elixir, :app].
#   • :consolidate_protocols - when true, runs protocol consolidation via the
#     mix compile.protocols task. The default value is true.
#   • :build_path - the directory where build artifacts should be written to.
#     This option is intended only for child apps within a larger umbrella
#     application so that each child app can use the common _build directory of
#     the parent umbrella. In a non-umbrella context, configuring this has
#     undesirable side-effects (such as skipping some compiler checks) and should
#     be avoided.
#   • :prune_code_paths - prune code paths before compilation. When true
#     (default), this prunes code paths of applications that are not listed in
#     the project file with dependencies.  When false, this keeps the entirety of
#     Erlang/OTP available when the project starts, including the paths set by
#     the code loader from the ERL_LIBS environment as well as explicitely listed
#     by providing -pa and -pz options to Erlang.
# ## Compilers


# To see documentation for each specific compiler, you must invoke help directly
# for the compiler command:

#     $ mix help compile.elixir
#     $ mix help compile.erlang

# You can get a list of all compilers by running:

#     $ mix compile --list

# ## Command line options

#   • --all-warnings (--no-all-warnings) - prints all warnings, including
#     previous compilations (default is true except on errors)
#   • --erl-config - path to an Erlang term file that will be loaded as Mix
#     config
#   • --force - forces compilation
#   • --list - lists all enabled compilers
#   • --no-app-loading - does not load .app resource file after compilation
#   • --no-archives-check - skips checking of archives
#   • --no-compile - does not actually compile, only loads code and perform
#     checks
#   • --no-deps-check - skips checking of dependencies
#   • --no-elixir-version-check - does not check Elixir version
#   • --no-optional-deps - does not compile or load optional deps. Useful for
#     testing if a library still successfully compiles without optional
#     dependencies (which is the default case with dependencies)
#   • --no-prune-code-paths - do not prune code paths before compilation,
#     this keeps the entirety of Erlang/OTP available when the project starts
#   • --no-protocol-consolidation - skips protocol consolidation
#   • --no-validate-compile-env - does not validate the application compile
#     environment
#   • --return-errors - returns error status and diagnostics instead of
#     exiting on error
#   • --warnings-as-errors - exit with non-zero status if compilation has one
#     or more warnings

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARGS="--all" deps
deps:
	mix deps.get
# Lists all dependencies and their status.

# Dependencies must be specified in the mix.exs file in one of the following
# formats:

#     {app, requirement}
#     {app, opts}
#     {app, requirement, opts}

# Where:

#   • app is an atom
#   • requirement is a Version requirement or a regular expression
#   • opts is a keyword list of options

# For example:

#     {:plug, ">= 0.4.0"}
#     {:gettext, git: "https://github.com/elixir-lang/gettext.git", tag: "0.1"}
#     {:local_dependency, path: "path/to/local_dependency"}

# By default, dependencies are fetched using the Hex package manager
# (https://hex.pm/):

#     {:plug, ">= 0.4.0"}

# By specifying such dependencies, Mix will automatically install Hex (if it
# wasn't previously installed) and download a package suitable to your project.
# Note Hex expects the dependency requirement to always be given and it will warn
# otherwise.

# Mix also supports Git and path dependencies:

#     {:foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1"}
#     {:foobar, path: "path/to/foobar"}

# And also in umbrella dependencies:

#     {:my_app, in_umbrella: true}

# Path and in umbrella dependencies are automatically recompiled by the parent
# project whenever they change. While fetchable dependencies, like the ones using
# :git, are recompiled only when fetched/updated.

# The dependencies' versions are expected to be formatted according to Semantic
# Versioning and the requirements must be specified as defined in the Version
# module.

# ## Options

# Below we provide a more detailed look into the available options.

# ### Dependency definition options

#   • :app - when set to false, does not read the app file for this
#     dependency. By default, the app file is read
#   • :env - the environment (as an atom) to run the dependency on; defaults
#     to :prod
#   • :compile - a command (string) to compile the dependency; defaults to a
#     mix, rebar or make command
#   • :optional - marks the dependency as optional. In such cases, the
#     current project will always include the optional dependency but any other
#     project that depends on the current project won't be forced to use the
#     optional dependency. However, if the other project includes the optional
#     dependency on its own, the requirements and options specified here will
#     also be applied. Optional dependencies will not be started by the
#     application.
#   • :only - the dependency is made available only in the given
#     environments, useful when declaring dev- or test-only dependencies; by
#     default the dependency will be available in all environments. The value of
#     this option can either be a single environment (like :dev) or a list of
#     environments (like [:dev, :test])
#   • :targets - the dependency is made available only for the given targets.
#     By default the dependency will be available in all environments. The value
#     of this option can either be a single target (like :host) or a list of
#     environments (like [:host, :rpi3])
#   • :override - if set to true the dependency will override any other
#     definitions of itself by other dependencies
#   • :manager - Mix can also compile Rebar3 and makefile projects and can
#     fetch sub dependencies of Rebar3 projects. Mix will try to infer the type
#     of project but it can be overridden with this option by setting it to :mix,
#     :rebar3, or :make. In case there are conflicting definitions, the first
#     manager in the list above will be picked up. For example, if a dependency
#     is found with :rebar3 as a manager in different part of the trees, :rebar3
#     will be automatically picked. You can find the manager by running mix deps
#     and override it by setting the :override option in a top-level project.
#   • :runtime - whether the dependency is part of runtime applications. If
#     the :applications key is not provided in def application in your mix.exs
#     file, Mix will automatically include all dependencies as a runtime
#     application, except if runtime: false is given. Defaults to true.
#   • :system_env - an enumerable of key-value tuples of binaries to be set
#     as environment variables when loading or compiling the dependency

# ### Git options (`:git`)

#   • :git - the Git repository URI
#   • :github - a shortcut for specifying Git repos from GitHub, uses :git
#   • :ref - the reference to checkout (may be a branch, a commit SHA or a
#     tag)
#   • :branch - the Git branch to checkout
#   • :tag - the Git tag to checkout
#   • :submodules - when true, initialize submodules for the repo
#   • :sparse - checkout a single directory inside the Git repository and use
#     it as your Mix dependency. Search "sparse Git checkouts" for more
#     information.
#   • :subdir - (since v1.13.0) search for the project in the given directory
#     relative to the git checkout. This is similar to :sparse option but instead
#     of a doing a sparse checkout it does a full checkout.

# If your Git repository requires authentication, such as basic username:password
# HTTP authentication via URLs, it can be achieved via Git configuration, keeping
# the access rules outside of source control.

#     $ git config --global url."https://YOUR_USER:YOUR_PASS@example.com/".insteadOf "https://example.com/"

# For more information, see the git config documentation:
# https://git-scm.com/docs/git-config#git-config-urlltbasegtinsteadOf

# ### Path options (`:path`)

#   • :path        - the path for the dependency
#   • :in_umbrella - when true, sets a path dependency pointing to
#     "../#{app}", sharing the same environment as the current application

# ### Hex options (`:hex`)

# See the Hex usage documentation (https://hex.pm/docs/usage) for Hex options.

# ## Deps task

# mix deps task lists all dependencies in the following format:

#     APP VERSION (SCM) (MANAGER)
#     [locked at REF]
#     STATUS

# For dependencies satisfied by Hex, REF is the package checksum.

# For dependencies satisfied by git, REF is the commit object name, and may
# include branch or tag information.

# It supports the following options:

#   • --all - lists all dependencies, regardless of specified environment

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--all" deps_clean
deps_clean:
	mix deps.clean
# Deletes the given dependencies' files, including build artifacts and fetched
# sources.

# Since this is a destructive action, cleaning of dependencies only occurs when
# passing arguments/options:

#   • dep1 dep2 - the names of dependencies to be deleted separated by a
#     space
#   • --unlock - also unlocks the deleted dependencies
#   • --build - deletes only compiled files (keeps source files)
#   • --all - deletes all dependencies
#   • --unused - deletes only unused dependencies (i.e. dependencies no
#     longer mentioned in mix.exs)

# By default this task works across all environments, unless --only is given
# which will clean all dependencies for the chosen environment.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--skip-local-deps" deps_compile
deps_compile:
	mix deps.compile
# Compiles dependencies.

# By default, this task attempts to compile all dependencies. A list of
# dependencies can be given to compile multiple dependencies in order.

# This task attempts to detect if the project contains one of the following files
# and act accordingly:

#   • mix.exs - invokes mix compile
#   • rebar.config - invokes rebar compile
#   • Makefile.win- invokes nmake /F Makefile.win (only on Windows)
#   • Makefile - invokes gmake on DragonFlyBSD, FreeBSD, NetBSD, and OpenBSD,
#     invokes make on any other operating system (except on Windows)

# The compilation can be customized by passing a compile option in the
# dependency:

#     {:some_dependency, "0.1.0", compile: "command to compile"}

# If a list of dependencies is given, Mix will attempt to compile them as is. For
# example, if project a depends on b, calling mix deps.compile a will compile a
# even if b is out of date. This is to allow parts of the dependency tree to be
# recompiled without propagating those changes upstream. To ensure b is included
# in the compilation step, pass --include-children.

# ## Command line options

#   • --force - force compilation of deps
#   • --skip-umbrella-children - skips umbrella applications from compiling
#   • --skip-local-deps - skips non-remote dependencies, such as path deps,
#     from compiling

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--check-locked" deps_get
deps_get:
	mix deps.get
# Gets all out of date dependencies, i.e. dependencies that are not available or
# have an invalid lock.

# ## Command line options

#   • --check-locked - raises if there are pending changes to the lockfile
#   • --no-archives-check - does not check archives before fetching deps
#   • --only - only fetches dependencies for given environment

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--format pretty" deps_tree
deps_tree:
	mix deps.tree
# Prints the dependency tree.

#     $ mix deps.tree

# If no dependency is given, it uses the tree defined in the mix.exs file.

# ## Command line options

#   • --only - the environment to show dependencies for
#   • --target - the target to show dependencies for
#   • --exclude - exclude dependencies which you do not want to see printed.
#   • --format - Can be set to one of either:
#     • pretty - uses Unicode code points for formatting the tree. This is
#       the default except on Windows.

#     • plain - does not use Unicode code points for formatting the tree.
#       This is the default on Windows.

#     • dot - produces a DOT graph description of the dependency tree in
#       deps_tree.dot in the current directory. Warning: this will override any
#       previously generated file.


# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--check-unused" deps_unlock
deps_unlock:
	mix deps.unlock
# Unlocks the given dependencies.

# Since this is a destructive action, unlocking dependencies only occurs when
# passing arguments/options:

#   • dep1 dep2 - the name of dependencies to be unlocked
#   • --all - unlocks all dependencies
#   • --filter - unlocks only deps matching the given name
#   • --unused - unlocks only unused dependencies (no longer mentioned in the
#     mix.exs file)
#   • --check-unused - checks that the mix.lock file has no unused
#     dependencies. This is useful in pre-commit hooks and CI scripts if you want
#     to reject contributions with extra dependencies

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" deps_update
deps_update:
	mix deps.update
# Updates the given dependencies.

# The given dependencies and the projects they depend on will be unlocked and
# updated to the latest version according to their version requirements.

# Since this is a destructive action, updating all dependencies only occurs when
# the --all command line option is passed.

# All dependencies are automatically recompiled after update.

# ## mix deps.unlock + mix deps.get

# Upgrading a dependency often requires the projects it depends on to upgrade
# too. If you would rather update a single dependency and not touch its children,
# you can explicitly unlock the single dependency and run mix deps.get:

#     $ mix deps.unlock some_dep
#     $ mix deps.get

# ## Command line options

#   • --all - updates all dependencies
#   • --only - only fetches dependencies for given environment
#   • --target - only fetches dependencies for given target
#   • --no-archives-check - does not check archives before fetching deps

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="compile --list + deps" do
do:
	mix do $(ARGS)
# Executes the tasks separated by +:

#     $ mix do compile --list + deps

# The plus should be followed by at least one space before and after.

# ## Examples

# The example below prints the available compilers and then the list of
# dependencies.

#     $ mix do compile --list + deps

# Note that the majority of Mix tasks are only executed once per invocation. So
# for example, the following command will only compile once:

#     $ mix do compile + some_other_command + compile

# When compile is executed again, Mix will notice the task has already ran, and
# skip it.

# Inside umbrella projects, you can limit recursive tasks (the ones that run
# inside every app) by selecting the desired application via the --app flag after
# do and before the first task:

#     $ mix do --app app1 --app app2 compile --list + deps

# Elixir versions prior to v1.14 used the comma exclusively to separate commands:

#     $ mix do compile --list, deps

# Since then, the + operator has been introduced as a separator for better
# support on Windows terminals.

# ## Command line options

#   • --app - limit recursive tasks to the given apps. This option may be
#     given multiple times and must come before any of the tasks.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make escript
escript:
	mix escript
# Lists all installed escripts.

# Escripts are installed at ~/.mix/escripts. Add that path to your $PATH
# environment variable to be able to run installed escripts from any directory.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" xxx
escript_build:
	mix escript.build
# Builds an escript for the project.

# An escript is an executable that can be invoked from the command line. An
# escript can run on any machine that has Erlang/OTP installed and by default
# does not require Elixir to be installed, as Elixir is embedded as part of the
# escript.

# This task guarantees the project and its dependencies are compiled and packages
# them inside an escript. Before invoking mix escript.build, it is only necessary
# to define a :escript key with a :main_module option in your mix.exs file:

#     escript: [main_module: MyApp.CLI]

# Escripts should be used as a mechanism to share scripts between developers and
# not as a deployment mechanism. For running live systems, consider using mix run
# or building releases. See the Application module for more information on
# systems life-cycles.

# All of the configuration defined in config/config.exs will be included as part
# of the escript. config/runtime.exs is also included for Elixir escripts. Once
# the configuration is loaded, this task starts the current application. If this
# is not desired, set the :app configuration to nil.

# This task also removes documentation and debugging chunks from the compiled
# .beam files to reduce the size of the escript. If this is not desired, check
# the :strip_beams option.

# > #### priv directory support {: .warning}
# >
# > escripts do not support projects and dependencies that need to store or read
# > artifacts from the priv directory.

# ## Command line options

# Expects the same command line options as mix compile.

# ## Configuration

# The following option must be specified in your mix.exs under the :escript key:

#   • :main_module - the module to be invoked once the escript starts. The
#     module must contain a function named main/1 that will receive the command
#     line arguments. By default the arguments are given as a list of binaries,
#     but if project is configured with language: :erlang it will be a list of
#     charlists.

# The remaining options can be specified to further customize the escript:

#   • :name - the name of the generated escript. Defaults to app name.
#   • :path - the path to write the escript to. Defaults to app name.
#   • :app - the app that starts with the escript. Defaults to app name. Set
#     it to nil if no application should be started.
#   • :strip_beams - if true strips BEAM code in the escript to remove chunks
#     unnecessary at runtime, such as debug information and documentation. Can be
#     set to [keep: ["Docs", "Dbgi"]] to strip while keeping some chunks that
#     would otherwise be stripped, like docs, and debug info, for instance.
#     Defaults to true.
#   • :embed_elixir - if true embeds Elixir and its children apps (ex_unit,
#     mix, and the like) mentioned in the :applications list inside the
#     application/0 function in mix.exs.
#     Defaults to true for Elixir projects, false for Erlang projects.

#     Note: if you set this to false for an Elixir project, you will have to add
#     paths to Elixir's ebin directories to ERL_LIBS environment variable when
#     running the resulting escript, in order for the code loader to be able to
#     find :elixir application and its children applications (if they are used).

#   • :shebang - shebang interpreter directive used to execute the escript.
#     Defaults to "#! /usr/bin/env escript\n".
#   • :comment - comment line to follow shebang directive in the escript.
#     Defaults to "".
#   • :emu_args - emulator arguments to embed in the escript file. Defaults
#     to "".

# There is one project-level option that affects how the escript is generated:

#   • language: :elixir | :erlang - set it to :erlang for Erlang projects
#     managed by Mix. Doing so will ensure Elixir is not embedded by default.
#     Your app will still be started as part of escript loading, with the config
#     used during build.

# ## Example

# In your mix.exs:

#     defmodule MyApp.MixProject do
#       use Mix.Project

#       def project do
#         [
#           app: :my_app,
#           version: "0.0.1",
#           escript: escript()
#         ]
#       end

#       def escript do
#         [main_module: MyApp.CLI]
#       end
#     end

# Then define the entrypoint, such as the following in lib/cli.ex:

#     defmodule MyApp.CLI do
#       def main(_args) do
#         IO.puts("Hello from MyApp!")
#       end
#     end

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin

# make ARG="" escript_install
escript_install:
	mix escript.install
# Installs an escript locally.

# If no argument is supplied but there is an escript in the project's root
# directory (created with mix escript.build), then the escript will be installed
# locally. For example:

#     $ mix do escript.build + escript.install

# If an argument is provided, it should be a local path to a prebuilt escript, a
# Git repository, a GitHub repository, or a Hex package.

#     $ mix escript.install escript
#     $ mix escript.install path/to/escript
#     $ mix escript.install git https://path/to/git/repo
#     $ mix escript.install git https://path/to/git/repo branch git_branch
#     $ mix escript.install git https://path/to/git/repo tag git_tag
#     $ mix escript.install git https://path/to/git/repo ref git_ref
#     $ mix escript.install github user/project
#     $ mix escript.install github user/project branch git_branch
#     $ mix escript.install github user/project tag git_tag
#     $ mix escript.install github user/project ref git_ref
#     $ mix escript.install hex hex_package
#     $ mix escript.install hex hex_package 1.2.3

# After installation, the escript can be invoked as

#     $ ~/.mix/escripts/foo

# For convenience, consider adding ~/.mix/escripts directory to your $PATH
# environment variable. For more information, check the wikipedia article on
# PATH: https://en.wikipedia.org/wiki/PATH_(variable)

# ## Command line options

#   • --sha512 - checks the escript matches the given SHA-512 checksum. Only
#     applies to installations via a local path
#   • --force - forces installation without a shell prompt; primarily
#     intended for automation in build systems like Make
#   • --submodules - fetches repository submodules before building escript
#     from Git or GitHub
#   • --sparse - checkout a single directory inside the Git repository and
#     use it as the escript project directory
#   • --app - specifies a custom app name to be used for building the escript
#     from Git, GitHub, or Hex
#   • --organization - set this for Hex private packages belonging to an
#     organization
#   • --repo - set this for self-hosted Hex instances, defaults to hexpm

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" escript_uninstall
escript_uninstall:
	mix escript.uninstall
# Uninstalls local escripts:

#     $ mix escript.uninstall escript_name

# ## Command line options

#   • --force - forces uninstallation without a shell prompt; primarily
#     intended for automation

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="IO.puts(1 + 2)" eval
eval:
	mix eval
# Evaluates the given code within a configured application.

#     $ mix eval "IO.puts(1 + 2)"

# The given code is evaluated after the current application has been configured
# but without loading or starting them (some applications may be loaded as part
# of booting but that's not guaranteed). See mix run for running your application
# and scripts within a started application.

# This task is designed to mirror the bin/my_app eval command in releases. It is
# typically used to invoke functions already defined within your application. For
# example, you may have a module such as:

#     defmodule MyApp.ReleaseTasks do
#       def migrate_database do
#         Application.load(:my_app)
#         ...
#       end
#     end

# Once defined, you can invoke this function either via mix eval or via
# bin/my_app eval inside a release as follows:

#     $ mix eval MyApp.ReleaseTasks.migrate_database
#     $ bin/my_app eval MyApp.ReleaseTasks.migrate_database

# As you can see, the current application has to be either explicitly loaded or
# started in your tasks, either by calling Application.load/1 or
# Application.ensure_all_started/1. This gives you full control over the
# application booting life-cycle. For more information, see the Application
# module.

# This task is automatically re-enabled, so it can be called multiple times with
# different arguments.

# ## Command-line options

#   • --no-archives-check - does not check archives
#   • --no-compile - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-elixir-version-check - does not check the Elixir version from
#     mix.exs
#   • --no-mix-exs - allows the command to run even if there is no mix.exs

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--dry-run" format
format:
	mix format
# Formats the given files and patterns.

#     $ mix format mix.exs "lib/**/*.{ex,exs}" "test/**/*.{ex,exs}"

# If any of the files is -, then the input is read from stdin and the output is
# written to stdout.

# ## Formatting options

# The formatter will read a .formatter.exs file in the current directory for
# formatter configuration. Evaluating this file should return a keyword list.

# Here is an example of a .formatter.exs file that works as a starting point:

#     [
#       inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}"]
#     ]

# Besides the options listed in Code.format_string!/2, the .formatter.exs file
# supports the following options:

#   • :inputs (a list of paths and patterns) - specifies the default inputs
#     to be used by this task. For example, ["mix.exs",
#     "{config,lib,test}/**/*.{ex,exs}"]. Patterns are expanded with
#     Path.wildcard/2.
#   • :plugins (a list of modules) (since v1.13.0) - specifies a list of
#     modules to customize how the formatter works. See the "Plugins" section
#     below for more information.
#   • :subdirectories (a list of paths and patterns) - specifies
#     subdirectories that have their own formatting rules. Each subdirectory
#     should have a .formatter.exs that configures how entries in that
#     subdirectory should be formatted as. Configuration between .formatter.exs
#     are not shared nor inherited. If a .formatter.exs lists "lib/app" as a
#     subdirectory, the rules in .formatter.exs won't be available in
#     lib/app/.formatter.exs. Note that the parent .formatter.exs must not
#     specify files inside the "lib/app" subdirectory in its :inputs
#     configuration. If this happens, the behaviour of which formatter
#     configuration will be picked is unspecified.
#   • :import_deps (a list of dependencies as atoms) - specifies a list of
#     dependencies whose formatter configuration will be imported. See the
#     "Importing dependencies configuration" section below for more information.
#   • :export (a keyword list) - specifies formatter configuration to be
#     exported. See the "Importing dependencies configuration" section below.

# ## Task-specific options

#   • --check-formatted - checks that the file is already formatted. This is
#     useful in pre-commit hooks and CI scripts if you want to reject
#     contributions with unformatted code. If the check fails, the formatted
#     contents are not written to disk. Keep in mind that the formatted output
#     may differ between Elixir versions as improvements and fixes are applied to
#     the formatter.
#   • --no-exit - only valid when used with --check-formatted. Pass this if
#     you don't want this Mix task to fail (and return a non-zero exit code), but
#     still want to check for format errors and print them to the console.
#   • --dry-run - does not save files after formatting.
#   • --dot-formatter - path to the file with formatter configuration.
#     Defaults to .formatter.exs if one is available. See the "Formatting
#     options" section above for more information.
#   • --stdin-filename - path to the file being formatted on stdin. This is
#     useful if you are using plugins to support custom filetypes such as .heex.
#     Without passing this flag, it is assumed that the code being passed via
#     stdin is valid Elixir code. Defaults to "stdin.exs".

# ## When to format code

# We recommend developers to format code directly in their editors, either
# automatically when saving a file or via an explicit command or key binding. If
# such option is not available in your editor of choice, adding the required
# integration is usually a matter of invoking:

#     $ cd $project && mix format $file

# where $file refers to the current file and $project is the root of your
# project.

# It is also possible to format code across the whole project by passing a list
# of patterns and files to mix format, as shown at the top of this task
# documentation. This list can also be set in the .formatter.exs file under the
# :inputs key.

# ## Plugins

# It is possible to customize how the formatter behaves. Plugins must implement
# the Mix.Tasks.Format behaviour. For example, imagine that your project uses
# Markdown in two distinct ways: via a custom ~M sigil and via files with the .md
# and .markdown extensions. A custom plugin would look like this:

#     defmodule MixMarkdownFormatter do
#       @behaviour Mix.Tasks.Format

#       def features(_opts) do
#         [sigils: [:M], extensions: [".md", ".markdown"]]
#       end

#       def format(contents, opts) do
#         # logic that formats markdown
#       end
#     end

# The opts passed to format/2 contains all the formatting options and either:

#   • :sigil (atom) - the sigil being formatted, e.g. :M.
#   • :modifiers (charlist) - list of sigil modifiers.
#   • :extension (string) - the extension of the file being formatted, e.g.
#     ".md".

# Now any application can use your formatter as follows:

#     # .formatter.exs
#     [
#       # Define the desired plugins
#       plugins: [MixMarkdownFormatter, AnotherMarkdownFormatter],
#       # Remember to update the inputs list to include the new extensions
#       inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}", "posts/*.{md,markdown}"]
#     ]

# Notice that, when running the formatter with plugins, your code will be
# compiled first.

# In addition, the order by which you input your plugins is the format order. So,
# in the above .formatter.exs, the MixMarkdownFormatter will format the markdown
# files and sigils before AnotherMarkdownFormatter.

# ## Importing dependencies configuration

# This task supports importing formatter configuration from dependencies.

# A dependency that wants to export formatter configuration needs to have a
# .formatter.exs file at the root of the project. In this file, the dependency
# can list an :export option with configuration to export. For now, only one
# option is supported under :export: :locals_without_parens (whose value has the
# same shape as the value of the :locals_without_parens in
# Code.format_string!/2).

# The functions listed under :locals_without_parens in the :export option of a
# dependency can be imported in a project by listing that dependency in the
# :import_deps option of the formatter configuration file of the project.

# For example, consider you have a project called my_app that depends on another
# one called my_dep. my_dep wants to export some configuration, so
# my_dep/.formatter.exs would look like this:

#     # my_dep/.formatter.exs
#     [
#       # Regular formatter configuration for my_dep
#       # ...

#       export: [
#         locals_without_parens: [some_dsl_call: 2, some_dsl_call: 3]
#       ]
#     ]

# In order to import configuration, my_app's .formatter.exs would look like this:

#     # my_app/.formatter.exs
#     [
#       import_deps: [:my_dep]
#     ]

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--names" help
help:
	mix help
# Lists all tasks and aliases or prints the documentation for a given task or
# alias.

# ## Arguments

#     $ mix help                  - prints all aliases, tasks and their short descriptions
#     $ mix help ALIAS            - prints the definition for the given alias
#     $ mix help TASK             - prints full docs for the given task
#     $ mix help --search PATTERN - prints all tasks and aliases that contain PATTERN in the name
#     $ mix help --names          - prints all task names and aliases
#                                 (useful for autocompleting)

# ## Colors

# When possible, mix help is going to use coloring for formatting the help
# information. The formatting can be customized by configuring the Mix
# application either inside your project (in config/config.exs) or by using the
# local config (in ~/.mix/config.exs).

# For example, to disable color, one may use the configuration:

#     [mix: [colors: [enabled: false]]]

# The available color options are:

#   • :enabled         - shows ANSI formatting (defaults to
#     IO.ANSI.enabled?/0)
#   • :doc_code        - the attributes for code blocks (cyan, bright)
#   • :doc_inline_code - inline code (cyan)
#   • :doc_headings    - h1 and h2 (yellow, bright)
#   • :doc_title       - the overall heading for the output (reverse, yellow,
#     bright)
#   • :doc_bold        - (bright)
#   • :doc_underline   - (underline)

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" hex
hex:
	mix hex
# Prints Hex tasks and their information.

#     $ mix hex

# See mix help hex.config to see all available configuration options.

# Location: /Users/rp/.mix/archives/hex-2.0.6/hex-2.0.6/ebin


#
#
# Hex ---
#
#


# Hex v2.0.6
# Hex is a package manager for the Erlang ecosystem.

# Available tasks:

# mix hex.audit                                         # Shows retired Hex deps for the current project

# mix hex.build                                         # Builds a new package version locally

# mix hex.config                                        # Reads, updates or deletes local Hex config
# mix hex.config KEY                                    # Get config value for KEY
# mix hex.config KEY --delete                           # Delete config value for KEY
# mix hex.config KEY VALUE                              # Set config KEY to VALUE

# mix hex.docs fetch PACKAGE [VERSION]                  # Fetch documentation for offline use
# mix hex.docs offline PACKAGE [VERSION]                # Open a browser window with offline documentation
# mix hex.docs online PACKAGE [VERSION]                 # Open a browser window with online documentation

# mix hex.info                                          # Prints Hex information
# mix hex.info PACKAGE [VERSION]                        # Prints package information

# mix hex.organization auth ORGANIZATION                # Authorize an organization
# mix hex.organization deauth ORGANIZATION              # Deauthorize and remove organization
# mix hex.organization list                             # List all authorized organizations
# mix hex.organization key ORGANIZATION generate        # Generate organization key
# mix hex.organization key ORGANIZATION revoke KEY_NAME # Revoke key
# mix hex.organization key ORGANIZATION revoke --all    # Revoke all keys
# mix hex.organization key ORGANIZATION list            # List keys

# mix hex.outdated                                      # Shows outdated Hex deps for the current project
# mix hex.outdated [APP]                                # Shows outdated Hex deps for the given dependency

# mix hex.owner add PACKAGE EMAIL_OR_USERNAME           # Adds an owner to package
# mix hex.owner transfer PACKAGE EMAIL_OR_USERNAME      # Transfers ownership of a package to another user or organization
# mix hex.owner remove PACKAGE EMAIL_OR_USERNAME        # Removes an owner from package
# mix hex.owner list PACKAGE                            # List all owners of a given package
# mix hex.owner packages                                # List all packages owned by the current user

# mix hex.package fetch PACKAGE [VERSION] [--unpack]    # Fetch the package
# mix hex.package diff APP VERSION                      # Diff dependency against version
# mix hex.package diff PACKAGE VERSION1 VERSION2        # Diff package versions
# mix hex.package diff PACKAGE VERSION1..VERSION2       # Diff package versions

# mix hex.publish                                       # Publishes a new package version
# mix hex.publish package                               # Publish current package
# mix hex.publish docs                                  # Publish current docs
# mix hex.publish package --revert VERSION              # Reverts package on given version
# mix hex.publish docs --revert VERSION                 # Reverts docs on given version
# mix hex.publish --revert VERSION                      # Reverts given version

# mix hex.registry build PUBLIC_DIR                     # Build a local registry

# mix hex.repo add NAME URL                             # Add a repo
# mix hex.repo set NAME                                 # Set config for repo
# mix hex.repo remove NAME                              # Remove repo
# mix hex.repo show NAME                                # Show repo config
# mix hex.repo list                                     # List all repos

# mix hex.retire PACKAGE VERSION REASON                 # Retires a package version
# mix hex.retire PACKAGE VERSION --unretire             # Unretires a package

# mix hex.search PACKAGE                                # Searches for package names

# mix hex.sponsor                                       # Show Hex packages accepting sponsorships

# mix hex.user register                                 # Register a new user
# mix hex.user whoami                                   # Prints the current user
# mix hex.user auth                                     # Authorize a new user
# mix hex.user deauth                                   # Deauthorize the user
# mix hex.user key generate                             # Generate user key
# mix hex.user key revoke KEY_NAME                      # Removes given key from account
# mix hex.user key revoke --all                         # Revoke all keys
# mix hex.user key list                                 # Lists all keys associated with your account
# mix hex.user reset_password account                   # Reset user account password
# mix hex.user reset_password local                     # Reset local password


# Further information can be found here: https://hex.pm/docs


# make ARG="" loadconfig
loadconfig:
	mix loadconfig
# Loads and persists the given configuration.

#     $ mix loadconfig path/to/config.exs

# Any configuration file loaded with loadconfig is treated as a compile-time
# configuration.

# Note that "config/config.exs" is always loaded automatically by the Mix CLI
# when it boots. "config/runtime.exs" is loaded automatically by mix app.config
# before starting the current application. Therefore there is no need to load
# those config files directly.

# This task is automatically re-enabled, so it can be called multiple times to
# load different configs.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" local
local:
	mix local
# Lists tasks installed locally via archives.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--if-missing" local_hex
local_hex:
	mix local.hex
# Installs Hex locally.

#     $ mix local.hex [version]

# By default the latest compatible version of Hex will be installed, unless
# version is specified.

# If installing a precompiled Hex does not work, you can compile and install Hex
# directly with this command:

#     $ mix archive.install github hexpm/hex branch latest

# ## Command line options

#   • --force - forces installation without a shell prompt; primarily
#     intended for automation in build systems like make
#   • --if-missing - performs installation only if Hex is not installed yet;
#     intended to avoid repeatedly reinstalling Hex in automation when a script
#     may be run multiple times

# If both options are set, the shell prompt is skipped and Hex is not
# re-installed if it was already installed.

# ## Mirrors

# If you want to change the default mirror (https://builds.hex.pm) used for
# fetching Hex, set the HEX_BUILDS_URL environment variable.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin

# make ARG="" local_phx
local_phx:
	mix local.phx
# Updates the Phoenix project generator locally.

#     $ mix local.phx

# Accepts the same command line options as archive.install hex phx_new.

# Location: /Users/rp/.mix/archives/phx_new-1.7.11/phx_new-1.7.11/ebin


# make ARG="" local_public_keys
local_public_keys:
	mix local.public_keys
# Public keys are used by Mix to install packages like Rebar and Hex.

# Mix by default ships with a public key but new ones can be added on demand.

# To list all available keys:

#     $ mix local.public_keys

# To list all available keys showing the keys themselves:

#     $ mix local.public_keys --detailed

# To add a new key:

#     $ mix local.public_keys local/path/to/key

# Be careful when adding new keys. Only add keys from sources you trust.

# Public keys are by default stored in your MIX_HOME under the public_keys
# directory.

# ## Command line options

#   • --force - forces installation without a shell prompt; primarily
#     intended for automation in build systems like make

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" local_rebar
local_rebar:
	mix local.rebar
# Fetches a copy of rebar3 from the given path or URL.

# It defaults to safely download a Rebar copy from Hex's CDN. However, a URL can
# be given as an argument, usually for an existing local copy of Rebar:

#     $ mix local.rebar rebar3 path/to/rebar

# The local copy is stored in your MIX_HOME (defaults to ~/.mix) according to the
# current Elixir. The installed version of Rebar will be used whenever required
# by mix deps.compile.

# ## Command line options

#   • rebar3 PATH - specifies a path for rebar3
#   • --sha512 - checks the Rebar script matches the given SHA-512 checksum
#   • --force - forces installation without a shell prompt; primarily
#     intended for automation in build systems like make
#   • --if-missing - performs installation only if not installed yet;
#     intended to avoid repeatedly reinstalling in automation when a script may
#     be run multiple times

# ## Mirrors

# If you want to change the default mirror (https://builds.hex.pm) to use for
# fetching rebar please set the HEX_BUILDS_URL environment variable.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="--umbrella" new
new:
	mix new
# Creates a new Elixir project. It expects the path of the project as argument.

#     $ mix new PATH [--app APP] [--module MODULE] [--sup] [--umbrella]

# A project at the given PATH will be created. The application name and module
# name will be retrieved from the path, unless --module or --app is given.

# An --app option can be given in order to name the OTP application for the
# project.

# A --module option can be given in order to name the modules in the generated
# code skeleton.

# A --sup option can be given to generate an OTP application skeleton including a
# supervision tree. Normally an app is generated without a supervisor and without
# the app callback.

# An --umbrella option can be given to generate an umbrella project.

# ## Examples

#     $ mix new hello_world

# Is equivalent to:

#     $ mix new hello_world --module HelloWorld

# To generate an app with a supervision tree and an application callback:

#     $ mix new hello_world --sup

# To generate an umbrella application with sub applications:

#     $ mix new hello_world --umbrella
#     $ cd hello_world/apps
#     $ mix new child_app

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" phx_new
phx_new:
	mix phx.new
# Creates a new Phoenix project.

# It expects the path of the project as an argument.

#     $ mix phx.new PATH [--module MODULE] [--app APP]

# A project at the given PATH will be created. The application name and module
# name will be retrieved from the path, unless --module or --app is given.

# ## Options

#   • --umbrella - generate an umbrella project, with one application for
#     your domain, and a second application for the web interface.
#   • --app - the name of the OTP application
#   • --module - the name of the base module in the generated skeleton
#   • --database - specify the database adapter for Ecto. One of:
#     • postgres - via https://github.com/elixir-ecto/postgrex
#     • mysql - via https://github.com/elixir-ecto/myxql
#     • mssql - via https://github.com/livehelpnow/tds
#     • sqlite3 - via https://github.com/elixir-sqlite/ecto_sqlite3

#     Please check the driver docs for more information and requirements.
#     Defaults to "postgres".

#   • --adapter - specify the http adapter. One of:
#     • cowboy - via https://github.com/elixir-plug/plug_cowboy
#     • bandit - via https://github.com/mtrudel/bandit

#     Please check the adapter docs for more information and requirements.
#     Defaults to "bandit".

#   • --no-assets - equivalent to --no-esbuild and --no-tailwind
#   • --no-dashboard - do not include Phoenix.LiveDashboard
#   • --no-ecto - do not generate Ecto files
#   • --no-esbuild - do not include esbuild dependencies and assets. We do
#     not recommend setting this option, unless for API only applications, as
#     doing so requires you to manually add and track JavaScript dependencies
#   • --no-gettext - do not generate gettext files
#   • --no-html - do not generate HTML views
#   • --no-live - comment out LiveView socket setup in assets/js/app.js.
#     Automatically disabled if --no-html is given
#   • --no-mailer - do not generate Swoosh mailer files
#   • --no-tailwind - do not include tailwind dependencies and assets. The
#     generated markup will still include Tailwind CSS classes, those are left-in
#     as reference for the subsequent styling of your layout and components
#   • --binary-id - use binary_id as primary key type in Ecto schemas
#   • --verbose - use verbose output
#   • -v, --version - prints the Phoenix installer version

# When passing the --no-ecto flag, Phoenix generators such as phx.gen.html,
# phx.gen.json, phx.gen.live, and phx.gen.context may no longer work as expected
# as they generate context files that rely on Ecto for the database access. In
# those cases, you can pass the --no-context flag to generate most of the HTML
# and JSON files but skip the context, allowing you to fill in the blanks as
# desired.

# Similarly, if --no-html is given, the files generated by phx.gen.html will no
# longer work, as important HTML components will be missing.

# ## Installation

# mix phx.new by default prompts you to fetch and install your dependencies. You
# can enable this behaviour by passing the --install flag or disable it with the
# --no-install flag.

# ## Examples

#     $ mix phx.new hello_world

# Is equivalent to:

#     $ mix phx.new hello_world --module HelloWorld

# Or without the HTML and JS bits (useful for APIs):

#     $ mix phx.new ~/Workspace/hello_world --no-html --no-assets

# As an umbrella:

#     $ mix phx.new hello --umbrella

# Would generate the following directory structure and modules:

#     hello_umbrella/   Hello.Umbrella
#       apps/
#         hello/        Hello
#         hello_web/    HelloWeb

# You can read more about umbrella projects using the official Elixir guide
# (https://hexdocs.pm/elixir/dependencies-and-umbrella-projects.html#umbrella-projects)

# Location: /Users/rp/.mix/archives/phx_new-1.7.11/phx_new-1.7.11/ebin


# make ARG="" phx_new_ecto
phx_new_ecto:
	mix phx.new.ecto
# Creates a new Ecto project within an umbrella project.

# This task is intended to create a bare Ecto project without web integration,
# which serves as a core application of your domain for web applications and your
# greater umbrella platform to integrate with.

# It expects the name of the project as an argument.

#     $ cd my_umbrella/apps
#     $ mix phx.new.ecto APP [--module MODULE] [--app APP]

# A project at the given APP directory will be created. The application name and
# module name will be retrieved from the application name, unless --module or
# --app is given.

# ## Options

#   • --app - the name of the OTP application
#   • --module - the name of the base module in the generated skeleton
#   • --database - specify the database adapter for Ecto. One of:
#     • postgres - via https://github.com/elixir-ecto/postgrex
#     • mysql - via https://github.com/elixir-ecto/myxql
#     • mssql - via https://github.com/livehelpnow/tds
#     • sqlite3 - via https://github.com/elixir-sqlite/ecto_sqlite3

#     Please check the driver docs for more information and requirements.
#     Defaults to "postgres".

#   • --binary-id - use binary_id as primary key type in Ecto schemas

# ## Examples

#     $ mix phx.new.ecto hello_ecto

# Is equivalent to:

#     $ mix phx.new.ecto hello_ecto --module HelloEcto

# Location: /Users/rp/.mix/archives/phx_new-1.7.11/phx_new-1.7.11/ebin


# make ARG="" phx_new_web
phx_new_web:
	mix phx.new.web
# Creates a new Phoenix web project within an umbrella project.

# It expects the name of the OTP app as the first argument and for the command to
# be run inside your umbrella application's apps directory:

#     $ cd my_umbrella/apps
#     $ mix phx.new.web APP [--module MODULE] [--app APP]

# This task is intended to create a bare Phoenix project without database
# integration, which interfaces with your greater umbrella application(s).

# ## Examples

#     $ mix phx.new.web hello_web

# Is equivalent to:

#     $ mix phx.new.web hello_web --module HelloWeb

# Supports the same options as the phx.new task. See Mix.Tasks.Phx.New for
# details.

# Location: /Users/rp/.mix/archives/phx_new-1.7.11/phx_new-1.7.11/ebin


# make ARG="" profile_cprof
profile_cprof:
	mix profile.cprof
# Profiles the given file or expression using Erlang's cprof tool.

# cprof can be useful when you want to discover the bottlenecks related to
# function calls.

# Before running the code, it invokes the app.start task which compiles and loads
# your project. After that, the target expression is profiled together with all
# matching function calls, by setting breakpoints containing counters. These can
# only be set on BEAM code so BIFs cannot be call count traced.

# To profile the code, you can use syntax similar to the mix run task:

#     $ mix profile.cprof -e Hello.world
#     $ mix profile.cprof -e "[1, 2, 3] |> Enum.reverse |> Enum.map(&Integer.to_string/1)"
#     $ mix profile.cprof my_script.exs arg1 arg2 arg3

# This task is automatically re-enabled, so you can profile multiple times in the
# same Mix invocation.

# ## Command line options

#   • --matching - only profile calls matching the given
#     Module.function/arity pattern
#   • --limit - filters out any results with a call count less than the limit
#   • --module - filters out any results not pertaining to the given module
#   • --eval, -e - evaluate the given code
#   • --require, -r - requires pattern before running the command
#   • --parallel, -p - makes all requires parallel
#   • --no-compile - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-archives-check - does not check archives
#   • --no-halt - does not halt the system after running the command
#   • --no-start - does not start applications after compilation
#   • --no-elixir-version-check - does not check the Elixir version from
#     mix.exs

# ## Profile output

# Example output:

#                                                                          CNT
#     Total                                                                 15
#     Enum                                                                   6  <--
#       Enum."-map/2-lists^map/1-0-"/2                                       4
#       Enum.reverse/1                                                       1
#       Enum.map/2                                                           1
#     :elixir_compiler                                                       4  <--
#       anonymous fn/1 in :elixir_compiler.__FILE__/1                        3
#       anonymous fn/0 in :elixir_compiler.__FILE__/1                        1
#     String.Chars.Integer                                                   3  <--
#       String.Chars.Integer.to_string/1                                     3
#     :erlang                                                                2  <--
#       :erlang.trace_pattern/3                                              2
#     Profile done over 20229 matching functions

# The default output contains data gathered from all matching functions. The left
# column structures each module and its total call count trace is presented on
# the right. Each module has its count discriminated by function below. The <--
# symbol is meant to help visualize where a new module call count begins.

# The first row (Total) is the sum of all function calls. In the last row the
# number of matching functions that were considered for profiling is presented.

# When --matching option is specified, call count tracing will be started only
# for the functions matching the given pattern:

#     String.Chars.Integer                                                   3  <--
#       String.Chars.Integer.to_string/1                                     3
#     Profile done over 1 matching functions

# The pattern can be a module name, such as String to count all calls to that
# module, a call without arity, such as String.split, to count all calls to that
# function regardless of arity, or a call with arity, such as String.split/3, to
# count all calls to that exact module, function and arity.

# ## Caveats

# You should be aware the profiler is stopped as soon as the code has finished
# running. This may need special attention, when:  running asynchronous code as
# function calls which were called before the profiler stopped will not be
# counted; running synchronous code as long running computations and a profiler
# without a proper MFA trace pattern or filter may lead to a result set which is
# difficult to comprehend.

# Other caveats are the impossibility to call count trace BIFs, since breakpoints
# can only be set on BEAM code; functions calls performed by :cprof are not
# traced; the maximum size of a call counter is equal to the host machine's word
# size (for example, 2147483647 in a 32-bit host).

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" profile_eprof
profile.eprof:
	mix profile.eprof
# Profiles the given file or expression using Erlang's eprof tool.

# :eprof provides time information of each function call and can be useful when
# you want to discover the bottlenecks related to this.

# Before running the code, it invokes the app.start task which compiles and loads
# your project. After that, the target expression is profiled together with all
# matching function calls using the Erlang trace BIFs. The tracing of the
# function calls for that is enabled when the profiling is begun, and disabled
# when profiling is stopped.

# To profile the code, you can use syntax similar to the mix run task:

#     $ mix profile.eprof -e Hello.world
#     $ mix profile.eprof -e "[1, 2, 3] |> Enum.reverse |> Enum.map(&Integer.to_string/1)"
#     $ mix profile.eprof my_script.exs arg1 arg2 arg3

# This task is automatically re-enabled, so you can profile multiple times in the
# same Mix invocation.

# ## Command line options

#   • --matching - only profile calls matching the given
#     Module.function/arity pattern
#   • --calls - filters out any results with a call count lower than this
#   • --time - filters out any results that took lower than specified (in µs)
#   • --sort - sorts the results by time or calls (default: time)
#   • --eval, -e - evaluates the given code
#   • --require, -r - requires pattern before running the command
#   • --parallel, -p - makes all requires parallel
#   • --no-warmup - skips the warmup step before profiling
#   • --no-compile - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-archives-check - does not check archives
#   • --no-halt - does not halt the system after running the command
#   • --no-start - does not start applications after compilation
#   • --no-elixir-version-check - does not check the Elixir version from
#     mix.exs

# ## Profile output

# Example output:

#     #                                               CALLS     % TIME µS/CALL
#     Total                                              24 100.0   26    1.08
#     Enum.reduce_range_inc/4                             5  3.85    1    0.20
#     :erlang.make_fun/3                                  1  7.69    2    2.00
#     Enum.each/2                                         1  7.69    2    2.00
#     anonymous fn/0 in :elixir_compiler_0.__FILE__/1     1  7.69    2    2.00
#     :erlang.integer_to_binary/1                         5 15.39    4    0.80
#     :erlang.apply/2                                     1 15.39    4    4.00
#     anonymous fn/3 in Enum.each/2                       5 19.23    5    1.00
#     String.Chars.Integer.to_string/1                    5 23.08    6    1.20

#     Profile done over 8 matching functions

# The default output contains data gathered from all matching functions. The
# first row after the header contains the sums of the partial results and the
# average time for all the function calls listed. The following rows contain the
# function call, followed by the number of times that the function was called,
# then by the percentage of time that the call uses, then the total time for that
# function in microseconds, and, finally, the average time per call in
# microseconds.

# When --matching option is specified, call count tracing will be started only
# for the functions matching the given pattern:

#     #                                               CALLS     % TIME µS/CALL
#     Total                                               5 100.0    6    1.20
#     String.Chars.Integer.to_string/1                    5 100.0    6    1.20

#     Profile done over 1 matching functions

# The pattern can be a module name, such as String to count all calls to that
# module, a call without arity, such as String.split, to count all calls to that
# function regardless of arity, or a call with arity, such as String.split/3, to
# count all calls to that exact module, function and arity.

# ## Caveats

# You should be aware that the code being profiled is running in an anonymous
# function which is invoked by :eprof module
# (https://www.erlang.org/doc/man/eprof.html). Thus, you'll see some additional
# entries in your profile output. It is also important to note that the profiler
# is stopped as soon as the code has finished running, and this may need special
# attention, when: running asynchronous code as function calls which were called
# before the profiler stopped will not be counted; running synchronous code as
# long running computations and a profiler without a proper MFA trace pattern or
# filter may lead to a result set which is difficult to comprehend.

# You should expect a slowdown in your code execution using this tool since
# :eprof has some performance impact on the execution, but the impact is
# considerably lower than Mix.Tasks.Profile.Fprof. If you have a large system try
# to profile a limited scenario or focus on the main modules or processes.
# Another alternative is to use Mix.Tasks.Profile.Cprof that uses :cprof and has
# a low performance degradation effect.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" profile_fprof
profile_fprof:
	mix profile.fprof
# Profiles the given file or expression using Erlang's fprof tool.

# fprof can be useful when you want to discover the bottlenecks of a sequential
# code.

# Before running the code, it invokes the app.start task which compiles and loads
# your project. After that, the target expression is profiled, together with all
# processes which are spawned by it. Other processes (for example, those residing
# in the OTP application supervision tree) are not profiled.

# To profile the code, you can use syntax similar to the mix run task:

#     $ mix profile.fprof -e Hello.world
#     $ mix profile.fprof my_script.exs arg1 arg2 arg3

# This task is automatically re-enabled, so you can profile multiple times in the
# same Mix invocation.

# ## Command line options

#   • --callers - prints detailed information about immediate callers and
#     called functions
#   • --details - includes profile data for each profiled process
#   • --sort key - sorts the output by given key: acc (default) or own
#   • --trace-to-file - uses a file to trace. Can improve performance and
#     memory usage for larger workloads
#   • --eval, -e - evaluates the given code
#   • --require, -r - requires pattern before running the command
#   • --parallel, -p - makes all requires parallel
#   • --no-compile    - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-archives-check - does not check archives
#   • --no-start - does not start applications after compilation
#   • --no-elixir-version-check - does not check the Elixir version from
#     mix.exs
#   • --no-warmup - does not execute code once before profiling

# ## Profile output

# Example output:

#     #                                        CNT    ACC (ms)    OWN (ms)
#     Total                                 200279    1972.188    1964.579
#     :fprof.apply_start_stop/4                  0    1972.188       0.012
#     anonymous fn/0 in :elixir_compiler_2       1    1972.167       0.001
#     Test.run/0                                 1    1972.166       0.007
#     Test.do_something/1                        3    1972.131       0.040
#     Test.bottleneck/0                          1    1599.490       0.007
#     ...

# The default output contains data gathered from all profiled processes. All
# times are wall clock milliseconds. The columns have the following meaning:

#   • CNT - total number of invocations of the given function
#   • ACC - total time spent in the function
#   • OWN - time spent in the function, excluding the time of called
#     functions

# The first row (Total) is the sum of all functions executed in all profiled
# processes. For the given output, we had a total of 200279 function calls and
# spent about 2 seconds running the code.

# More detailed information is returned if you provide the --callers and
# --details options.

# When --callers option is specified, you'll see expanded function entries:

#     Mod.caller1/0                             3     200.000       0.017
#     Mod.caller2/0                             2     100.000       0.017
#       Mod.some_function/0                     5     300.000       0.017  <--
#         Mod.called1/0                         4     250.000       0.010
#         Mod.called2/0                         1      50.000       0.030

# Here, the arrow (<--) indicates the marked function - the function described by
# this paragraph. You also see its immediate callers (above) and called functions
# (below).

# All the values of caller functions describe the marked function. For example,
# the first row means that Mod.caller1/0 invoked Mod.some_function/0 3 times.
# 200ms of the total time spent in Mod.some_function/0 was spent processing calls
# from this particular caller.

# In contrast, the values for the called functions describe those functions, but
# in the context of the marked function. For example, the last row means that
# Mod.called2/0 was called once by Mod.some_function/0, and in that case the
# total time spent in the function was 50ms.

# For a detailed explanation it's worth reading the analysis in Erlang/OTP
# documentation for fprof (https://www.erlang.org/doc/man/fprof.html#analysis).

# ## Caveats

# You should be aware that the code being profiled is running in an anonymous
# function which is invoked by :fprof module
# (https://www.erlang.org/doc/man/fprof.html). Thus, you'll see some additional
# entries in your profile output, such as :fprof calls, an anonymous function
# with high ACC time, or an :undefined function which represents the outer caller
# (non-profiled code which started the profiler).

# Also, keep in mind that profiling might significantly increase the running time
# of the profiled processes. This might skew your results if, for example, those
# processes perform some I/O operations, since running time of those operations
# will remain unchanged, while CPU bound operations of the profiled processes
# might take significantly longer. Thus, when profiling some intensive program,
# try to reduce such dependencies, or be aware of the resulting bias.

# Finally, it's advised to profile your program with the prod environment, since
# this should provide more realistic insights into bottlenecks.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" release
release:
	mix release
# Assembles a self-contained release for the current project:

#     $ MIX_ENV=prod mix release
#     $ MIX_ENV=prod mix release NAME

# Once a release is assembled, it can be packaged and deployed to a target, as
# long as the target runs on the same operating system (OS) distribution and
# version as the machine running the mix release command.

# A release can be configured in your mix.exs file under the :releases key inside
# def project:

#     def project do
#       [
#         releases: [
#           demo: [
#             include_executables_for: [:unix],
#             applications: [runtime_tools: :permanent]
#           ],

#           ...
#         ]
#       ]
#     end

# You can specify multiple releases where the key is the release name and the
# value is a keyword list with the release configuration. Releasing a certain
# name is done with:

#     $ MIX_ENV=prod mix release demo

# If the given name does not exist, an error is raised.

# If mix release is invoked, without specifying a release name, and there are
# multiple releases configured, an error will be raised unless you set
# default_release: NAME at the root of your project configuration.

# If mix release is invoked and there are no releases configured, a release is
# assembled using the application name and default values.

# ## Why releases?

# Releases allow developers to precompile and package all of their code and the
# runtime into a single unit. The benefits of releases are:

#   • Code preloading. The VM has two mechanisms for loading code:
#     interactive and embedded. By default, it runs in the interactive mode which
#     dynamically loads modules when they are used for the first time. The first
#     time your application calls Enum.map/2, the VM will find the Enum module
#     and load it. There's a downside: when you start a new server in production,
#     it may need to load many other modules, causing the first requests to have
#     an unusual spike in response time. With releases, the system preloads all
#     modules and guarantees your system is ready to handle requests after
#     booting.
#   • Configuration and customization. Releases give developers fine grained
#     control over system configuration and the VM flags used to start the
#     system.
#   • Self-contained. A release does not require the source code to be
#     included in your production artifacts. All of the code is precompiled and
#     packaged. Releases do not even require Erlang or Elixir in your servers, as
#     it includes the Erlang VM and its runtime by default. Furthermore, both
#     Erlang and Elixir standard libraries are stripped to bring only the parts
#     you are actually using.
#   • Multiple releases. You can assemble different releases with different
#     configuration per application or even with different applications
#     altogether.
#   • Management scripts. Releases come with scripts to start, restart,
#     connect to the running system remotely, execute RPC calls, run as daemon,
#     run as a Windows service, and more.

# ## Running the release

# Once a release is assembled, you can start it by calling bin/RELEASE_NAME start
# inside the release. In production, you would do:

#     $ MIX_ENV=prod mix release
#     $ _build/prod/rel/my_app/bin/my_app start

# bin/my_app start will start the system connected to the current standard
# input/output, where logs are also written to by default. This is the preferred
# way to run the system. Many tools, such as systemd, platforms as a service,
# such as Heroku, and many containers platforms, such as Docker, are capable of
# processing the standard input/output and redirecting the log contents
# elsewhere. Those tools and platforms also take care of restarting the system in
# case it crashes.

# You can also execute one-off commands, run the release as a daemon on Unix-like
# system, or install it as a service on Windows. We will take a look at those
# next. You can also list all available commands by invoking bin/RELEASE_NAME.

# ### One-off commands (eval and rpc)

# If you want to invoke specific modules and functions in your release, you can
# do so in two ways: using eval or rpc.

#     $ bin/RELEASE_NAME eval "IO.puts(:hello)"
#     $ bin/RELEASE_NAME rpc "IO.puts(:hello)"

# The eval command starts its own instance of the VM but without starting any of
# the applications in the release and without starting distribution. For example,
# if you need to do some prep work before running the actual system, like
# migrating your database, eval can be a good fit. Just keep in mind any
# application you may use during eval has to be explicitly started.

# You can start an application by calling Application.ensure_all_started/1. From
# Elixir v1.16, it is guaranteed the applications have been at least loaded. In
# earlier versions, if you needed to load applications but not start them, you
# also needed to call Application.load/1.

# Another way to run commands is with rpc, which will connect to the system
# currently running and instruct it to execute the given expression. This means
# you need to guarantee the system was already started and be careful with the
# instructions you are executing. You can also use remote to connect a remote IEx
# session to the system.

# #### Helper module

# As you operate your system, you may find yourself running some piece of code as
# a one-off command quite often. You may consider creating a module to group
# these tasks:

#     # lib/my_app/release_tasks.ex
#     defmodule MyApp.ReleaseTasks do
#       def eval_purge_stale_data() do
#         # Eval commands needs to start the app before
#         # Or Application.load(:my_app) if you can't start it
#         Application.ensure_all_started(:my_app)

#         # Code that purges stale data
#         ...
#       end

#       def rpc_print_connected_users() do
#         # Code that print users connected to the current running system
#         ...
#       end
#     end

# In the example above, we prefixed the function names with the command name used
# to execute them, but that is entirely optional.

# And to run them:

#     $ bin/RELEASE_NAME eval "MyApp.ReleaseTasks.eval_purge_stale_data()"
#     $ bin/RELEASE_NAME rpc "MyApp.ReleaseTasks.rpc_print_connected_users()"

# ### Daemon mode (Unix-like)

# You can run the release in daemon mode with the command:

#     $ bin/RELEASE_NAME daemon

# In daemon mode, the system is started on the background via run_erl
# (https://www.erlang.org/doc/man/run_erl.html). You may also want to enable
# heart (https://www.erlang.org/doc/man/heart.html) in daemon mode so it
# automatically restarts the system in case of crashes. See the generated
# releases/RELEASE_VSN/env.sh file.

# The daemon will write all of its standard output to the "tmp/log/" directory in
# the release root. You can watch the log file by doing tail -f
# tmp/log/erlang.log.1 or similar. Once files get too large, the index suffix
# will be incremented. A developer can also attach to the standard input of the
# daemon by invoking "to_erl tmp/pipe/" from the release root. However, note that
# attaching to the system should be done with extreme care, since the usual
# commands for exiting an Elixir system, such as hitting Ctrl+C twice or Ctrl+,
# will actually shut down the daemon. Therefore, using bin/RELEASE_NAME remote
# should be preferred, even in daemon mode.

# You can customize the tmp directory used both for logging and for piping in
# daemon mode by setting the RELEASE_TMP environment variable. See the
# "Customization" section.

# ### Services mode (Windows)

# While daemons are not available on Windows, it is possible to install a
# released system as a service on Windows with the help of erlsrv
# (https://www.erlang.org/doc/man/erlsrv.html). This can be done by running:

#     $ bin/RELEASE_NAME install

# Once installed, the service must be explicitly managed via the erlsrv
# executable, which is included in the erts-VSN/bin directory. The service is not
# started automatically after installing.

# For example, if you have a release named demo, you can install the service and
# then start it from the release root as follows:

#     $ bin/demo install
#     $ erts-VSN/bin/erlsrv.exe start demo_demo

# The name of the service is demo_demo because the name is built by concatenating
# the node name with the release name. Since Elixir automatically uses the same
# name for both, the service will be referenced as demo_demo.

# The install command must be executed as an administrator.

# ### `bin/RELEASE_NAME` commands

# The following commands are supported by bin/RELEASE_NAME:

#     start        Starts the system
#     start_iex    Starts the system with IEx attached
#     daemon       Starts the system as a daemon (Unix-like only)
#     daemon_iex   Starts the system as a daemon with IEx attached (Unix-like only)
#     install      Installs this system as a Windows service (Windows only)
#     eval "EXPR"  Executes the given expression on a new, non-booted system
#     rpc "EXPR"   Executes the given expression remotely on the running system
#     remote       Connects to the running system via a remote shell
#     restart      Restarts the running system via a remote command
#     stop         Stops the running system via a remote command
#     pid          Prints the operating system PID of the running system via a remote command
#     version      Prints the release name and version to be booted

# ## Deployments

# ### Requirements

# A release is built on a **host**, a machine which contains Erlang, Elixir, and
# any other dependencies needed to compile your application. A release is then
# deployed to a **target**, potentially the same machine as the host, but usually
# separate, and often there are many targets (either multiple instances, or the
# release is deployed to heterogeneous environments).

# To deploy straight from a host to a separate target without cross-compilation,
# the following must be the same between the host and the target:

#   • Target architecture (for example, x86_64 or ARM)
#   • Target vendor + operating system (for example, Windows, Linux, or
#     Darwin/macOS)
#   • Target ABI (for example, musl or gnu)

# This is often represented in the form of target triples, for example,
# x86_64-unknown-linux-gnu, x86_64-unknown-linux-musl, x86_64-apple-darwin.

# So to be more precise, to deploy straight from a host to a separate target, the
# Erlang Runtime System (ERTS), and any native dependencies (NIFs), must be
# compiled for the same target triple. If you are building on a MacBook
# (x86_64-apple-darwin) and trying to deploy to a typical Ubuntu machine
# (x86_64-unknown-linux-gnu), the release will not work. Instead you should build
# the release on a x86_64-unknown-linux-gnu host. As we will see, this can be
# done in multiple ways, such as releasing on the target itself, or by using
# virtual machines or containers, usually as part of your release pipeline.

# In addition to matching the target triple, it is also important that the target
# has all of the system packages that your application will need at runtime. A
# common one is the need for OpenSSL when building an application that uses
# :crypto or :ssl, which is dynamically linked to ERTS. The other common source
# for native dependencies like this comes from dependencies containing NIFs
# (natively-implemented functions) which may expect to dynamically link to
# libraries they use.

# Of course, some operating systems and package managers can differ between
# versions, so if your goal is to have full compatibility between host and
# target, it is best to ensure the operating system and system package manager
# have the same versions on host and target. This may even be a requirement in
# some systems, especially so with package managers that try to create fully
# reproducible environments (Nix, Guix).

# Similarly, when creating a stand-alone package and release for Windows, note
# the Erlang Runtime System has a dependency to some Microsoft libraries (Visual
# C++ Redistributable Packages for Visual Studio 2013). These libraries are
# installed (if not present before) when Erlang is installed but it is not part
# of the standard Windows environment. Deploying a stand-alone release on a
# computer without these libraries will result in a failure when trying to run
# the release. One way to solve this is to download and install these Microsoft
# libraries the first time a release is deployed (the Erlang installer version
# 10.6 ships with “Microsoft Visual C++ 2013 Redistributable - 12.0.30501”).

# Alternatively, you can also bundle the compiled object files in the release, as
# long as they were compiled for the same target. If doing so, you need to update
# LD_LIBRARY_PATH environment variable with the paths containing the bundled
# objects on Unix-like systems or the $PATH environment variable on Windows
# systems.

# Currently, there is no official way to cross-compile a release from one target
# triple to another, due to the complexities involved in the process.

# ### Techniques

# There are a couple of ways to guarantee that a release is built on a host with
# the same properties as the target. A simple option is to fetch the source,
# compile the code and assemble the release on the target itself. It would be
# something like this:

#     $ git clone remote://path/to/my_app.git my_app_source
#     $ cd my_app_source
#     $ mix deps.get --only prod
#     $ MIX_ENV=prod mix release
#     $ _build/prod/rel/my_app/bin/my_app start

# If you prefer, you can also compile the release to a separate directory, so you
# can erase all source after the release is assembled:

#     $ git clone remote://path/to/my_app.git my_app_source
#     $ cd my_app_source
#     $ mix deps.get --only prod
#     $ MIX_ENV=prod mix release --path ../my_app_release
#     $ cd ../my_app_release
#     $ rm -rf ../my_app_source
#     $ bin/my_app start

# However, this option can be expensive if you have multiple production nodes or
# if the release assembling process is a long one, as each node needs to
# individually assemble the release.

# You can automate this process in a couple different ways. One option is to make
# it part of your Continuous Integration (CI) / Continuous Deployment (CD)
# pipeline. When you have a CI/CD pipeline, it is common that the machines in
# your CI/CD pipeline run on the exact same target triple as your production
# servers (if they don't, they should). In this case, you can assemble the
# release at the end of your CI/CD pipeline by calling MIX_ENV=prod mix release
# and push the artifact to S3 or any other network storage. To perform the
# deployment, your production machines can fetch the deployment from the network
# storage and run bin/my_app start.

# Another mechanism to automate deployments is to use images, such as Amazon
# Machine Images, or container platforms, such as Docker. For instance, you can
# use Docker to run locally a system with the exact same target triple as your
# production servers. Inside the container, you can invoke MIX_ENV=prod mix
# release and build a complete image and/or container with the operating system,
# all dependencies as well as the releases.

# In other words, there are multiple ways systems can be deployed and releases
# can be automated and incorporated into all of them as long as you remember to
# build the system in the same target triple.

# Once a system is deployed, shutting down the system can be done by sending
# SIGINT/SIGTERM to the system, which is what most containers, platforms and
# tools do, or by explicitly invoking bin/RELEASE_NAME stop. Once the system
# receives the shutdown request, each application and their respective
# supervision trees will stop, one by one, in the opposite order that they were
# started.

# ## Customization

# There are a couple ways in which developers can customize the generated
# artifacts inside a release.

# ### Options

# The following options can be set inside your mix.exs on each release
# definition:

#   • :applications - a keyword list with application names as keys and their
#     mode as value. By default :applications includes the current application
#     and all applications the current application depends on, recursively. You
#     can include new applications or change the mode of existing ones by listing
#     them here.
#     The order of the applications given will be preserved as much as possible,
#     with only :kernel, :stdlib, :sasl, and :elixir listed before the given
#     application list. The supported values are:

#     • :permanent (default) - the application is started and the node
#       shuts down if the application terminates, regardless of reason
#     • :transient - the application is started and the node shuts down if
#       the application terminates abnormally
#     • :temporary - the application is started and the node does not shut
#       down if the application terminates
#     • :load - the application is only loaded
#     • :none - the application is part of the release but it is neither
#       loaded nor started

#     If you change the mode of an application, the mode will apply to all its
#     child applications. However, if an application has two parents, the mode of
#     the parent with highest priority wins (where :permanent has the highest
#     priority, according to the list above).

#   • :strip_beams - controls if BEAM files should have their debug
#     information, documentation chunks, and other non-essential metadata
#     removed. Defaults to true. May be set to false to disable stripping. Also
#     accepts [keep: ["Docs", "Dbgi"]] to keep certain chunks that are usually
#     stripped. You can also set the :compress option to true to enable
#     individual compression of BEAM files, although it is typically preferred to
#     compress the whole release instead.
#   • :cookie - a string representing the Erlang Distribution cookie. If this
#     option is not set, a random cookie is written to the releases/COOKIE file
#     when the first release is assembled. At runtime, we will first attempt to
#     fetch the cookie from the RELEASE_COOKIE environment variable and then
#     we'll read the releases/COOKIE file.
#     If you are setting this option manually, we recommend the cookie option to
#     be a long and randomly generated string, such as:
#     Base.url_encode64(:crypto.strong_rand_bytes(40)). We also recommend to
#     restrict the characters in the cookie to the subset returned by
#     Base.url_encode64/1.

#   • :validate_compile_env - by default a release will match all runtime
#     configuration against any configuration that was marked at compile time in
#     your application of its dependencies via the Application.compile_env/3
#     function. If there is a mismatch between those, it means your system is
#     misconfigured and unable to boot. You can disable this check by setting
#     this option to false.
#   • :path - the path the release should be installed to. Defaults to
#     "_build/MIX_ENV/rel/RELEASE_NAME".
#   • :version - the release version as a string or {:from_app, app_name}.
#     Defaults to the current application version. The {:from_app, app_name}
#     format can be used to easily reference the application version from another
#     application. This is particularly useful in umbrella applications.
#   • :quiet - a boolean that controls if releases should write steps to the
#     standard output. Defaults to false.
#   • :include_erts - a boolean, string, or anonymous function of arity zero.
#     If a boolean, it indicates whether the Erlang Runtime System (ERTS), which
#     includes the Erlang VM, should be included in the release. The default is
#     true, which is also the recommended value. If a string, it represents the
#     path to an existing ERTS installation. If an anonymous function of arity
#     zero, it's a function that returns any of the above (boolean or string).
#     You may also set this option to false if you desire to use the ERTS version
#     installed on the target. Note, however, that the ERTS version on the target
#     must have the exact version as the ERTS version used when the release is
#     assembled. Setting it to false also disables hot code upgrades. Therefore,
#     :include_erts should be set to false with caution and only if you are
#     assembling the release on the same server that runs it.

#   • :include_executables_for - a list of atoms detailing for which
#     Operating Systems executable files should be generated for. By default, it
#     is set to [:unix, :windows]. You can customize those as follows:
#         releases: [
#           demo: [
#             include_executables_for: [:unix] # Or [:windows] or []
#           ]
#         ]

#   • :rel_templates_path - the path to find template files that are copied
#     to the release, such as "vm.args.eex", "remote.vm.args.eex", "env.sh.eex"
#     (or "env.bat.eex"), and "overlays". Defaults to "rel" in the project root.
#   • :overlays - a list of directories with extra files to be copied as is
#     to the release. The "overlays" directory at :rel_templates_path is always
#     included in this list by default (typically at "rel/overlays"). See the
#     "Overlays" section for more information.
#   • :steps - a list of steps to execute when assembling the release. See
#     the "Steps" section for more information.
#   • :skip_mode_validation_for - a list of application names (atoms)
#     specifying applications to skip strict validation of "unsafe" modes. An
#     "unsafe" case is when a parent application mode is :permanent but one of
#     the applications it depends on is set to :load. Use this with care, as a
#     release with invalid modes may no longer boot without additional tweaks.
#     Defaults to [].

# Note each release definition can be given as an anonymous function. This is
# useful if some release attributes are expensive to compute:

#     releases: [
#       demo: fn ->
#         [version: @version <> "+" <> git_ref()]
#       end
#     ]

# Besides the options above, it is possible to customize the generated release
# with custom files, by tweaking the release steps or by running custom options
# and commands on boot. We will detail both approaches next.

# ### Overlays

# Often it is necessary to copy extra files to the release root after the release
# is assembled. This can be easily done by placing such files in the rel/overlays
# directory. Any file in there is copied as is to the release root. For example,
# if you have placed a "rel/overlays/Dockerfile" file, the "Dockerfile" will be
# copied as is to the release root.

# If you want to specify extra overlay directories, you can do so with the
# :overlays option. If you need to copy files dynamically, see the "Steps"
# section.

# ### Steps

# It is possible to add one or more steps before and after the release is
# assembled. This can be done with the :steps option:

#     releases: [
#       demo: [
#         steps: [&set_configs/1, :assemble, &copy_extra_files/1]
#       ]
#     ]

# The :steps option must be a list and it must always include the atom :assemble,
# which does most of the release assembling. You can pass anonymous functions
# before and after the :assemble to customize your release assembling pipeline.
# Those anonymous functions will receive a Mix.Release struct and must return the
# same or an updated Mix.Release struct. It is also possible to build a tarball
# of the release by passing the :tar step anywhere after :assemble. If the
# release :path is not configured, the tarball is created in
# _build/MIX_ENV/RELEASE_NAME-RELEASE_VSN.tar.gz Otherwise it is created inside
# the configured :path.

# See Mix.Release for more documentation on the struct and which fields can be
# modified. Note that the :steps field itself can be modified and it is updated
# every time a step is called. Therefore, if you need to execute a command before
# and after assembling the release, you only need to declare the first steps in
# your pipeline and then inject the last step into the release struct. The steps
# field can also be used to verify if the step was set before or after assembling
# the release.

# ### vm.args and env.sh (env.bat)

# Developers may want to customize the VM flags and environment variables given
# when the release starts. The simplest way to customize those files is by
# running mix release.init. The Mix task will copy custom rel/vm.args.eex,
# rel/remote.vm.args.eex,  rel/env.sh.eex, and rel/env.bat.eex files to your
# project root. You can modify those files and they will be evaluated every time
# you perform a new release. Those files are regular EEx templates and they have
# a single assign, called @release, with the Mix.Release struct.

# The vm.args and remote.vm.args files may contain any of the VM flags accepted
# by the erl command (https://www.erlang.org/doc/man/erl.html).

# The env.sh and env.bat is used to set environment variables. In there, you can
# set vars such as RELEASE_NODE, RELEASE_COOKIE, and RELEASE_TMP to customize
# your node name, cookie and tmp directory respectively. Whenever env.sh or
# env.bat is invoked, the variables RELEASE_ROOT, RELEASE_NAME, RELEASE_VSN, and
# RELEASE_COMMAND have already been set, so you can rely on them. See the section
# on environment variables for more information.

# Furthermore, while the vm.args files are static, you can use env.sh and env.bat
# to dynamically set VM options. For example, if you want to make sure the Erlang
# Distribution listens only on a given port known at runtime, you can set the
# following:

#     case $RELEASE_COMMAND in
#       start*|daemon*)
#         ELIXIR_ERL_OPTIONS="-kernel inet_dist_listen_min $BEAM_PORT inet_dist_listen_max $BEAM_PORT"
#         export ELIXIR_ERL_OPTIONS
#         ;;
#       *)
#         ;;
#     esac

# Note we only set the port on start/daemon commands. If you also limit the port
# on other commands, such as rpc, then you will be unable to establish a remote
# connection as the port will already be in use by the node.

# On Windows, your env.bat would look like this:

#     IF NOT %RELEASE_COMMAND:start=%==%RELEASE_COMMAND% (
#       set ELIXIR_ERL_OPTIONS="-kernel inet_dist_listen_min %BEAM_PORT% inet_dist_listen_max %BEAM_PORT%"
#     )

# Inside env.sh and env.bat files you can access command-line arguments given to
# release commands. For example, given this env.sh.eex:

#     echo $@

# or this env.bat.eex:

#     echo %*

# starting the release with bin/myapp start --foo bar baz will print start --foo
# bar baz.

# ## Application configuration

# Mix provides two mechanisms for configuring the application environment of your
# application and your dependencies: build-time and runtime. On this section, we
# will learn how those mechanisms apply to releases. An introduction to this
# topic can be found in the "Configuration" section of the Mix module.

# ### Build-time configuration

# Whenever you invoke a mix command, Mix loads the configuration in
# config/config.exs, if said file exists. We say that this configuration is a
# build-time configuration as it is evaluated whenever you compile your code or
# whenever you assemble the release.

# In other words, if your configuration does something like:

#     import Config
#     config :my_app, :secret_key, System.fetch_env!("MY_APP_SECRET_KEY")

# The :secret_key key under :my_app will be computed on the host machine,
# whenever the release is built. Therefore if the machine assembling the release
# not have access to all environment variables used to run your code, loading the
# configuration will fail as the environment variable is missing. Luckily, Mix
# also provides runtime configuration, which should be preferred and we will see
# next.

# ### Runtime configuration

# To enable runtime configuration in your release, all you need to do is to
# create a file named config/runtime.exs:

#     import Config
#     config :my_app, :secret_key, System.fetch_env!("MY_APP_SECRET_KEY")

# This file will be executed whenever your Mix project or your release starts.

# Your config/runtime.exs file needs to follow three important rules:

#   • It MUST import Config at the top instead of the deprecated use
#     Mix.Config
#   • It MUST NOT import any other configuration file via import_config
#   • It MUST NOT access Mix in any way, as Mix is a build tool and it is not
#     available inside releases

# If a config/runtime.exs exists, it will be copied to your release and executed
# early in the boot process, when only Elixir and Erlang's main applications have
# been started.

# You can change the path to the runtime configuration file by setting
# :runtime_config_path inside each release configuration. This path is resolved
# at build time as the given configuration file is always copied to inside the
# release:

#     releases: [
#       demo: [
#         runtime_config_path: ...
#       ]
#     ]

# By setting :runtime_config_path to false it can be used to prevent a runtime
# configuration file to be included in the release.

# ### Config providers

# Releases also supports custom mechanisms, called config providers, to load any
# sort of runtime configuration to the system while it boots. For instance, if
# you need to access a vault or load configuration from a JSON file, it can be
# achieved with config providers. The runtime configuration outlined in the
# previous section is handled by the Config.Reader provider. See the
# Config.Provider module for more information and more examples.

# The following options can be set inside your releases key in your mix.exs to
# control how config providers work:

#   • :reboot_system_after_config - reboot the system after configuration so
#     you can configure system applications, such as :kernel and :stdlib, in your
#     config/runtime.exs. Generally speaking, it is best to configure :kernel and
#     :stdlib using the vm.args file but this option is available for those who
#     need more complex configuration. When set to true, the release will first
#     boot in interactive mode to compute a config file and write it to the "tmp"
#     directory. Then it reboots in the configured RELEASE_MODE. You can
#     configure the "tmp" directory by setting the RELEASE_TMP environment
#     variable, either explicitly or inside your releases/RELEASE_VSN/env.sh (or
#     env.bat on Windows). Defaults to true if using the deprecated
#     config/releases.exs, false otherwise.
#   • :prune_runtime_sys_config_after_boot - if :reboot_system_after_config
#     is set, every time your system boots, the release will write a config file
#     to your tmp directory. These configuration files are generally small. But
#     if you are concerned with disk space or if you have other restrictions, you
#     can ask the system to remove said config files after boot. The downside is
#     that you will no longer be able to restart the system internally (neither
#     via System.restart/0 nor bin/RELEASE_NAME restart). If you need a restart,
#     you will have to terminate the Operating System process and start a new
#     one. Defaults to false.
#   • :start_distribution_during_config - if :reboot_system_after_config is
#     set, releases only start the Erlang VM distribution features after the
#     config files are evaluated. You can set it to true if you need distribution
#     during configuration. Defaults to false.
#   • :config_providers - a list of tuples with custom config providers. See
#     Config.Provider for more information. Defaults to [].

# ### Customization and configuration summary

# Generally speaking, the following files are available for customizing and
# configuring the running system:

#   • config/config.exs (and config/prod.exs) - provides build-time
#     application configuration, which are executed when the release is assembled
#   • config/runtime.exs - provides runtime application configuration. It is
#     executed every time your Mix project or your release boots and is further
#     extensible via config providers. If you want to detect you are inside a
#     release, you can check for release specific environment variables, such as
#     RELEASE_NODE or RELEASE_MODE
#   • rel/vm.args.eex and rel/remote.vm.args.eex - template files that are
#     copied into every release and provides static configuration of the Erlang
#     Virtual Machine and other runtime flags. vm.args runs on start, daemon, and
#     eval commands. remote.vm.args configures the VM for remote and rpc commands
#   • rel/env.sh.eex and rel/env.bat.eex - template files that are copied
#     into every release and are executed on every command to set up environment
#     variables, including specific ones to the VM, and the general environment

# ## Directory structure

# A release is organized as follows:

#     bin/
#       RELEASE_NAME
#     erts-ERTS_VSN/
#     lib/
#       APP_NAME-APP_VSN/
#         ebin/
#         include/
#         priv/
#     releases/
#       RELEASE_VSN/
#         consolidated/
#         elixir
#         elixir.bat
#         env.bat
#         env.sh
#         iex
#         iex.bat
#         remote.vm.args
#         runtime.exs
#         start.boot
#         start.script
#         start_clean.boot
#         start_clean.script
#         sys.config
#         vm.args
#       COOKIE
#       start_erl.data
#     tmp/

# We document this structure for completeness. In practice, developers should not
# modify any of those files after the release is assembled. Instead use env
# scripts, custom config provider, overlays, and all other mechanisms described
# in this guide to configure how your release works.

# ## Environment variables

# The system sets different environment variables. The following variables are
# set early on and can only be read by env.sh and env.bat:

#   • RELEASE_ROOT - points to the root of the release. If the system
#     includes ERTS, then it is the same as :code.root_dir/0. This variable is
#     always computed and it cannot be set to a custom value
#   • RELEASE_COMMAND - the command given to the release, such as "start",
#     "remote", "eval", and so on. This is typically accessed inside env.sh and
#     env.bat to set different environment variables under different conditions.
#     Note, however, that RELEASE_COMMAND has not been validated by the time
#     env.sh and env.bat are called, so it may be empty or contain invalid
#     values. This variable is always computed and it cannot be set to a custom
#     value
#   • RELEASE_NAME - the name of the release. It can be set to a custom value
#     when invoking the release
#   • RELEASE_VSN - the version of the release, otherwise the latest version
#     is used. It can be set to a custom value when invoking the release. The
#     custom value must be an existing release version in the releases/ directory
#   • RELEASE_PROG - the command line executable used to start the release

# The following variables can be set before you invoke the release or inside
# env.sh and env.bat:

#   • RELEASE_COOKIE - the release cookie. By default uses the value in
#     releases/COOKIE. It can be set to a custom value
#   • RELEASE_NODE - the release node name, in the format name or optionally
#     name@host if running in distributed mode. It can be set to a custom value.
#     The name part must be made only of letters, digits, underscores, and
#     hyphens
#   • RELEASE_SYS_CONFIG - the location of the sys.config file. It can be set
#     to a custom path and it must not include the .config extension
#   • RELEASE_VM_ARGS - the location of the vm.args file. It can be set to a
#     custom path
#   • RELEASE_REMOTE_VM_ARGS - the location of the remote.vm.args file. It
#     can be set to a custom path
#   • RELEASE_TMP - the directory in the release to write temporary files to.
#     It can be set to a custom directory. It defaults to $RELEASE_ROOT/tmp
#   • RELEASE_MODE - if the release should load code on demand (interactive)
#     or preload it (embedded). Defaults to "embedded", which increases boot time
#     but it means the runtime will respond faster as it doesn't have to load
#     code. Choose interactive if you need to decrease boot time and reduce
#     memory usage on boot. It applies only to start/daemon/install commands
#   • RELEASE_DISTRIBUTION - how do we want to run the distribution. May be
#     name (long names), sname (short names) or none (distribution is not started
#     automatically). Defaults to sname which allows access only within the
#     current system. name allows external connections
#   • RELEASE_BOOT_SCRIPT - the name of the boot script to use when starting
#     the release. This script is used when running commands such as start and
#     daemon. The boot script is expected to be located at the path
#     releases/RELEASE_VSN/RELEASE_BOOT_SCRIPT.boot. Defaults to start
#   • RELEASE_BOOT_SCRIPT_CLEAN - the name of the boot script used when
#     starting the release clean, without your application or its dependencies.
#     This script is used by commands such as eval, rpc, and remote. The boot
#     script is expected to be located at the path
#     releases/RELEASE_VSN/RELEASE_BOOT_SCRIPT_CLEAN.boot. Defaults to
#     start_clean

# ## Umbrellas

# Releases are well integrated with umbrella projects, allowing you to release
# one or more subsets of your umbrella children. The only difference between
# performing a release in the umbrella project compared to a regular application
# is that umbrellas require you to explicitly list your release and the starting
# point for each release. For example, imagine this umbrella applications:

#     my_app_umbrella/
#       apps/
#         my_app_core/
#         my_app_event_processing/
#         my_app_web/

# where both my_app_event_processing and my_app_web depend on my_app_core but
# they do not depend on each other.

# Inside your umbrella, you can define multiple releases:

#     releases: [
#       web_and_event_processing: [
#         applications: [
#           my_app_event_processing: :permanent,
#           my_app_web: :permanent
#         ]
#       ],

#       web_only: [
#         applications: [my_app_web: :permanent]
#       ],

#       event_processing_only: [
#         applications: [my_app_event_processing: :permanent]
#       ]
#     ]

# Note you don't need to define all applications in :applications, only the entry
# points. Also remember that the recommended mode for all applications in the
# system is :permanent.

# Finally, keep in mind it is not required for you to assemble the release from
# the umbrella root. You can also assemble the release from each child
# application individually. Doing it from the root, however, allows you to
# include two applications that do not depend on each other as part of the same
# release.

# ## Hot Code Upgrades

# Erlang and Elixir are sometimes known for the capability of upgrading a node
# that is running in production without shutting down that node. However, this
# feature is not supported out of the box by Elixir releases.

# The reason we don't provide hot code upgrades is because they are very
# complicated to perform in practice, as they require careful coding of your
# processes and applications as well as extensive testing. Given most teams can
# use other techniques that are language agnostic to upgrade their systems, such
# as Blue/Green deployments, Canary deployments, Rolling deployments, and others,
# hot upgrades are rarely a viable option. Let's understand why.

# In a hot code upgrade, you want to update a node from version A to version B.
# To do so, the first step is to write recipes for every application that changed
# between those two releases, telling exactly how the application changed between
# versions, those recipes are called .appup files. While some of the steps in
# building .appup files can be automated, not all of them can. Furthermore, each
# process in the application needs to be explicitly coded with hot code upgrades
# in mind. Let's see an example. Imagine your application has a counter process
# as a GenServer:

#     defmodule Counter do
#       use GenServer

#       def start_link(_) do
#         GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
#       end

#       def bump do
#         GenServer.call(__MODULE__, :bump)
#       end

#       ## Callbacks

#       def init(:ok) do
#         {:ok, 0}
#       end

#       def handle_call(:bump, counter) do
#         {:reply, :ok, counter + 1}
#       end
#     end

# You add this process as part of your supervision tree and ship version 0.1.0 of
# your system. Now let's imagine that on version 0.2.0 you added two changes:
# instead of bump/0, that always increments the counter by one, you introduce
# bump/1 that passes the exact value to bump the counter. You also change the
# state, because you want to store the maximum bump value:

#     defmodule Counter do
#       use GenServer

#       def start_link(_) do
#         GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
#       end

#       def bump(by) do
#         GenServer.call(__MODULE__, {:bump, by})
#       end

#       ## Callbacks

#       def init(:ok) do
#         {:ok, {0, 0}}
#       end

#       def handle_call({:bump, by}, {counter, max}) do
#         {:reply, :ok, {counter + by, max(max, by)}}
#       end
#     end

# If you were to perform a hot code upgrade in such an application, it would
# crash, because in the initial version the state was just a counter but in the
# new version the state is a tuple. Furthermore, you changed the format of the
# call message from :bump to {:bump, by} and the process may have both old and
# new messages temporarily mixed, so we need to handle both. The final version
# would be:

#     defmodule Counter do
#       use GenServer

#       def start_link(_) do
#         GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
#       end

#       def bump(by) do
#         GenServer.call(__MODULE__, {:bump, by})
#       end

#       ## Callbacks

#       def init(:ok) do
#         {:ok, {0, 0}}
#       end

#       def handle_call(:bump, {counter, max}) do
#         {:reply, :ok, {counter + 1, max(max, 1)}}
#       end

#       def handle_call({:bump, by}, {counter, max}) do
#         {:reply, :ok, {counter + by, max(max, by)}}
#       end

#       def code_change(_, counter, _) do
#         {:ok, {counter, 0}}
#       end
#     end

# Now you can proceed to list this process in the .appup file and hot code
# upgrade it. This is one of the many steps necessary to perform hot code
# upgrades and it must be taken into account by every process and application
# being upgraded in the system. The .appup cookbook
# (https://www.erlang.org/doc/design_principles/appup_cookbook.html) provides a
# good reference and more examples.

# Once .appups are created, the next step is to create a .relup file with all
# instructions necessary to update the release itself. Erlang documentation does
# provide a chapter on Creating and upgrading a target system
# (https://www.erlang.org/doc/system_principles/create_target.html). Learn You
# Some Erlang has a chapter on hot code upgrades
# (https://learnyousomeerlang.com/relups).

# Overall, there are many steps, complexities and assumptions made during hot
# code upgrades, which is ultimately why they are not provided by Elixir out of
# the box. However, hot code upgrades can still be achieved by teams who desire
# to implement those steps on top of mix release in their projects or as separate
# libraries.

# ## Command line options

#   • --force - forces recompilation
#   • --no-archives-check - does not check archive
#   • --no-deps-check - does not check dependencies
#   • --no-elixir-version-check - does not check Elixir version
#   • --no-compile - does not compile before assembling the release
#   • --overwrite - overwrite existing files instead of prompting the user
#     for action
#   • --path - the path of the release
#   • --quiet - does not write progress to the standard output
#   • --version - the version of the release

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" release_init
release_init:
	mix release.init
# Generates sample files for releases.

#     $ mix release.init
#     * creating rel/vm.args.eex
#     * creating rel/remote.vm.args.eex
#     * creating rel/env.sh.eex
#     * creating rel/env.bat.eex

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" run
run:
	mix run
# Runs the current application.

# mix run starts the current application dependencies and the application itself.
# The application will be compiled if it has not been compiled yet or it is
# outdated.

# mix run may also run code in the application context through additional
# options. For example, to run a script within the current application, you may
# pass a filename as argument:

#     $ mix run my_app_script.exs arg1 arg2 arg3

# Code to be executed can also be passed inline with the -e option:

#     $ mix run -e "DbUtils.delete_old_records()" -- arg1 arg2 arg3

# In both cases, the command-line arguments for the script or expression are
# available in System.argv/0. This mirror the command line interface in the
# elixir executable.

# For starting long running systems, one typically passes the --no-halt option:

#     $ mix run --no-halt

# The --no-start option can also be given and the current application, nor its
# dependencies will be started. Alternatively, you may use mix eval to evaluate a
# single expression without starting the current application.

# If you need to pass options to the Elixir executable at the same time you use
# mix run, it can be done as follows:

#     $ elixir --sname hello -S mix run --no-halt

# This task is automatically re-enabled, so it can be called multiple times with
# different arguments.

# ## Command-line options

#   • --eval, -e - evaluates the given code
#   • --require, -r - executes the given pattern/file
#   • --parallel, -p - makes all requires parallel
#   • --preload-modules - preloads all modules defined in applications
#   • --no-archives-check - does not check archives
#   • --no-compile - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-elixir-version-check - does not check the Elixir version from
#     mix.exs
#   • --no-halt - does not halt the system after running the command
#   • --no-mix-exs - allows the command to run even if there is no mix.exs
#   • --no-start - does not start applications after compilation

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" test
test:
	mix test
# Runs the tests for a project.

# This task starts the current application, loads up test/test_helper.exs and
# then, requires all files matching the test/**/*_test.exs pattern in parallel.

# A list of files and/or directories can be given after the task name in order to
# select the files to run:

#     $ mix test test/some/particular/file_test.exs
#     $ mix test test/some/particular/dir

# Tests in umbrella projects can be run from the root by specifying the full
# suite path, including apps/my_app/test, in which case recursive tests for other
# child apps will be skipped completely:

#     # To run all tests for my_app from the umbrella root
#     $ mix test apps/my_app/test

#     # To run a given test file on my_app from the umbrella root
#     $ mix test apps/my_app/test/some/particular/file_test.exs

# ## Understanding test results

# When you run your test suite, it prints results as they run with a summary at
# the end, as seen below:

#     $ mix test
#     ...

#       1) test greets the world (FooTest)
#          test/foo_test.exs:5
#          Assertion with == failed
#          code:  assert Foo.hello() == :world!
#          left:  :world
#          right: :world!
#          stacktrace:
#            test/foo_test.exs:6: (test)

#     ........

#     Finished in 0.05 seconds (0.00s async, 0.05s sync)
#     1 doctest, 11 tests, 1 failure

#     Randomized with seed 646219

# For each test, the test suite will print a dot. Failed tests are printed
# immediately in the format described in the next section.

# After all tests run, we print the suite summary. The first line contains the
# total time spent on the suite, followed by how much time was spent on async
# tests (defined with use ExUnit.Case, async: true) vs sync ones:

#     Finished in 0.05 seconds (0.00s async, 0.05s sync)

# Developers want to minimize the time spent on sync tests whenever possible, as
# sync tests run serially and async tests run concurrently.

# Finally, how many tests we have run, how many of them failed, how many were
# invalid, and so on.

# ### Understanding test failures

# First, it contains the failure counter, followed by the test name and the
# module the test was defined:

#     1) test greets the world (FooTest)

# The next line contains the exact location of the test in the FILE:LINE format:

#     test/foo_test.exs:5

# If you want to re-run only this test, all you need to do is to copy the line
# above and paste it in front of mix test:

#     $ mix test test/foo_test.exs:5

# Then we show the error message, code snippet, and general information about the
# failed test:

#     Assertion with == failed
#     code:  assert Foo.hello() == :world!
#     left:  :world
#     right: :world!

# If your terminal supports coloring (see the  "Coloring" section below), a diff
# is typically shown between left and right sides. Finally, we print the
# stacktrace of the failure:

#     stacktrace:
#       test/foo_test.exs:6: (test)

# ## Command line options

#   • --all-warnings (--no-all-warnings) - prints all warnings, including
#     previous compilations (default is true except on errors)
#   • --color - enables color in the output
#   • --cover - runs coverage tool. See "Coverage" section below
#   • --exclude - excludes tests that match the filter
#   • --exit-status - use an alternate exit status to use when the test suite
#     fails (default is 2).
#   • --export-coverage - the name of the file to export coverage results to.
#     Only has an effect when used with --cover
#   • --failed - runs only tests that failed the last time they ran
#   • --force - forces compilation regardless of modification times
#   • --formatter - sets the formatter module that will print the results.
#     Defaults to ExUnit's built-in CLI formatter
#   • --include - includes tests that match the filter
#   • --listen-on-stdin - runs tests, and then listens on stdin. It will
#     re-run tests once a newline is received. See the "File system watchers"
#     section below
#   • --max-cases - sets the maximum number of tests running asynchronously.
#     Only tests from different modules run in parallel. Defaults to twice the
#     number of cores
#   • --max-failures - the suite stops evaluating tests when this number of
#     test failures is reached. It runs all tests if omitted
#   • --no-archives-check - does not check archives
#   • --no-color - disables color in the output
#   • --no-compile - does not compile, even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-elixir-version-check - does not check the Elixir version from
#     mix.exs
#   • --no-start - does not start applications after compilation
#   • --only - runs only tests that match the filter
#   • --partitions - sets the amount of partitions to split tests in. It must
#     be a number greater than zero. If set to one, it acts a no-op. If more than
#     one, then you must also set the MIX_TEST_PARTITION environment variable
#     with the partition to use in the current test run. See the "Operating
#     system process partitioning" section for more information
#   • --preload-modules - preloads all modules defined in applications
#   • --profile-require time - profiles the time spent to require test files.
#     Used only for debugging. The test suite does not run.
#   • --raise - raises if the test suite failed
#   • --seed - seeds the random number generator used to randomize the order
#     of tests; --seed 0 disables randomization so the tests in a single file
#     will always be ran in the same order they were defined in
#   • --slowest - prints timing information for the N slowest tests.
#     Automatically sets --trace and --preload-modules
#   • --stale - runs only tests which reference modules that changed since
#     the last time tests were ran with --stale. You can read more about this
#     option in the "The --stale option" section below
#   • --timeout - sets the timeout for the tests
#   • --trace - runs tests with detailed reporting. Automatically sets
#     --max-cases to 1. Note that in trace mode test timeouts will be ignored as
#     timeout is set to :infinity
#   • --warnings-as-errors - (since v1.12.0) treats warnings as errors and
#     returns a non-zero exit status. This option only applies to test files. To
#     treat warnings as errors during compilation and during tests, run:
#         MIX_ENV=test mix do compile --warnings-as-errors + test --warnings-as-errors


# ## Configuration

# These configurations can be set in the def project section of your mix.exs:

#   • :test_coverage - a set of options to be passed down to the coverage
#     mechanism. See the "Coverage" section for more information
#   • :test_elixirc_options - the compiler options to used when
#     loading/compiling test files. By default it disables the debug chunk and
#     docs chunk
#   • :test_paths - list of paths containing test files. Defaults to ["test"]
#     if the test directory exists; otherwise, it defaults to []. It is expected
#     that all test paths contain a test_helper.exs file
#   • :test_pattern - a pattern to load test files. Defaults to *_test.exs
#   • :warn_test_pattern - a pattern to match potentially misnamed test files
#     and display a warning. Defaults to *_test.ex

# ## Coloring

# Coloring is enabled by default on most Unix terminals. They are also available
# on Windows consoles from Windows 10, although it must be explicitly enabled for
# the current user in the registry by running the following command:

#     $ reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1

# After running the command above, you must restart your current console.

# ## Filters

# ExUnit provides tags and filtering functionality that allow developers to
# select which tests to run. The most common functionality is to exclude some
# particular tests from running by default in your test helper file:

#     # Exclude all external tests from running
#     ExUnit.configure(exclude: [external: true])

# Then, whenever desired, those tests could be included in the run via the
# --include option:

#     $ mix test --include external:true

# The example above will run all tests that have the external option set to true.
# It is also possible to include all examples that have a given tag, regardless
# of its value:

#     $ mix test --include external

# Note that all tests are included by default, so unless they are excluded first
# (either in the test helper or via the --exclude option) the --include option
# has no effect.

# For this reason, Mix also provides an --only option that excludes all tests and
# includes only the given ones:

#     $ mix test --only external

# Which is similar to:

#     $ mix test --include external --exclude test

# It differs in that the test suite will fail if no tests are executed when the
# --only option is used.

# In case a single file is being tested, it is possible to pass one or more
# specific line numbers to run only those given tests:

#     $ mix test test/some/particular/file_test.exs:12

# Which is equivalent to:

#     $ mix test --exclude test --include line:12 test/some/particular/file_test.exs

# Or:

#     $ mix test test/some/particular/file_test.exs:12:24

# Which is equivalent to:

#     $ mix test --exclude test --include line:12 --include line:24 test/some/particular/file_test.exs

# If a given line starts a describe block, that line filter runs all tests in it.
# Otherwise, it runs the closest test on or before the given line number.

# ## Coverage

# Elixir provides built-in line-based test coverage via the --cover flag. The
# test coverages shows which lines of code and in which files were executed
# during the test run.

# ### Limitations

# Coverage in Elixir has the following limitations:

#   • Literals, such as atoms, strings, and numbers, are not traced by
#     coverage. For example, if a function simply returns :ok, the atom :ok
#     itself is never taken into account by coverage;
#   • Macros, such as the ones defined by defmacro/2 and defguard/2, and code
#     invoked only by macros are never considered as covered, unless they are
#     also invoked during the tests themselves. That's because macros are invoked
#     at compilation time, before the test coverage instrumentation begins;

# ### Configuration

# The :test_coverage configures the coverage tool and accepts the following
# options:

#   • :output - the output directory for cover results. Defaults to "cover".
#   • :tool - a module specifying the coverage tool to use.
#   • :summary - at the end of each coverage run, a summary of each module is
#     printed, with results in red or green depending on whether the percentage
#     is below or above a given threshold. The task will exit with status of 1 if
#     the total coverage is below the threshold. The :summary option allows you
#     to customize the summary generation and defaults to [threshold: 90], but it
#     may be set to false to disable such reports.
#   • :export - a filename to export results to instead of generating the
#     coverage result on the fly. The .coverdata extension is automatically added
#     to the given file. This option is automatically set via the
#     --export-coverage option or when using process partitioning. See mix
#     test.coverage to compile a report from multiple exports.
#   • :ignore_modules - modules to ignore from generating reports and in
#     summaries. It is a list of module names as atoms and regular expressions
#     that are matched against the module names.
#   • :local_only - by default coverage only tracks local calls, set this
#     option to false if you plan to run coverage across nodes.

# By default, a wrapper around OTP's cover is used as the default coverage tool.
# You can learn more about how it works in the docs for mix test.coverage. Your
# tool of choice can be given as follows:

#     def project() do
#       [
#         ...
#         test_coverage: [tool: CoverModule]
#         ...
#       ]
#     end

# CoverModule can be any module that exports start/2, receiving the compilation
# path and the test_coverage options as arguments. It must return either nil or
# an anonymous function of zero arity that will run after the test suite is done.

# ## Operating system process partitioning

# While ExUnit supports the ability to run tests concurrently within the same
# Elixir instance, it is not always possible to run all tests concurrently. For
# example, some tests may rely on global resources.

# For this reason, mix test supports partitioning the test files across different
# Elixir instances. This is done by setting the --partitions option to an
# integer, with the number of partitions, and setting the MIX_TEST_PARTITION
# environment variable to control which test partition that particular instance
# is running. This can also be useful if you want to distribute testing across
# multiple machines.

# For example, to split a test suite into 4 partitions and run them, you would
# use the following commands:

#     $ MIX_TEST_PARTITION=1 mix test --partitions 4
#     $ MIX_TEST_PARTITION=2 mix test --partitions 4
#     $ MIX_TEST_PARTITION=3 mix test --partitions 4
#     $ MIX_TEST_PARTITION=4 mix test --partitions 4

# The test files are sorted upfront in a round-robin fashion. Note the partition
# itself is given as an environment variable so it can be accessed in config
# files and test scripts. For example, it can be used to setup a different
# database instance per partition in config/test.exs.

# If partitioning is enabled and --cover is used, no cover reports are generated,
# as they only contain a subset of the coverage data. Instead, the coverage data
# is exported to files such as cover/MIX_TEST_PARTITION.coverdata. Once you have
# the results of all partitions inside cover/, you can run mix test.coverage to
# get the unified report.

# ## The --stale option

# The --stale command line option attempts to run only the test files which
# reference modules that have changed since the last time you ran this task with
# --stale.

# The first time this task is run with --stale, all tests are run and a manifest
# is generated. On subsequent runs, a test file is marked "stale" if any modules
# it references (and any modules those modules reference, recursively) were
# modified since the last run with --stale. A test file is also marked "stale" if
# it has been changed since the last run with --stale.

# The --stale option is extremely useful for software iteration, allowing you to
# run only the relevant tests as you perform changes to the codebase.

# ## File-system watchers

# You can integrate mix test with file system watchers through the command line
# via the --listen-on-stdin option. For example, you can use fswatch
# (https://github.com/emcrisostomo/fswatch) or similar to emit newlines whenever
# there is a change, which will cause your test suite to re-run:

#     $ fswatch lib test | mix test --listen-on-stdin

# This can be combined with the --stale option to re-run only the test files that
# have changed as well as the tests that have gone stale due to changes in lib.

# ## Aborting the suite

# It is possible to abort the test suite with Ctrl+\ , which sends a SIGQUIT
# signal to the Erlang VM. ExUnit will intercept this signal to show all tests
# that have been aborted and print the results collected so far.

# This can be useful in case the suite gets stuck and you don't want to wait
# until the timeout times passes (which defaults to 30 seconds).

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin


# make ARG="" test_coverage
test_coverage:
	mix test.coverage
# Build reports from exported test coverage.

# In this moduledoc, we will describe how the default test coverage works in
# Elixir and also explore how it is capable of exporting coverage results to
# group reports from multiple test runs.

# ## Line coverage

# Elixir uses Erlang's :cover (https://www.erlang.org/doc/man/cover.html) for its
# default test coverage. Erlang coverage is done by tracking executable lines of
# code. This implies blank lines, code comments, function signatures, and
# patterns are not necessarily executable and therefore won't be tracked in
# coverage reports. Code in macros are also often executed at compilation time,
# and therefore may not be covered. Similarly, Elixir AST literals, such as
# atoms, are not executable either.

# Let's see an example:

#     if some_condition? do
#       do_this()
#     else
#       do_that()
#     end

# In the example above, if your tests exercise both some_condition? == true and
# some_condition? == false, all branches will be covered, as they all have
# executable code. However, the following code

#     if some_condition? do
#       do_this()
#     else
#       :default
#     end

# won't ever mark the :default branch as covered, as there is no executable code
# in the else branch. Note, however, this issue does not happen on case or cond,
# as Elixir is able to mark the clause operator -> as executable in such corner
# cases:

#     case some_condition? do
#       true ->
#         do_this()

#       false ->
#         :default
#     end

# If the code above is tested with both conditions, you should see entries in
# both branches marked as covered.

# Finally, it is worth discussing that line coverage by itself has its own
# limitations. For example, take the following code:

#     do_this() || do_that()

# Line coverage is not capable of expressing that both do_this() and do_that()
# have been executed, since as soon as do_this() is executed, the whole line is
# covered. Other techniques, such as branch coverage, can help spot those cases,
# but they are not currently supported by the default coverage tool.

# Overall, code coverage can be a great tool for finding flaws in our code (such
# as functions that haven't been covered) but it can also lead teams into a false
# sense of security since 100% coverage never means all different executions
# flows have been asserted, even with the most advanced coverage techniques. It
# is up to you and your team to specify how much emphasis you want to place on
# it.

# ## Exporting coverage

# This task can be used when you need to group the coverage across multiple test
# runs. Let's see some examples.

# ### Example: aggregating partitioned runs

# If you partition your tests across multiple runs, you can unify the report as
# shown below:

#     $ MIX_TEST_PARTITION=1 mix test --partitions 2 --cover
#     $ MIX_TEST_PARTITION=2 mix test --partitions 2 --cover
#     $ mix test.coverage

# This works because the --partitions option automatically exports the coverage
# results.

# ### Example: aggregating coverage reports from all umbrella children

# If you run mix test.coverage inside an umbrella, it will automatically gather
# exported cover results from all umbrella children - as long as the coverage
# results have been exported, like this:

#     # from the umbrella root
#     $ mix test --cover --export-coverage default
#     $ mix test.coverage

# Of course, if you want to actually partition the tests, you can also do:

#     # from the umbrella root
#     $ MIX_TEST_PARTITION=1 mix test --partitions 2 --cover
#     $ MIX_TEST_PARTITION=2 mix test --partitions 2 --cover
#     $ mix test.coverage

# On the other hand, if you want partitioned tests but per-app reports, you can
# do:

#     # from the umbrella root
#     $ MIX_TEST_PARTITION=1 mix test --partitions 2 --cover
#     $ MIX_TEST_PARTITION=2 mix test --partitions 2 --cover
#     $ mix cmd mix test.coverage

# When running test.coverage from the umbrella root, it will use the
# :test_coverage configuration from the umbrella root.

# Finally, note the coverage itself is not measured across the projects
# themselves. For example, if project B depends on A, and if there is code in A
# that is only executed from project B, those lines will not be marked as
# covered, which is important, as those projects should be developed and tested
# in isolation.

# ### Other scenarios

# There may be other scenarios where you want to export coverage. For example,
# you may have broken your test suite into two, one for unit tests and another
# for integration tests. In such scenarios, you can explicitly use the
# --export-coverage command line option, or the :export option under
# :test_coverage in your mix.exs file.

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin

# make ARG="" xxx
xref:
	mix xref
# Prints cross reference information between modules.

# The xref task expects a mode as first argument:

#     $ mix xref MODE

# All available modes are discussed below.

# This task is automatically re-enabled, so you can print information multiple
# times in the same Mix invocation.

# ## mix xref callers MODULE

# Prints all callers of the given module. Example:

#     $ mix xref callers MyMod

# ## mix xref trace FILE

# Compiles the given file listing all dependencies within the same app. It
# includes the type and line for each one. Example:

#     $ mix xref trace lib/my_app/router.ex

# The --label option may be given to keep only certain traces (compile, runtime
# or export):

#     $ mix xref trace lib/my_app/router.ex --label compile

# If you have an umbrella application, we also recommend using the
# --include-siblings flag to see the dependencies from sibling applications. The
# trace command is not currently supported at the umbrella root.

# ### Example

# Imagine the given file lib/b.ex:

#     defmodule B do
#       import A
#       A.macro()
#       macro()
#       A.fun()
#       fun()
#       def calls_macro, do: A.macro()
#       def calls_fun, do: A.fun()
#       def calls_struct, do: %A{}
#     end

# mix xref trace will print:

#     lib/b.ex:2: require A (export)
#     lib/b.ex:3: call A.macro/0 (compile)
#     lib/b.ex:4: import A.macro/0 (compile)
#     lib/b.ex:5: call A.fun/0 (compile)
#     lib/b.ex:6: call A.fun/0 (compile)
#     lib/b.ex:6: import A.fun/0 (compile)
#     lib/b.ex:7: call A.macro/0 (compile)
#     lib/b.ex:8: call A.fun/0 (runtime)
#     lib/b.ex:9: struct A (export)

# ## mix xref graph

# Prints a file dependency graph where an edge from A to B indicates that A
# (source) depends on B (sink).

#     $ mix xref graph --format stats

# The following options are accepted:

#   • --exclude - path to exclude. Can be repeated to exclude multiple paths.
#   • --label - only shows relationships with the given label. The labels are
#     "compile", "export" and "runtime". By default, the --label option simply
#     filters the printed graph to show only relationships with the given label.
#     You can pass --only-direct to trim the graph to only the nodes that have
#     the direct relationship given by label. There is also a special label
#     called "compile-connected" that keeps only compile-time files with at least
#     one transitive dependency. See "Dependency types" section below.
#   • --group - provide comma-separated paths to consider as a group.
#     Dependencies from and into multiple files of the group are considered a
#     single dependency. Dependencies between the group elements are ignored.
#     This is useful when you are computing compile and compile-connected
#     dependencies and you want a series of files to be treated as one. The group
#     is printed using the first path, with a + suffix. Can be repeated to create
#     multiple groups.
#   • --only-direct - keeps only files with the direct relationship given by
#     --label
#   • --only-nodes - only shows the node names (no edges). Generally useful
#     with the --sink flag
#   • --source - displays all files that the given source file references
#     (directly or indirectly). Can be repeated to display references from
#     multiple sources.
#   • --sink - displays all files that reference the given file (directly or
#     indirectly). Can be repeated.
#   • --min-cycle-size - controls the minimum cycle size on formats like
#     stats and cycles
#   • --format - can be set to one of:
#     • pretty - prints the graph to the terminal using Unicode characters.
#       Each prints each file followed by the files it depends on. This is the
#       default except on Windows;

#     • plain - the same as pretty except ASCII characters are used instead
#       of Unicode characters. This is the default on Windows;

#     • stats - prints general statistics about the graph;

#     • cycles - prints all cycles in the graph;

#     • dot - produces a DOT graph description in xref_graph.dot in the
#       current directory. Warning: this will override any previously generated
#       file

#   • --output (since v1.15.0) - can be set to one of
#     • - - prints the output to standard output;

#     • a path - writes the output graph to the given path

#     Defaults to xref_graph.dot in the current directory.


# The --source and --sink options are particularly useful when trying to
# understand how the modules in a particular file interact with the whole system.
# You can combine those options with --label and --only-nodes to get all files
# that exhibit a certain property, for example:

#     # To show all compile-time relationships
#     $ mix xref graph --label compile

#     # To get the tree that depend on lib/foo.ex at compile time
#     $ mix xref graph --label compile --sink lib/foo.ex

#     # To get all files that depend on lib/foo.ex at compile time
#     $ mix xref graph --label compile --sink lib/foo.ex --only-nodes

#     # To get all paths between two files
#     $ mix xref graph --source lib/foo.ex --sink lib/bar.ex

#     # To show general statistics about the graph
#     $ mix xref graph --format stats

# ### Understanding the printed graph

# When mix xref graph runs, it will print a tree of the following format. Imagine
# the following code:

#     # lib/a.ex
#     defmodule A do
#       IO.puts B.hello()
#     end

#     # lib/b.ex
#     defmodule B do
#       def hello, do: C.world()
#     end

#     # lib/c.ex
#     defmodule C do
#       def world, do: "hello world"
#     end

# It will print:

#     $ mix xref graph
#     lib/a.ex
#     └── lib/b.ex (compile)
#     lib/b.ex
#     └── lib/c.ex
#     lib/c.ex

# This tree means that lib/a.ex depends on lib/b.ex at compile time. And lib/b.ex
# depends on lib/c.ex at runtime. This is often problematic because if lib/c.ex
# changes, lib/a.ex also has to recompile due to this indirect compile time
# dependency. When you pass --label compile, the graph shows only the
# compile-time dependencies:

#     $ mix xref graph --label compile
#     lib/a.ex
#     └── lib/b.ex (compile)

# The --label compile flag removes all non-compile dependencies. However, this
# can be misleading because having direct compile time dependencies is not
# necessarily an issue. The biggest concern, as mentioned above, are the
# transitive compile time dependencies. You can get all compile time dependencies
# that cause transitive compile time dependencies by using --label
# compile-connected:

#     $ mix xref graph --label compile-connected
#     lib/a.ex
#     └── lib/b.ex (compile)

# The above says lib/a.ex depends on lib/b.ex and that causes transitive compile
# time dependencies - as we know, lib/a.ex also depends on lib/c.ex. We can
# retrieve those transitive dependencies by passing lib/b.ex as --source to mix
# xref graph:

#     $ mix xref graph --source lib/b.ex
#     lib/b.ex
#     └── lib/c.ex

# Similarly, you can use the --label compile and the --sink flag to find all
# compile time dependencies that will recompile once the sink changes:

#     $ mix xref graph --label compile --sink lib/c.ex
#     lib/a.ex
#     └── lib/b.ex (compile)

# If you have an umbrella application, we also recommend using the
# --include-siblings flag to see the dependencies from sibling applications. When
# invoked at the umbrella root, the graph command will list all files from all
# umbrella children, without any namespacing.

# ### Dependency types

# Elixir tracks three types of dependencies between modules: compile, exports,
# and runtime. If a module has a compile time dependency on another module, the
# caller module has to be recompiled whenever the callee changes. Compile-time
# dependencies are typically added when using macros or when invoking functions
# in the module body (outside of functions). You can list all dependencies in a
# file by running mix xref trace path/to/file.ex.

# Export dependencies are compile time dependencies on the module API, namely
# structs and its public definitions. For example, if you import a module but
# only use its functions, it is an export dependency. If you use a struct, it is
# an export dependency too. Export dependencies are only recompiled if the module
# API changes. Note, however, that compile time dependencies have higher
# precedence than exports. Therefore if you import a module and use its macros,
# it is a compile time dependency.

# Runtime dependencies are added whenever you invoke another module inside a
# function. Modules with runtime dependencies do not have to be compiled when the
# callee changes, unless there is a transitive compile or an outdated export time
# dependency between them. The option --label compile-connected can be used to
# find the first case.

# ## Shared options

# Those options are shared across all modes:

#   • --fail-above - generates a failure if the relevant metric is above the
#     given threshold. Applies to all modes except mix xref graph --format stats.
#   • --include-siblings - includes dependencies that have :in_umbrella set
#     to true in the current project in the reports. This can be used to find
#     callers or to analyze graphs between projects (it applies only to trace
#     subcommand)
#   • --no-compile - does not compile even if files require compilation
#   • --no-deps-check - does not check dependencies
#   • --no-archives-check - does not check archives
#   • --no-elixir-version-check - does not check the Elixir version from
#     mix.exs

# Location: /usr/local/Cellar/elixir/1.16.2/lib/mix/ebin

