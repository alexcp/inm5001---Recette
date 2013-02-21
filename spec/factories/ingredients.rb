# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    nom "MyString"
    categorie "MyString"
    portion "MyString"
    mesure "MyString"
    prix "9.99"
    proteine 1
    glucide 1
    fat 1
  end
end
