module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def each(&block)
      @csv_contents.each do |row|
        yield CsvRow.new(@headers, row)
      end
    end
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end
  end
end

class CsvRow
  attr_accessor :row_contents

  def method_missing(name, *args)
    column = name.to_s
    @row_contents[column]
  end

  def initialize(headers, row)
    @row_contents = {}
    headers.zip(row).each { |column, item| @row_contents[column] = item}
  end
end

class MyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

csv = MyCsv.new
csv.each {|row| puts row.Fruit}
