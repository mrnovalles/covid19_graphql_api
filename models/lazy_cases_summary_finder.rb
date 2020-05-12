class LazyCasesSummaryFinder
  def initialize(context, country_slug)
    @context = context
    @country_slug = country_slug
    @lazy_state = @context[:lazy_cases_summary_finder] ||= initial_state

    @lazy_state[:pending_ids] << country_slug
  end

  # Return the loaded record, hitting the database if needed
  def cases_summary
    # Check if the record was already loaded:
    loaded_record = @lazy_state[:loaded_ids][@country_slug]
    return loaded_record if loaded_record

    # The record hasn't been loaded yet, hit the source to fetch them
    cases_summaries = CasesSummary.all
    cases_summaries.each do |case_summary|
      @lazy_state[:loaded_ids][case_summary.country_slug] = case_summary
    end
    @lazy_state[:pending_ids].clear


    # Now, get the matching person from the loaded result:
    @lazy_state[:loaded_ids][@country_slug]
  end

  private

  def initial_state
    {
      pending_ids: Set.new,
      loaded_ids: {}
    }
  end

end
