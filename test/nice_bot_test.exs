defmodule NiceBotTest do
  use ExUnit.Case
  doctest NiceBot

  test "greets the world" do
    assert NiceBot.hello() == :world
  end
end
