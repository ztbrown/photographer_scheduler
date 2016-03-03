require_relative '../../app/runners/named_callbacks'

class Runner
  attr_reader :repo

  def initialize(repo)
    @callbacks = NamedCallbacks.new
    @repo = repo
    yield(@callbacks) if block_given?
  end

  def success(*args)
    callback(:success, *args)
  end

  def failure(*args)
    callback(:failure, *args)
  end

  def callback(name, *args)
    @callbacks.call(name, *args)
    args
  end
end
