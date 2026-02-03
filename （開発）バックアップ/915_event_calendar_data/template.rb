template '915_event_calendar_data', 'イベントデータ' do
  group_name 'システム'
  description 'イベントカレンダー用のデータを出力します。'

  #1:false：未登録、2:true：制限なし、3:master：管理者・プロジェクトマスタのみ、5:none：アクセス不可、6:other：グループ指定
  regist_flg 3
  #1:（欠番）、2:sample：サンプルテンプレート、3:user：ユーザーテンプレート
  kind 3
  #0：共用、1：リーフとして使用、2：リストとして使用
  usage 1
  suffix "js"

end
