#
# event_info: イベント検索情報
#
#
part 'event_info', 'イベント検索情報' do
    description 'イベントカレンダー・イベント検索項目を設定します。'
    label 'イベント検索情報'

    multiple 'category', 'カテゴリ' do
        description ''
        required true
        options [
            [ '010', '催し・イベント' ],
            [ '020', '子ども・子育て' ],
            [ '030', 'スポーツ' ],
            [ '040', '健康・福祉' ],
            [ '050', '趣味・教養' ],
            [ '060', '講座・教室' ],
            [ '070', '文化・芸術' ],
            [ '080', 'しごと・産業' ],
            [ '090', '体験・学習' ],
            [ '100', '会議・説明会' ],
            [ '110', '相談' ],
        ]
    end

    asset 'image', 'イベント画像' do
      description '画像の推奨サイズは、横260px × 高さ150pxです。イベントカレンダーに掲載する用の画像です。プレビュー画面には表示されません。'
      required false
      suffix ['gif','jpg','jpeg','png','GIF','JPG','JPEG','PNG']
    end

    string 'alt', '　　┗　代替テキスト' do
      required false
    end

    select 'facilities', '施設' do
        description '検索項目です。プレビュー画面には表示されません。'
        required false
        options [
            [ '', '（未設定）' ],
            
            [ '010', '富弘美術館' ],
            [ '020', '岩宿博物館' ],
            [ '030', 'コノドント館' ],
            [ '040', 'ながめ余興場' ],
            [ '050', 'グンエイホールPAL' ],
            [ '060', '笠懸公民館' ],
            [ '070', '多世代交流館' ],
            [ '080', '東公民館' ],
            [ '090', '笠懸図書館' ],
            [ '100', '大間々図書館' ],
            [ '110', '童謡ふるさと館' ],
            [ '120', '旧花輪小学校記念館' ],
            [ '130', '大間々保健センター' ],
            [ '140', '桐生大学グリーンアリーナ' ],
            [ '150', 'その他' ],
        ]
    end

    text 'event_place', '開催場所' do
        required false
    end
    
    page 'place_page', '　┗　内部リンク' do
        required false
    end

    select 'area', 'エリア' do
        description ''
        required false
        options [
            [ '', '（未設定）' ],

            [ '10', '全市' ],
            [ '20', '笠懸' ],
            [ '30', '大間々' ],
            [ '40', '東' ],
            [ '50', 'その他' ],
        ]
    end
    
    multiple 'target', '対象' do
        description ''
        required false
        options [
            [ '10', 'どなたでも' ],
            [ '20', '親子' ],
            [ '30', '小・中学生' ],
            [ '40', '大人' ],
            [ '50', 'シニア' ],
            [ '60', '子育て・妊娠中' ],
        ]
    end

    text 'target_detail', '　┗　対象詳細' do
        required false
    end
    
    html 'explanation', '内容' do
        required false
    end

    date 'limit_date', '申込み締め切り日' do
        required false
    end

    multiple 'limit_display', '　　┗　手動表示' do
        required false
        options [
            [ '1', '申込み終了' ],
        ]
    end

    select 'limit', '申込み' do
        required false
        options [
            [ '', '（未設定）' ],
            [ '1', '必要' ],
            [ '2', '一部必要' ],
            [ '3', '不要' ],
        ]
    end

    html 'limit_detail', '　　┗　申込み詳細' do
        required false
    end

#    multiple 'ud', 'ユニバーサルデザイン' do
#        description ''
#        required false
#        options [
#            [ '1', '手話通訳' ],
#            [ '2', '託児' ],
#            [ '3', '要約筆記' ],
#        ]
#    end
#
#    select 'expense', '費用' do
#        required false
#        options [
#            [ '', '（未設定）' ],
#            [ '1', '必要' ],
#            [ '2', '不要' ],
#        ]
#    end
#
#    html 'expense_detail', '　　┗　費用詳細' do
#        required false
#    end

    
    #--- チェック実行
    rule 'event_info_check_required'

    #--- チェック定義
    define_rule 'event_info_check_required' do
      if !@part['image'].value.blank? && @part['alt'].value.blank?
        @part['alt'].add_error(:error , "#{@part['image'].label} を入力した場合は #{@part['alt'].label} の入力も必要です。")
      end
    end
end