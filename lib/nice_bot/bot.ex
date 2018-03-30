defmodule NiceBot.Bot do
  @bot_name :nice_bot
  def bot(), do: @bot_name

  use Telex.Bot, name: @bot_name
  use Telex.Dsl

  def handle({:command, "start", msg}, _name, _extra) do
    answer("Hi! I'm a nice bot :D")
  end
end
