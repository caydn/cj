class Contact < MailForm::Base
  attribute :firstname,    :validate => true
  attribute :lastname,    :validate => true
  attribute :email,        :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,      :validate => true
  attribute :nickname,     :captcha => true

  def headers
    {
      :subject => "Contact Form",
      :to => "cj@caydenjacobs.com",
      :from => %("#{lastname,firstname}" <#{email}>)
    }
  end
end
