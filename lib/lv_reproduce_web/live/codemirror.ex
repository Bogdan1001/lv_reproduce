defmodule LvReproduceWeb.CodemirrorLive do
  use LvReproduceWeb, :live_view


  @impl true
  def mount(_, _, socket) do
    {:ok, socket}
  end


  @impl true
  def render(assigns) do
    ~L"""

    <%= f = form_for LvReproduce.Schema.changeset(%{}), "#",
            phx_change: "change"%>
    <div id="code_hook" phx-hook="code_mirror" phx-update="ignore" >
    <%= textarea f, :code_mirror, placeholder: "Copy", id: "cm_textarea" %>

    """
  end

  def handle_event("change", params, socket) do
    IO.inspect params
    {:noreply, socket}
  end

end
