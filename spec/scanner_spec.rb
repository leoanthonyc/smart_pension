require 'spec_helper'
require_relative '../scanner'

describe PageVisitScanner do
  let(:webserverlog_io) { StringIO.new(webserverlog_str) }
  let(:webserverlog_str) {
    <<~HEREDOC
    /help_page/1 126.318.035.038
    /contact 184.123.665.067
    /home 184.123.665.067
    HEREDOC
  }

  it "yields both path and IP address" do
    scanner = PageVisitScanner.new(webserverlog_io)
    expect { |b| scanner.each_line(&b) }
      .to yield_successive_args(
        ['/help_page/1', '126.318.035.038'],
        ['/contact', '184.123.665.067'],
        ['/home', '184.123.665.067'],
      )
  end
end
