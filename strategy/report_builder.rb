class ReportBuilder
    def initialize(strategy:, report_data:)
      @strategy = strategy
      @report_data = report_data
      @document = strategy.create_document
    end

    def call
      section_one(document, report_data)
      section_two(document, report_data)
      render(document)
    end

    private

    attr_reader :strategy, :report_data, :document

    delegate :section_one, :section_two, :render, to: :strategy
  end
