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
    
    private def evidence_source_params
        params.require(:evidence_source).permit(
            :category, :raw_bib, :raw_apa, :title, :year, :source_title,
            :publisher, :volume_number, :issue_number, :URL, :DOI)
    end
end
