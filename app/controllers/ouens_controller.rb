class OuensController < ApplicationController
  before_filter :require_login

  # "応援！"
  def good
    if request.post? && params[:content_type] && params[:content_id]
      if Ouen.plus_good(User.current, params[:content_type], params[:content_id])
        flash[:notice] = I18n.t('flash_ouen_ok', ouen_kind: I18n.t('field_ouen_good'))
      else
        flash[:warning] = I18n.t('flash_ouen_ng', ouen_kind: I18n.t('field_ouen_good'))
      end
    end

    # 前のページに戻る
    redirect_to back_url
  end

  # "頑張れ"
  def more
    if request.post? && params[:content_type] && params[:content_id]
      if Ouen.plus_more(User.current, params[:content_type], params[:content_id])
        flash[:notice] = I18n.t('flash_ouen_ok', ouen_kind: I18n.t('field_ouen_more'))
      else
        flash[:warning] = I18n.t('flash_ouen_ng', ouen_kind: I18n.t('field_ouen_more'))
      end
    end

    # 前のページに戻る
    redirect_to back_url
  end
end
