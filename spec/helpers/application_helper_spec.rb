require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  article = Article.new
  article.AuthorId = 1
  article.title = 'test'
  article.text = 'Article long text for testing the helper method'
  article.image = nil

  describe '#image_render' do
    it 'has a width 100 css classes' do
      expect(image_render(article)).to have_css('.w-100')
    end

    it 'has img tag' do
      image_render(article).should have_selector('img')
    end
  end

  describe '#extract_title' do
    it 'returns title of the article' do
      expect(extract_title(article)).to eq('test')
    end

    it 'returns no article tile if the passed parameter is no article object' do
      expect(extract_title('article')).to eq('No article titles found here')
    end
  end

  describe '#extract_text' do
    it 'returns title of the article' do
      expect(extract_text(article)).to eq('Article long text for testing the helper method')
    end

    it 'returns no article text if the passed parameter is no article object' do
      expect(extract_text('article')).to eq('No article texts found here')
    end
  end

  describe '#separetor' do
    it 'has an ins tag' do
      separetor.should have_selector('ins')
    end

    it 'has d-none d-md-block css classes' do
      expect(separetor).to have_css('.d-none')
    end
  end
end
