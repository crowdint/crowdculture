require 'spec_helper'

describe StaticPagesController do
  describe "on #home action call" do
    it "should render /static_pages/home.html view" do
      get :home
      response.should render_template 'home'
    end
  end

  describe "on #show_entries action call" do
    it "should render /static_pages/show_entries.js view" do
      get :show_entries, :format => 'js', feed: 1
      response.should render_template 'show_entries'
    end

    it "should include feed on params" do
      get :show_entries, :format => 'js', feed: 1
      subject.params[:feed].should_not be_nil
      subject.params[:feed].should == '1'
    end

    it "should include page on params" do
      get :show_entries, :format => 'js', page: 2, feed: 1
      subject.params[:page].should_not be_nil
      subject.params[:page].should == '2'
    end

    it "should include per_page on params" do
      get :show_entries, :format => 'js', per_page: 15, feed: 1
      subject.params[:per_page].should_not be_nil
      subject.params[:per_page].should == '15'
    end

    context "when feed = All" do
      it "should call #all_feeds method" do
        subject.should_receive(:all_feeds).with('2','15')
        get :show_entries, :format => 'js', feed: 'All', page: 2, per_page: 15
      end
    end

    context "when feed != All" do
      it "should call #filtered_feed method" do
        subject.should_receive(:filtered_feed).with('notAll','2','15')
        get :show_entries, :format => 'js', feed: 'notAll', page: 2, per_page: 15
      end
    end
  end

end
