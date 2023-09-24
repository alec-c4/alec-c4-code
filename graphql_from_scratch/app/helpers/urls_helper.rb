module UrlsHelper
  ### We will use those helper methods to send requests to frontend

  def confirmation_url(token) = "http://localhost:3000/users/confirm/#{token}"

  def confirmation_path(token) = "/users/confirm/#{token}"

  def edit_password_url(token) = "http://localhost:3000/users/passwords/#{token}"

  def edit_password_path(token) = "/users/passwords/#{token}"
end
