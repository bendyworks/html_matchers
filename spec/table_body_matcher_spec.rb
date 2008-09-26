require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe 'table_body_matcher' do
	describe 'with interposing <tbody> element' do
		it 'should find headers' do
			response = mock_model(Object, :body => '<table id="my_id"><tbody><tr><td>c1</td><td>c2</td></tr></tbody></table>')
			response.should have_table_body('my_id', [['c1', 'c2']])
		end
	end

	describe 'without <tbody> element' do
		it 'should not require <tbody>' do
			response = mock_model(Object, :body => '<table id="my_id"><tr><td>c1</td><td>c2</td></tr></table>')
			response.should have_table_body('my_id', [['c1', 'c2']])
		end

		it 'should ignore header row' do
			response = mock_model(Object, :body => '<table id="my_id"><tr><th>h1</th><th>h2</th></tr><tr><td>c1</td><td>c2</td></tr></table>')
			response.should have_table_body('my_id', [['c1', 'c2']])
		end
	end
end