class CodeSnippet < ActiveRecord::Base
  has_one :content, as: :attachable,  dependent: :destroy
end
