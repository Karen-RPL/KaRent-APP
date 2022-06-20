class Car < ApplicationRecord
  enum petrol: {pertalite: "pertalite", "pertamax": "pertamax", "diesel": "diesel"}, _default: "pertalite"
  enum transmission: {matic: "matic", "manual": "manual"}, _default: "manual"
  belongs_to :company
end
