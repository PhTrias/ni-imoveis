module WhatsappMessaging
  extend ActiveSupport::Concern

  def propertie_interest_messaging
    "Olá, Somos da Ni-imóveis! Vimos que você teve interesse em alugar o imóvel com o endreço: #{@propertie.address}. Como posso te ajudar?"
  end

  def interest_messaging
    "Olá, Somos da Ni-imóveis! Vimos que você teve interesse em alugar um imóvel! Como posso te ajudar?"
  end
end
