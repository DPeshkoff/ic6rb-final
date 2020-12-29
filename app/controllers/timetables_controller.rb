class TimetablesController < ApplicationController
    before_action :require_admin, only: [:add, :new, :show_all]
    skip_before_action :require_login, only: [:find, :save]

    def add; end


    def new
        group = params[:group]

        rewrite = params[:re]

        if rewrite == t(:re_yes)
            @old_table = Timetable.find_by(group: group)
            @old_table.destroy
        else
            if Timetable.find_by(group: group)
                @error = t:timetable_already_exists_err
                render :add
                return
            end
        end 

        monday = [params[:pn_ch_1], params[:pn_ch_2], params[:pn_ch_3], params[:pn_ch_4], params[:pn_ch_5], params[:pn_ch_6], params[:pn_ch_7], params[:pn_zn_1], params[:pn_zn_2], params[:pn_zn_3], params[:pn_zn_4], params[:pn_zn_5], params[:pn_zn_6], params[:pn_zn_7]]
        tuesday = [params[:vt_ch_1], params[:vt_ch_2], params[:vt_ch_3], params[:vt_ch_4], params[:vt_ch_5], params[:vt_ch_6], params[:vt_ch_7], params[:vt_zn_1], params[:vt_zn_2], params[:vt_zn_3], params[:vt_zn_4], params[:vt_zn_5], params[:vt_zn_6], params[:vt_zn_7]]
        wednesday = [params[:we_ch_1], params[:we_ch_2], params[:we_ch_3], params[:we_ch_4], params[:we_ch_5], params[:we_ch_6], params[:we_ch_7], params[:we_zn_1], params[:we_zn_2], params[:we_zn_3], params[:we_zn_4], params[:we_zn_5], params[:we_zn_6], params[:we_zn_7]]
        thursday = [params[:ch_ch_1], params[:ch_ch_2], params[:ch_ch_3], params[:ch_ch_4], params[:ch_ch_5], params[:ch_ch_6], params[:ch_ch_7], params[:ch_zn_1], params[:ch_zn_2], params[:ch_zn_3], params[:ch_zn_4], params[:ch_zn_5], params[:ch_zn_6], params[:ch_zn_7]]
        friday = [params[:pt_ch_1], params[:pt_ch_2], params[:pt_ch_3], params[:pt_ch_4], params[:pt_ch_5], params[:pt_ch_6], params[:pt_ch_7], params[:pt_zn_1], params[:pt_zn_2], params[:pt_zn_3], params[:pt_zn_4], params[:pt_zn_5], params[:pt_zn_6], params[:pt_zn_7]]
        saturday = [params[:su_ch_1], params[:su_ch_2], params[:su_ch_3], params[:su_ch_4], params[:su_ch_5], params[:su_ch_6], params[:su_ch_7], params[:su_zn_1], params[:su_zn_2], params[:su_zn_3], params[:su_zn_4], params[:su_zn_5], params[:su_zn_6], params[:su_zn_7]]

        timetable_c = Timetable.new(group: group, monday: monday, tuesday: tuesday, wednesday: wednesday, thursday: thursday, friday: friday, saturday: saturday)
        unless timetable_c.save
            @error = t:timetable_not_saved_err
            render :add
            return
        end

        redirect_to "/"
    end

end
