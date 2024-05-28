defmodule Feniks.Application do

  use Application

  @impl true
  def start(_type, _args) do
    Supervisor.start_link(
      _children = [
        # Telemtry 
        # Ecto.Repo
        # DnsCluster
        # Phoenix.PubSub
        # finch
        # Endpoint
        
        # TODO: Place all of the above in Feniks.Supervisor
        
        Feniks.Supervisor
        
      ],
      _opts = [
        strategy: :one_for_one,
        name: Feniks.SupervisorSupervisor
      ]
    )
  end
  
#    # Tell Phoenix to update the endpoint configuration
#  # whenever the application is updated.
#  @impl true
#  def config_change(changed, _new, removed) do
#    BlankWeb.Endpoint.config_change(changed, removed)
#    :ok
#  end

end
