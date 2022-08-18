require 'spec_helper'
require_relative '../repository'


describe PageViewRepository do
  let(:repo) { described_class.new }

  describe '#store' do
    it 'stores the path, ip_address pair to the repository' do
      repo.store('/home', '0.0.0.1')
      expect(repo.sort_by_hits.count).to eq(1)
    end
  end

  describe '#sort_by_hits' do
    before do
      repo.store('/home', '0.0.0.1')
      repo.store('/about', '0.0.0.2')
      repo.store('/home', '0.0.0.2')
    end

    it 'returns an array of path, hits, and unique_hits, sorted by descending hits' do
      expect(repo.sort_by_hits)
        .to eq(
          [
            { path: "/home", hits: 2, unique_hits: 2, ips: Set.new(['0.0.0.1', '0.0.0.2']) },
            { path: "/about", hits: 1, unique_hits: 1, ips: Set.new(['0.0.0.2']) },
          ]
        )
    end
  end

  describe '#sort_by_unique_hits' do
    before do
      repo.store('/home', '0.0.0.1')
      repo.store('/contact', '0.0.0.1')
      repo.store('/home', '0.0.0.2')
      repo.store('/contact', '0.0.0.2')
      repo.store('/home', '0.0.0.2')
      repo.store('/home', '0.0.0.2')
      repo.store('/home', '0.0.0.2')
      repo.store('/contact', '0.0.0.3')
    end
    it 'returns an array of path, hits, and unique_hits, sorted by descending unique_hits' do
      expect(repo.sort_by_unique_hits)
        .to eq(
          [
            { path: "/contact", hits: 3, unique_hits: 3, ips: Set.new(['0.0.0.1', '0.0.0.2', '0.0.0.3']) },
            { path: "/home", hits: 5, unique_hits: 2, ips: Set.new(['0.0.0.1', '0.0.0.2']) },
          ]
        )
    end
  end
end
