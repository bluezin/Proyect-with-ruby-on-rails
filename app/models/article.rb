class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user
    has_many :has_categories
    has_many :categories, through: :has_categories
    attr_accessor :category_elements

    def save_categories
#category_elements1,2,3

#convertir eso en un arreglo 1,2,3
#categories_array= category_elements.split(",")
#iterar ese arreglo
return has_categories.destroy_all if category_elements.nil? || category_elements.empty?
  has_categories.where.not(category_id: category_elements).destroy_all
    category_elements.each do |category_id|
#crear HasCategory<article_id:1, categort_id>
HasCategory.find_or_create_by(article: self, category_id: category_id)
end


end



end

#modifica los datos de la base de datos
#rails db:migrate en consola cuando quieres una base de datos