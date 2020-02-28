defmodule MatchMenu.Guardian do
  use Guardian, otp_app: :match_menu

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    resource = MatchMenu.Accounts.get_user!(claims["sub"])
    {:ok,  resource}
  end
end
