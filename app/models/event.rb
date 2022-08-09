class Event < ApplicationRecord
    enum :gender, [:female, :male, :mixed], _suffix: true, default: :female    
    enum :eventtype, [:qualify, :final], _suffix: true, default: :qualify

    def my_seed_time        
        #self.seed_time.strftime("%T.%L")
        return putTime(self.seed_time)
    end

    def my_event_time        
        #self.event_time.strftime("%T.%L")
        return putTime(self.event_time)
    end

    def putTime(my_time)
        #return my_time.strftime "%M:%S.%L"
        timeGap = my_time.seconds_since_midnight

        if timeGap < 1
            (my_time.strftime "0.%L").to_s
        elsif timeGap < 60
            (my_time.strftime "%S.%L").to_s
        elsif timeGap < 3600
            (my_time.strftime "%M:%S.%L").to_s
        else
            (my_time.strftime "%H:%M:%S.%L").to_s
        end
    end

    def my_gap
        timeGap = self.seed_time.minus_with_coercion(self.event_time)
        if timeGap.positive?
            preFix = "- " 
        else 
            timeGap *= -1
            preFix = "+ " 
        end

        if timeGap < 1
            preFix  + (Time.at(timeGap).utc.strftime "0.%L").to_s
        elsif timeGap < 60
            preFix + (Time.at(timeGap).utc.strftime "%s.%L").to_s
        elsif timeGap < 3600
            preFix + (Time.at(timeGap).utc.strftime "%M:%S.%L").to_s
        else
            preFix + (Time.at(timeGap).utc.strftime "%H:%M:%S.%L").to_s
        end
    end
end
