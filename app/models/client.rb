class Client < ApplicationRecord

  # validates :nip_number, uniqueness: true
  has_many :orders
  has_many :items, through: :orders
  has_many :products, through: :items


  # scope :id, -> (id) { where id: id }
  scope :client_name, -> (client_name) { where('lower(client_name) LIKE ?', "%#{client_name.downcase}%") }
  scope :address_city, -> (address_city) { where('lower(address_street) LIKE ? OR lower(address_city) LIKE ? OR address_citycode LIKE ?', "%#{address_city.downcase}%", "%#{address_city.downcase}%", "%#{address_city}%") }
  scope :phone_number, -> (phone_number) { where phone_number: phone_number }
  scope :company_name, -> (company_name) { where('lower(company_name) LIKE ?', "%#{company_name.downcase}%") }
  scope :nip_number, -> (nip_number) { where nip_number: nip_number }


end
