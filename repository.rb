class Repository
  private
  def repository
    @repository ||= repository
  end
end

class PageVisitRepository < Repository
  def store(path, ip_address)
  end

  def sort_by_hits(unique_ip_address: false)
  end
end
