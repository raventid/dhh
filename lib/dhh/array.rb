module ActiveSupport
  refine Array do
    def sum(start = 0)
      inject(start, &:+)
    end
  end
end

