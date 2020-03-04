defmodule MatchMenu.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :match_menu,
  module: MatchMenu.Guardian,
  error_handler: MatchMenu.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
