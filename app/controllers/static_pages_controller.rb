class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top terms_of_service privacy_policy]

  def top; end
  def privacy_policy; end
  def terms_of_service; end
end
