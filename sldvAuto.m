set_param(mdl, 'TreatAsAtomicUnit', 'on');

% sldvrun : https://jp.mathworks.com/help/sldv/ref/sldvrun.html?s_tid=doc_ta
% sldvoptions : https://jp.mathworks.com/help/sldv/ref/sldvoptions.html
opts = sldvoptions;
opts.Mode = 'TestGeneration';              % Perform test-generation analysis
opts.ModelCoverageObjectives = 'MCDC';     % MCDC coverage
opts.SaveHarnessModel = 'off';             % Don't save harness as model file
opts.SaveReport = 'on';                    % Save the HTML report
opts.AutomaticStubbing = 'on';
opts.MaxProcessTime = 5000;
opts.MaxTestCaseSteps = 100000;
% opts.ReportIncludeGraphics = 'on';
% opts.TestSuiteOptimization = 'LongTestCases';

% get option object from model
% optsModel = sldvoptions(bdroot);
% optsCopy = optsModel.deepCopy;
% optsCopy.MaxProcessTime = 120;
% optsCopy.MaxTestCaseSteps = 10000;


open_system ('sldvdemo_cruise_control');
[ status, files ] = sldvrun('sldvdemo_cruise_control', opts);
