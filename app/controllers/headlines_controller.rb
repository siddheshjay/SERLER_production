class HeadlinesController < ApplicationController
    def news
    end
    
    def create_news
        puts "create news by an administrator"

        obj = {
            type: :news,
            body: params.require('news_body')
        }
        
        obj_json = obj.to_json
        puts obj_json
        
        News.create({
            news_body: obj_json
        })
    end
    
    def recent_articles
        @recent_evidence_sources = EvidenceSource.where('status=?', 'PUBLISHED').limit(64).order(created_at: :desc)
        # @recent_evidence_sources = EvidenceSource.all
    end
    
    def create_recent_articles
        puts "create recent-articles by an administrator"
        
        obj = {
            type: :articles,
            body: params.require('description'),
            articles: params.require('articles'),
        }
        
        obj_json = obj.to_json
        puts obj_json
        
        News.create({
            news_body: obj_json
        })
    end
end
