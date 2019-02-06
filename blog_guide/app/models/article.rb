class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,length: {minimum: 5}
end

# ある記事を削除したら、その記事に関連付けられているコメントも
# 一緒に削除する必要があります。そうしないと、
# コメントがいつまでもデータベース上に残ってしまいます。
# Railsでは関連付けにdependentオプションを指定することで
# これを実現しています。
