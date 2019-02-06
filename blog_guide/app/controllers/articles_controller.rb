class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
    # Railsではコントローラのインスタンス変数はすべて
    # ビューに渡されるようになっているからです
    # (訳注: Railsはそのために背後でインスタンス変数をコントローラから
    #   ビューに絶え間なくコピーし続けています)。
  end

  def new
    @article = Article.new
    # @article.errors.any?を呼び出すところでエラーになってしまうためです。
    # エラーメッセージを含むフィールドは自動的にfield_with_errorsクラスを持つdivタグで囲まれます
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end


    # render plain: params[:article].inspect
  end
  # コントローラで渡されるパラメータはホワイトリストでチェックし、
  # 不正なマスアサインメントを防止する必要があるのです。
  # この場合、createでパラメータを安全に使用するために、
  # titleとtextパラメータの利用を「許可」し、かつ「必須」であることを
  # 指定したいのです。この指定を文法化するために、
  # requireメソッドとpermitメソッドが導入されました。
  # これに基いて、該当行を以下のように変更します。

  private
    def article_params
      params.require(:article).permit(:title,:text)
    end
end
