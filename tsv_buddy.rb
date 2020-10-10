# frozen_string_literal: true

require 'csv'
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    tsv = CSV.parse(tsv, col_sep: "\t")
    header = tsv[0]
    tsv.shift
    @data = tsv.map do |row|
      header.zip(row).to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    string = ["date\tstudent_id\tlanguages\tbest_language\tapp_experience\ttech_experience"]
    @data.map! do |n|
      n.values.join("\t")
    end
    string.append(@data).join("\n").to_s + "\n"
  end
end
