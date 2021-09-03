ani="2016 2017 2018 2019 2020"
institutii="TribunalulBUCURESTI JudecatoriaSECTORUL1BUCURESTI JudecatoriaSECTORUL2BUCURESTI JudecatoriaSECTORUL3BUCURESTI JudecatoriaSECTORUL4BUCURESTI JudecatoriaSECTORUL5BUCURESTI JudecatoriaSECTORUL6BUCURESTI TribunalulARAD JudecatoriaARAD TribunalulBOTOSANI JudecatoriaBOTOSANI"
cautari="minor divort copil copii autoritatii autoritate"

for an in $ani; do
for institutie in $institutii; do
for cautare in $cautari; do

curl -X POST   'http://portalquery.just.ro/Query.asmx'   -H 'User-Agent: Thunder Client (https://www.thunderclient.io)'   -H 'Accept: */*'   -H 'Content-Encoding: UTF-8'   -H 'Content-Type: text/xml'   -d "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:por=\"portalquery.just.ro\">
   <soapenv:Header/>
   <soapenv:Body>
      <por:CautareDosare>
         <por:obiectDosar>${cautare}</por:obiectDosar>
         <por:institutie>${institutie}</por:institutie>
         <por:dataStart>${an}-01-01T00:00:00.000+03:00</por:dataStart>
         <por:dataStop>${an}-12-31T00:00:00.000+03:00</por:dataStop>
      </por:CautareDosare>
   </soapenv:Body>
</soapenv:Envelope>" > data/${an}/${institutie}_${cautare}.xml

java -cp /usr/local/opt/saxon/libexec/saxon-he-10.5.jar net.sf.saxon.Transform -xsl:dosar.xsl -s:data/${an}/${institutie}_${cautare}.xml -o:result/${an}/${institutie}_${cautare}.xml

done
done
done