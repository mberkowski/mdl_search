FactoryGirl.define do
  factory :record, class: OpenStruct do
    collection 'swede1900'
    id  '134'
    original_file_uri 'http://reflections.mndigital.org/utils/getfile/collection/swede1900/id/134/filename/swede1900-134'
    format 'image/jp2'

    trait :with_compound_info do
      pagefile '999.pdf'
      pageptr '999'
    end
  end



end