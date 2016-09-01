require 'test_helper'

class PapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paper = papers(:one)
  end

  test "should get index" do
    get papers_url
    assert_response :success
  end

  test "should get new" do
    get new_paper_url
    assert_response :success
  end

  test "should create paper" do
    assert_difference('Paper.count') do
      post papers_url, params: { paper: { analysed_time: @paper.analysed_time, analyst_id: @paper.analyst_id, authors: @paper.authors, credibility_rate: @paper.credibility_rate, journal: @paper.journal, moderated_time: @paper.moderated_time, moderator_id: @paper.moderator_id, month: @paper.month, pages: @paper.pages, paper_id: @paper.paper_id, paper_status: @paper.paper_status, research_aim: @paper.research_aim, research_metrix: @paper.research_metrix, title: @paper.title, user_id: @paper.user_id, volume: @paper.volume, year: @paper.year } }
    end

    assert_redirected_to paper_url(Paper.last)
  end

  test "should show paper" do
    get paper_url(@paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_paper_url(@paper)
    assert_response :success
  end

  test "should update paper" do
    patch paper_url(@paper), params: { paper: { analysed_time: @paper.analysed_time, analyst_id: @paper.analyst_id, authors: @paper.authors, credibility_rate: @paper.credibility_rate, journal: @paper.journal, moderated_time: @paper.moderated_time, moderator_id: @paper.moderator_id, month: @paper.month, pages: @paper.pages, paper_id: @paper.paper_id, paper_status: @paper.paper_status, research_aim: @paper.research_aim, research_metrix: @paper.research_metrix, title: @paper.title, user_id: @paper.user_id, volume: @paper.volume, year: @paper.year } }
    assert_redirected_to paper_url(@paper)
  end

  test "should destroy paper" do
    assert_difference('Paper.count', -1) do
      delete paper_url(@paper)
    end

    assert_redirected_to papers_url
  end
end
