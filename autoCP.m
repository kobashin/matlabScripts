% ref : https://jp.mathworks.com/help/codeprover/gs/run-polyspace-code-prover-on-cc-code.html

%% Make new project
proj = polyspace.Project

%% Configure sources and headers
proj.Configuration.Sources = {fullfile(polyspaceroot, 'polyspace', 'examples',...
    'cxx', 'Code_Prover_Example', 'sources', 'example.c')};
proj.Configuration.EnvironmentSettings.IncludeFolders = {fullfile(polyspaceroot,...
 'polyspace', 'examples', 'cxx', 'Code_Prover_Example', 'sources')};

%% Set project configurations
proj.Configuration.TargetCompiler.Compiler = 'gnu4.9';
proj.Configuration.ResultsDir = fullfile(pwd,'results');
proj.Configuration.CodeProverVerification.MainGenerator = true;

% add
proj.Configuration.SignedIntegerOverflows = 'forbid';
proj.Configuration.UnsignedIntegerOverflows = 'forbid';

%% Run analysis
cpStatus = proj.run('codeProver');

%% Read results
resObj = proj.Results;
cpSummary = getSummary(resObj, 'runtime');
cpResults = getResults(resObj, 'readable');

%% Open pscp file from UI
% resultsFile = fullfile(proj.Configuration.ResultsDir,'ps_results.pscp');
% polyspaceCodeProver(resultsFile)