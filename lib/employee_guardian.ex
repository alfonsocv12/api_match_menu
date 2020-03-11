defmodule MatchMenu.EmployeeGuardian do
  use Guardian, otp_app: :match_menu

  def subject_for_token(restaurant, _claims) do
    {:ok, to_string(restaurant.id)}
  end

  def resource_from_claims(claims) do
    resource = MatchMenu.Accounts.get_restaurant!(claims["sub"])
    {:ok,  resource}
  end
end
