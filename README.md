# jmeter

## example.jmx
```
<?xml version="1.0" encoding="UTF-8"?>
<jmeterTestPlan version="1.2" properties="2.8" jmeter="2.13 r1665067">
  <hashTree>
    <TestPlan guiclass="TestPlanGui" testclass="TestPlan" enabled="true">
    </TestPlan>
    <hashTree>
      <ThreadGroup guiclass="ThreadGroupGui" testclass="ThreadGroup" testname="example" enabled="true">
        <stringProp name="ThreadGroup.on_sample_error">continue</stringProp>
        <elementProp name="ThreadGroup.main_controller" elementType="LoopController" guiclass="LoopControlPanel" testclass="LoopController" enabled="true">
          <boolProp name="LoopController.continue_forever">false</boolProp>
          <stringProp name="LoopController.loops">1000</stringProp>
        </elementProp>
        <stringProp name="ThreadGroup.num_threads">1000</stringProp>
        <stringProp name="ThreadGroup.ramp_time">0</stringProp>
      </ThreadGroup>
      <hashTree>
        <HTTPSamplerProxy guiclass="HttpTestSampleGui" testclass="HTTPSamplerProxy" enabled="true">
          <stringProp name="HTTPSampler.domain">www.suz-lab.com</stringProp>
          <stringProp name="HTTPSampler.path">/</stringProp>
          <stringProp name="HTTPSampler.method">GET</stringProp>
          <boolProp name="HTTPSampler.use_keepalive">true</boolProp>
        </HTTPSamplerProxy>
      </hashTree>
    </hashTree>
  </hashTree>
</jmeterTestPlan>
```

## CloudFormation
```
export ProjectName=Jmeter1
export KeyName=key-name
export CustomerCidrIp=xxx.xxx.xxx.xxx/xxx
export TemplateBukcket=jmeter-template-bucket
./jmeter-present.sh 
```

## Execute
```
/usr/local/apache-jmeter-2.13/bin/jmeter -n \
-t example.jmx \
-Dclient.rmi.localport=55512 \
-Djava.rmi.server.hostname=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4` \
-R xxx.xxx.xxx.xxx:11099,xxx.xxx.xxx.xxx:11099 \
-l example.csv \
-j example.log
```
