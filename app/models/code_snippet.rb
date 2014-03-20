class CodeSnippet < ActiveRecord::Base
  has_one :content, as: :attatchable,  dependent: :destroy
end
