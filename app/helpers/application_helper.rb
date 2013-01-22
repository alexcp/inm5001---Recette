module ApplicationHelper
  def sign_in_with provider
    link_to "Sign In With your #{provider.titleize} account", "/auth/#{provider}", :class => "btn"
  end

  def sign_in_buttons
    content_tag :div do
      %w{facebook twitter openid}.map {|provider| concat content_tag :p ,sign_in_with(provider) }
    end
  end
end
