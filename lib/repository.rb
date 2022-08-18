require 'set'

class Repository
  def store
    raise "Not Implemented"
  end

  private

  def repository
    @repository ||= {}
  end
end

class PageViewRepository < Repository
  def store(url_path, ip_address)
    repository[url_path] ||= {
      path: url_path,
      hits: 0,
      unique_hits: 0,
      ips: Set.new
    }
    repository[url_path][:hits] += 1
    unless repository[url_path][:ips].include?(ip_address)
      repository[url_path][:unique_hits] += 1
      repository[url_path][:ips].add(ip_address)
    end
  end

  def sort_by_hits
    repository.values.sort_by { |h| h[:hits] }.reverse
  end

  def sort_by_unique_hits
    repository.values.sort_by { |h| h[:unique_hits] }.reverse
  end
end
