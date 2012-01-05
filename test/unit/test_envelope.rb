require 'helper'
require 'lolsoap/envelope'

module LolSoap
  describe Envelope do
    describe 'when first created' do
      let(:wsdl) { nil }
      let(:operation) { nil }

      subject { LolSoap::Envelope.new(wsdl, operation) }

      it 'has a skeleton SOAP envelope structure' do
        doc = subject.doc
        doc.namespaces.must_equal(
          'xmlns:soap' => 'http://schemas.xmlsoap.org/soap/envelope/'
        )

        header = doc.at_xpath('/soap:Envelope/soap:Header', doc.namespaces)
        header.wont_equal nil
        header.children.length.must_equal 0

        body = doc.at_xpath('/soap:Envelope/soap:Body', doc.namespaces)
        body.wont_equal nil
        body.children.length.must_equal 0
      end
    end
  end
end