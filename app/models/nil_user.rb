class NilUser
  def method_missing method, *args
    nil
  end
end
