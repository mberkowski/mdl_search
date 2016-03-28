FactoryGirl.define do
  factory :cdm_document, class: OpenStruct do
    id  'mpls:13128'
    original_file_uri 'http://reflections.mndigital.org/utils/getfile/collection/mpls/id/13128/filename/mpls-13128'
    format 'image/jp2'

    trait :with_compound_objects do
      compound_objects [{pagefile: '999.pdf', pageptr: '999'}]
    end
  end



end