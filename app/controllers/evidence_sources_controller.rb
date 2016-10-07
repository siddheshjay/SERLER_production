class EvidenceSourcesController < ApplicationController
    def index
        published
    end
    
    def my_submissions
        # every user
        @evidence_sources = EvidenceSource.where 'submitter_id=?', current_user.id
    end
    
    def new_submitted
        # moderator and administrator
        @evidence_sources = EvidenceSource.where 'status=?', 'NEW'
    end
    
    def rejected
        # admistrator ? maybe
        @evidence_sources = EvidenceSource.where 'status=?', 'REJECTED'
    end
    
    def accepted
        # analystv and administrator
        @evidence_sources = EvidenceSource.where 'status=?', 'ACCEPTED'
    end
    
    def published
        # every one
        @evidence_sources = EvidenceSource.where 'status=?', 'PUBLISHED'
    end
    
    def all
        @evidence_sources = EvidenceSource.all
    end

    def update
        # TODO
        puts 'this is update  # TODO'
        puts params
        puts params.require(:status)
        
        esid = params.require(:id)
        status = params.require(:status)
        
        evidence_source = EvidenceSource.find(esid)
        evidence_source[:status] = status
        evidence_source.save()
        
        puts evidence_source.id
        puts evidence_source.status
    end

    ##################################################
    
    def new
    end
    
    def create
        puts "========================================="
        puts "this is EvidenceSourcesController::create"

        page_str = params.require(:evidence_source)[:page]
        
        @evidence_source = EvidenceSource.new(evidence_source_params)
        @evidence_source.status = 'NEW'
        @evidence_source.page_str = page_str
        
        _user = current_user
        @evidence_source.submitter_id = _user.id
        
        unless page_str.nil?
            (b, c) = page_str.split('-')
            begin
                @evidence_source.page_begin = Integer(b)
                @evidence_source.page_cease = Integer(c)
            rescue
                puts "Exception while " + page_str
            ensure
            end
        end
        
        # puts '*************'
        # puts page_str
        # puts @evidence_source
        # puts '$$$$$$$$$$$$$$$$$$$$'
        # puts 'ID: ' + @evidence_source.id.to_s
        
        @evidence_source.save
        puts 'ID: ' + @evidence_source.id.to_s
        
        begin
            authors = params.require(:evidence_source)[:author]
            authors.each do |a|
                puts "==> " + a.to_s
                
                g = ''
                f = ''
                if a.include? ','
                    c = a.index ','
                    g = a[c+1..-1].strip
                    f = a[0..c-1].strip
                else
                    c = a.rindex ' '
                    g = a[0..c].strip
                    f = a[c..-1].strip
                end
                
                # puts '***** |' + a + '| ==> _' + g + '_' + f + '_'
                
                g_abbr = ''
                begin
                    g.split(' ').each do |s|
                        g_abbr += s.strip()[0] + '. '
                    end
                end
                
                name = g + ' ' + f
                name_abbr = g_abbr + f
                
                author = @evidence_source.evidence_source_authors.create({
                    name: name, name_abbr: name_abbr
                })
            end
        end

        redirect_to evidence_sources_my_submissions_url
    end
    
    def show
        puts "this is show"
        puts params[:id]
    end
    
    def edit
        @evidence_source = EvidenceSource.find(params[:id])
    end
    
    def research_design
        rd = params.require(:research_design)
        esid = rd['evidence_source_id']
        aim = rd['aim']
        methods = rd['method']
        participants = rd['participant']
        metrics = rd['metric']
        
        puts "###############################"
        puts esid
        puts aim
        puts methods
        puts participants
        puts metrics
        
        evidence_source = EvidenceSource.find(esid)
        if evidence_source.research_aim != aim
            evidence_source.research_aim = aim
            evidence_source.save()
        end
        
        puts ResearchDesign.all
        puts "********************************"
        
        begin
            rd_list = ResearchDesign.where(evidence_source_id: esid)
            
            # seems stupid!
            
            # old sets
            method_set_old = Set.new
            participant_set_old = Set.new
            metric_set_old = Set.new
            
            rd_list.each do |rd|
                puts rd.category
                if rd.category == 'METHOD'
                    method_set_old << rd.ref_id
                elsif rd.category == 'PARTICIPANT'
                    participant_set_old << rd.ref_id
                elsif rd.category == 'METRIC'
                    metric_set_old << rd.ref_text
                else
                end
            end
            
            # new sets
            method_set_new = Set.new
            participant_set_new = Set.new
            metric_set_new = Set.new metrics
            
            # puts method_set_old
            # method_set_old.each do |m|
            #     puts 'method=> ' + m.to_s
            # end
            # puts participant_set_old
            # puts metric_set_old
        
            new_rd_list = []
            if not methods.nil?
                methods.each do |m|
                    if not method_set_old.include? m.to_i
                        new_rd_list << {
                            evidence_source_id: esid,
                            category: :METHOD,
                            ref_id: m,
                            ref_text: methods[m],
                        }
                    else
                        method_set_new << m
                    end
                end
            end
            if not participants.nil?
                participants.each do |p|
                    if not participant_set_old.include? p.to_i
                        new_rd_list << {
                            evidence_source_id: esid,
                            category: :PARTICIPANT,
                            ref_id: p,
                            ref_text: participants[p],
                        }
                    else
                        participant_set_new << p
                    end
                end
            end
            if not metrics.nil?
                metrics.each do |m|
                    if (not m.empty?) and (not metric_set_old.include? m)
                        new_rd_list << {
                            evidence_source_id: esid,
                            category: :METRIC,
                            ref_text: m
                        }
                    else
                        metric_set_new << m
                    end
                end
            end
            
            # insert new reseach-designs
            puts 'new_rd_list'
            puts new_rd_list
            ResearchDesign.create(new_rd_list)
            
            method_set_new.each do |m|
                puts "new: " + m
            end
            
            # remove old reseach-designs
            rd_list.each do |rd|
                puts 'rd -> ' + rd.category.to_s + ' | ' + rd.ref_id.to_s
                if rd.category == 'METHOD'
                    if not method_set_new.include? rd.ref_id.to_s
                        puts "to delete " + rd.id.to_s
                        rd.delete
                    end
                elsif rd.category == 'PARTICIPANT'
                    if not participant_set_new.include? rd.ref_id.to_s
                        puts "to delete " + rd.id.to_s
                        rd.delete
                    end
                elsif rd.category == 'METRIC'
                    if not metric_set_new.include? rd.ref_text
                        rd.delete
                    end
                else
                end
            end
        end
        
        redirect_to edit_evidence_source_path esid
    end
    
    def evidence_item
        ei = params.require('evidence_item')
        puts ei
        esid = ei['esid']
        eiid = ei['eiid']
        benefit = ei['benefit']
        result = ei['result']
        ctx_where = ei['where']
        ctx_when = ei['when']
        ctx_how = ei['how']
        ctx_whom = ei['whom']
        ctx_what = ei['what']
        submit = ei['submit']
        draft = ei['draft']
        integrity = ei['integrity']
        rating_tenth = ei['rating'].to_i * 10
        
        se_methods = ei['method']
        puts se_methods
        
        puts "xxxxxxxxxxxxxxx"
        status = 'DRAFT'
        if ei.include? 'submit'
            status = 'CONFIRMED'
        end
        
        if eiid.to_i < 0
            new_ei = G2EvidenceItem.new({
                evidence_source_id: esid,
                creator: current_user.id,
                status: status,
                benefit_under_test: benefit,
                result: result,
                ctx_who: ctx_whom,
                ctx_what: ctx_what,
                ctx_where: ctx_where,
                ctx_when: ctx_when,
                ctx_how: ctx_how,
                integrity: integrity,
                rating_tenth: rating_tenth,   # FIXME
            })
            
            se_methods.each do |mid|
                new_ei.se_methods << SeMethod.find(mid)
            end
            
            new_ei.save
            
            # TODO update the rating
        else
            ei_entry = G2EvidenceItem.find(eiid)
            ei_entry.status = status
            ei_entry.benefit_under_test = benefit
            ei_entry.result = result
            ei_entry.ctx_who = ctx_whom
            ei_entry.ctx_what = ctx_what
            ei_entry.ctx_where = ctx_where
            ei_entry.ctx_when = ctx_when
            ei_entry.ctx_how = ctx_how
            ei_entry.integrity = integrity
            ei_entry.rating_tenth = rating_tenth  # FIXME
            
            ei_entry.save
            
            puts "~~~~~~~~~~~~~~~~~~~~~~~~~~"
            if se_methods.nil?
                ei_entry.se_methods.delete_all
            else
                method_set_new = Set.new
                se_methods.each do |mid|
                    method_set_new << mid.to_s
                end
                method_set_old = Set.new
                ei_entry.se_methods.each do |m|
                    method_set_old << m.id.to_s
                end
                
                method_to_delete = []
                ei_entry.se_methods.each do |m|
                    if not method_set_new.include? m.id.to_s
                        method_to_delete << m
                    end
                end
                method_to_delete.each do |m|
                    ei_entry.se_methods.delete m
                end
                
                se_methods.each do |mid|
                    if not method_set_old.include? mid.to_s
                        puts 'add new se_method:' + mid.to_s
                        ei_entry.se_methods << SeMethod.find(mid)
                    end
                end
            end

            # TODO update the rating
        end
        
        redirect_to edit_evidence_source_path esid
    end
    
    private def evidence_source_params
        params.require(:evidence_source).permit(
            :category, :raw_bib, :raw_apa, :title, :year, :source_title,
            :publisher, :volume_number, :issue_number, :URL, :DOI)
    end
end
