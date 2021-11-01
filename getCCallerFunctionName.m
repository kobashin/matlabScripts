load_system('ccaller');
ccallerfunctions = cellfun(@(x)get_param(x, 'FunctionName'), find_system(gcs, 'BlockType', 'CCaller'), 'UniformOutput', false);
out = sim('ccaller.slx', 'ReturnWorkspaceOutputs','on');
save_system('ccaller')
close_system('ccaller')
disp(ccallerfunctions)
disp(out.simoutData)
