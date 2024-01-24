require "marathon_logs"

describe MarathonLogs do
  subject { described_class.new }

  describe "#create_log" do
    context "when logged a marathon twice" do
      before do
        2.times do
          subject.create_log(duration: rand(10), distance: rand(8))
        end
      end

      it "returns 2" do
        expect(subject.logs.count).to eq 2
      end
    end

    context "when logging a duration of 10 hrs and distance of 8 km" do
      let(:expected) { { duration: 10, distance: 8 } }

      it "logs the duration and distance" do
        log_message = subject.create_log(duration: 10, distance: 8)
        subject.create_log(duration: 10, distance: 8)
        expect(subject.logs).to include(expected)
      end

      # 1. create a spec when user create a log with a 
      # duration of 10 and distance of 8, and should shows a message:
      # "Duration: 10 hour/s, Distance: 8 km/s."
      context "when logging a duration of 10 hrs and distance of 8 km" do
        let(:expected_log) { { duration: 10, distance: 8 } }

        it "logs the duration and distance and displays the correct message" do
          log_message = subject.create_log(duration: 10, distance: 8)

          expect(subject.logs).to include(expected_log)
          expect(log_message).to eq("Duration: 10 hour/s, Distance: 8 km/s.")
        end
      end
    end
  end

  # 2. describe "#count_logs"
  describe "#count_logs" do
    it "returns the total number of logs" do
      3.times do
        subject.create_log(duration: rand(10), distance: rand(8))
      end
      expect(subject.count_logs).to eq 3
    end
  end

  describe "#total_duration" do
    it "returns the total duration of all logs" do
      subject.create_log(duration: 5, distance: 3)
      subject.create_log(duration: 8, distance: 2)
      expect(subject.total_duration).to eq(13)
    end
  end

  describe "#total_distance" do
    it "returns the total distance of all logs" do
      subject.create_log(duration: 5, distance: 3)
      subject.create_log(duration: 8, distance: 2)
      expect(subject.total_distance).to eq(5)
    end
  end
end