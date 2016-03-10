module AbTestable
  def self.included(base)
    base.class_eval do
      include InstanceMethods
      base.send :has_and_belongs_to_many, :ab_options, :join_table => "#{base.table_name}_ab_options".to_sym
    end
  end

  module InstanceMethods
    def get_ab(test_name, params={})
      test = AbTest.find_by_name(test_name.to_s)

      raise "Unable to find ab test #{test_name}" if test.nil?
      retried = false

      bypass = test.exclude_tids.nil? ? [] : test.exclude_tids.split(',').map{|x| x.strip.to_i} 
      if bypass.include?(self.tid)
        return test.default_value
      end

      begin
        ab = self.ab_options.find_by_ab_test_id(test.id)
        if ab.nil?
          options = AbOption.find_all_by_ab_test_id(test.id)
          if params[test_name].present?
            options.each do |o|
              if params[test_name] == o.value
                ab = o
                break
              end
            end
          else
            weights = options.inject([]) { |arr, o| arr << o.weight }
            total_weight = weights.inject { |sum, w| sum + w }
            point = rand * total_weight

            options.zip(weights).each do |o, w|
              if w >= point
                ab = o
                break
              end
              point -= w
            end
          end

          raise "Unable to find ab test value for test #{test_name}" if ab.nil?

          self.ab_options << ab
          self.touch
        end
      rescue ActiveRecord::RecordNotUnique
        if !retried
          retried = true
          retry
        else
          raise "ABTestable race condition hit, attempted to recover but failed"
        end
      end

      return ab.value
    end

    def has_ab?(test_name)
      test = AbTest.find_by_name(test_name.to_s)
      raise "Unable to find ab test #{test_name}" if test.nil?
      !(self.ab_options.find_by_ab_test_id(test.id).nil?)
    end
  end
end
