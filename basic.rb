require 'anemone'

Anemone.crawl('http://example.com/start_page.html') do |anemone|

  # クロールするごとに呼び出される
  anemone.focus_crawl do |page|

    # 条件に一致するリンクだけ残す
    # この `links` はanemoneが次にクロールする候補リスト
    page.links.keep_if { |link|
      link.to_s.match(/detail/)
    }

  end

  # ここがメインの部分
  anemone.on_every_page do |page|

    # クロールした結果をごにょごにょ
    p page.doc.at('title').inner_html

  end
end
