require 'csv'

class Product < ApplicationRecord

  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation
  # validates :product_index, uniqueness: true
  belongs_to :item, optional: true
  has_many :orders, through: :items
  has_many :clients, through: :orders


  scope :id, -> (id) { where id: id }
  scope :range_min, -> (range_min) { where('qty >= ?', range_min) }
  scope :range_max, -> (range_max) { where('qty <= ?', range_max) }
  # scope :name_id, -> (name_id) { where('lower(name) LIKE ? OR lower(content) LIKE ?', "%#{name_id}%", "%#{name_id}%")}
  scope :content, -> (content) { where('lower(name) LIKE ? OR lower(content) LIKE ? OR lower(product_index) LIKE ? OR lower(buy_number) LIKE ? OR lower(structure) LIKE ? OR lower(color) LIKE ? OR length = ?', "%#{content.downcase}%", "%#{content.downcase}%", "%#{content.downcase}%", "%#{content.downcase}%", "%#{content.downcase}%", "%#{content.downcase}%", content.to_f )}

  enum product_kind: [:włosy, :kosmetyki, :akcesoria, :urządzenia, :inne]

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product = row.to_hash
      product_update = Product.where(id: product["id"])

      if product_update.count == 1
        product_update.first.update_attributes(product)
      else
        create!(product)
      end
    end
  end

  private
  def image_size_validation
    errors[:image] << "Maksymalny rozmiar zdjęcia to 500kb" if image.size > 0.5.megabytes
  end
end
