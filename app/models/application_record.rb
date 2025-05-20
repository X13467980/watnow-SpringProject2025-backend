class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

#ARはDBの操作をするための枠組み