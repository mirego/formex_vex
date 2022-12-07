defmodule Formex.Validator.Vex do
  @behaviour Formex.Validator
  alias Formex.Form

  @spec validate(Form.t()) :: Form.t()
  def validate(form) do
    errors_type =
      form
      |> Form.get_fields_validatable()
      |> Enum.map(fn item ->
        if item.validation do
          errors =
            form.new_struct
            |> Map.from_struct()
            |> Vex.errors([{item.struct_name, item.validation}])
            |> Enum.map(fn error ->
              message = elem(error, 3)
              {message, []}
            end)

          {item.name, errors}
        else
          {item.name, []}
        end
      end)

    errors = errors_type

    form
    |> Map.put(:errors, errors)
  end
end
