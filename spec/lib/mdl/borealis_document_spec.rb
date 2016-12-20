require_relative '../../../lib/mdl/borealis_asset.rb'
require_relative '../../../lib/mdl/borealis_image.rb'
require_relative '../../../lib/mdl/borealis_audio.rb'
require_relative '../../../lib/mdl/borealis_video.rb'
require_relative '../../../lib/mdl/borealis_pdf.rb'
require_relative '../../../lib/mdl/borealis_open_seadragon.rb'
require_relative '../../../lib/mdl/borealis_assets_to_viewers.rb'
require_relative '../../../lib/mdl/borealis_asset_map.rb'
require_relative '../../../lib/mdl/borealis_document.rb'
module MDL
  describe BorealisDocument do
    let(:asset_klass) { double }
    let(:document) { {'id' => 'foo:123', 'format' => 'image/jp2', 'title_ssi' => 'blerg'} }
    let(:compound_document) { document.merge({'compound_objects_ts' => '[{"pageptr" : 123, "title" : "Some thing", "transc" : "blah", "pagefile" : "foo.jp2"},
                                                                        {"pageptr" : 321, "title" : "Another Thing", "transc" : "The text", "pagefile" : "foo.mp4"}]'}) }

    context 'when the document is a single item' do
      it 'correctly serializes the document' do
        expect(BorealisDocument.new(document: document).to_viewer).to eq [{"focus"=>true,
                                                                           "type"=>"image",
                                                                           "thumbnail"=>"/thumbnails/foo:123",
                                                                           "items"=>
                                                                            [{"type"=>"image",
                                                                              "label"=>"Image",
                                                                              "focus"=>true,
                                                                              "include_controls"=>true,
                                                                              "sequenceMode"=>true,
                                                                              "showReferenceStrip"=>true,
                                                                              "defaultZoomLevel"=>0,
                                                                              "tileSources"=>["/contentdm-images/info?id=foo:123"]},
                                                                             {"type"=>"transcript",
                                                                              "label"=>"Transcript",
                                                                              "texts"=>[""],
                                                                              "focus"=>false}],
                                                                           "tocs"=>["blerg"]}]
      end
    end


    context 'when the document is a compound item' do
      it 'serializes the documents' do
        expect(BorealisDocument.new(document: compound_document).to_viewer).to eq [
                                                                       {"focus"=>false,
                                                                       "type"=>"video",
                                                                       "thumbnail"=>"/thumbnails/foo:321",
                                                                       "items"=>
                                                                        [{"type"=>"video",
                                                                          "label"=>"Video",
                                                                          "height"=>500,
                                                                          "width"=>500,
                                                                          "focus"=>true,
                                                                          "src"=>
                                                                           "http://reflections.mndigital.org/utils/getstream/collection/foo/id/321"},
                                                                         {"type"=>"transcript",
                                                                          "label"=>"Transcript",
                                                                          "texts"=>["The text"],
                                                                          "focus"=>false}]},
                                                                           {"focus"=>true,
                                                                           "type"=>"image",
                                                                           "thumbnail"=>"/thumbnails/foo:123",
                                                                           "items"=>
                                                                            [{"type"=>"image",
                                                                              "label"=>"Image",
                                                                              "focus"=>true,
                                                                              "include_controls"=>true,
                                                                              "sequenceMode"=>true,
                                                                              "showReferenceStrip"=>true,
                                                                              "defaultZoomLevel"=>0,
                                                                              "tileSources"=>["/contentdm-images/info?id=foo:123"]},
                                                                             {"type"=>"transcript",
                                                                              "label"=>"Transcript",
                                                                              "texts"=>["blah"],
                                                                              "focus"=>false}],
                                                                           "tocs"=>["Some thing"]}]
      end
    end    
  end
end