# -*- encoding: utf-8 -*- 

require File.dirname(__FILE__) + '/spec_helper.rb'

describe YandexInflect do
  before(:all) do
    @sample_inflection = ["рубин", "рубина", "рубину", "рубин", "рубином", "рубине"]
  end
  
  before(:each) do
    @inflection = mock(:inflection)
    YandexInflect::clear_cache
  end

  it "should return an array of inflections when webservice returns an array" do
    @inflection.stub!(:get).and_return(@sample_inflection)
    YandexInflect::Inflection.should_receive(:new).and_return(@inflection)
    YandexInflect.inflections("рубин").should == @sample_inflection
  end

  it "should return an array filled with identical strings when webservice returns a string" do
    @inflection.stub!(:get).and_return("рубин1")
    YandexInflect::Inflection.should_receive(:new).and_return(@inflection)
    YandexInflect.inflections("рубин").should == %w(рубин1 рубин1 рубин1 рубин1 рубин1 рубин1)
  end

  it "should return an array filled with identical strings of original word when webservice does not return anything meaningful or throws an exception" do
    @inflection.stub!(:get).and_return(nil)
    YandexInflect::Inflection.should_receive(:new).and_return(@inflection)
    YandexInflect.inflections("рубин").should == %w(рубин рубин рубин рубин рубин рубин)
  end
end

describe YandexInflect, "with caching" do
  before(:each) do
    @inflection = mock(:inflection)
    YandexInflect::clear_cache
  end

  it "should cache successful lookups" do
    sample = ["рубин", "рубина", "рубину", "рубин", "рубином", "рубине"]
    @inflection.stub!(:get).and_return(sample)
    YandexInflect::Inflection.should_receive(:new).once.and_return(@inflection)
    
    2.times { YandexInflect.inflections("рубин") }
  end
  
  it "should NOT cache unseccussful lookups" do
    sample = nil
    @inflection.stub!(:get).and_return(sample)
    YandexInflect::Inflection.should_receive(:new).twice.and_return(@inflection)
    
    2.times { YandexInflect.inflections("рубин") }
  end
  
  it "should allow to clear cache" do
    sample = "рубин"
    @inflection.stub!(:get).and_return(sample)
    YandexInflect::Inflection.should_receive(:new).twice.and_return(@inflection)
    
    YandexInflect.inflections("рубин")
    YandexInflect.clear_cache
    YandexInflect.inflections("рубин")
  end
end

describe YandexInflect::Inflection do
  before(:all) do
    @sample_answer = {
      "inflections"=>{"inflection"=>["рубин", "рубина", "рубину", "рубин", "рубином", "рубине"], "original"=>"рубин"}
    }
    @sample_inflection = ["рубин", "рубина", "рубину", "рубин", "рубином", "рубине"]
  end
  
  it "should get inflections for a word" do
    YandexInflect::Inflection.should_receive(:get).and_return(@sample_answer)
    YandexInflect::Inflection.new.get("рубин").should == @sample_inflection
  end
end
