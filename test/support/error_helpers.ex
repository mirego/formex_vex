defmodule Formex.Validator.Vex.TestErrorHelpers do
  @moduledoc """
  Conveniences for translating and building error messages.
  """

  # use PhoenixHTMLHelpers

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, _opts}) do
    msg
  end
end
