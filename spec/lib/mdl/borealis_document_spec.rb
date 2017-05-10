require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_image.rb'
require_relative '../../../lib/mdl/borealis_audio.rb'
require_relative '../../../lib/mdl/borealis_video.rb'
require_relative '../../../lib/mdl/borealis_pdf.rb'
require_relative '../../../lib/mdl/borealis_open_seadragon.rb'
require_relative '../../../lib/mdl/borealis_assets_to_viewers.rb'
require_relative '../../../lib/mdl/borealis_asset_map.rb'
require_relative '../../../lib/mdl/borealis_document.rb'
require_relative '../../../lib/mdl/borealis_ppt.rb'
module MDL
  describe BorealisDocument do
    let(:asset_klass) { double }
    let(:document) { {'id' => 'foo:123', 'format' => 'image/jp2', 'title_ssi' => 'blerg'} }
    let(:compound_document) { document.merge({'compound_objects_ts' =>
        '[{"pageptr" : 123, "title" : "Some thing", "transc" : "blah", "pagefile" : "foo.jp2"},
         {"pageptr" : 321, "title" : "Another Thing", "transc" : "The text", "pagefile" : "foo.mp4"}]'}) }

    let(:bogus_pagefile) { document.merge({'compound_objects_ts' =>
        '[{"pageptr" : 123, "title" : "Some thing", "transc" : "blah", "pagefile" : {}},
         {"pageptr" : 321, "title" : "Another Thing", "transc" : "The text", "pagefile" : "foo.jp2"}]'}) }

    let(:expected_bogus_viewer_result) do
          {
            "image" => {
              "type"=>"image",
              "thumbnail"=>"/thumbnails/foo:123",
              "label"=>"Image",
              "include_controls"=>true,
              "sequenceMode"=>true,
              "showReferenceStrip"=>true,
              "defaultZoomLevel"=>0,
              "tileSources"=>["/contentdm-images/info?id=foo:123"],
              "transcript"=>{
                "texts"=>["blah"],
                "label"=>"Image"
              },
              "tocs"=>["Some thing"]
            },
           "image" => {"type"=>"image", "thumbnail"=>"/thumbnails/foo:321", "label"=>"Image", "include_controls"=>true, "sequenceMode"=>true, "showReferenceStrip"=>true, "defaultZoomLevel"=>0, "tileSources"=>["/contentdm-images/info?id=foo:321"], "transcript"=>{"texts"=>["The text"], "label"=>"Image"}, "tocs"=>["Another Thing"]}
          }
    end

    context 'when the document is a single item' do
      it 'correctly serializes the document' do
        puts BorealisDocument.new(document: document).to_viewer.inspect
        expect(BorealisDocument.new(document: document).to_viewer).to eq (
          {
            "image" => {
              "type" => "image",
              "thumbnail" => "/thumbnails/foo:123",
              "label" => "Image",
              "include_controls" => true,
              "sequenceMode" => true,
              "showReferenceStrip" => true,
              "defaultZoomLevel" => 0,
              "tileSources" => ["/contentdm-images/info?id=foo:123"],
              "transcript" => {
                "texts" => [],
                "label" => "Image"
              },
              "tocs" => ["blerg"]
            }
          })
      end
    end

    context 'when the document is a compound item' do
      it 'serializes the documents' do
        expect(BorealisDocument.new(document: compound_document).to_viewer).to eq (
          {
            "image" => {
              "type"=>"image",
              "thumbnail"=>"/thumbnails/foo:123",
              "label"=>"Image",
              "include_controls"=>true,
              "sequenceMode"=>true,
              "showReferenceStrip"=>true,
              "defaultZoomLevel"=>0,
              "tileSources"=>["/contentdm-images/info?id=foo:123"],
              "transcript"=>{
                "texts"=>["blah"],
                "label"=>"Image"
              },
              "tocs"=>["Some thing"]
            },
           "kaltura_video" => {"type"=>"kaltura_video", "targetId"=>"kaltura_player_video", "wid"=>"_1369852", "uiconf_id"=>38683631, "transcript"=>{"texts"=>["The text"], "label"=>"Video"}, "entry_id"=>nil, "height"=>"315px", "width"=>"560px", "thumbnail"=>"https://d1kue88aredzk1.cloudfront.net/video-1.png"}
          })
      end

      it 'rejects bad page page file data' do
        expect(BorealisDocument.new(document: bogus_pagefile).to_viewer).to eq expected_bogus_viewer_result
      end


    end
  end
end