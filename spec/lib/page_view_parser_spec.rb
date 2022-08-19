require 'spec_helper'
require_relative '../../lib/page_view_parser'

describe PageViewParser do
  let(:webserverlog_io) { StringIO.new(webserverlog_str) }
  let(:webserverlog_str) {
    <<~HEREDOC
    /help_page/1 126.318.035.038
    /contact 184.123.665.067
    /home 184.123.665.067
    HEREDOC
  }
  let(:output_stream) { double(:stdout, puts: nil) }

  it "outputs the results to the output stream" do
    # 
    # SORT BY HITS DESC
    # path: /help_page/1, views: 1
    # path: /contact, views: 1
    # path: /home, views: 1
    #
    # SORT BY UNIQUE_HITS DESC
    # path: /help_page/1, unique_views: 1
    # path: /contact, unique_views: 1
    # path: /home, unique_views: 1
    #
    expect(STDOUT).to receive(:puts).exactly(11).times
    PageViewParser.new(webserverlog_io).call
  end
end
