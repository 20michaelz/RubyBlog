class Comment < ApplicationRecord
  include Visible
  elongs_to :article
end
