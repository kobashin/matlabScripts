load_system('ccaller');
ccallerfunctions = cellfun(@(x)get_param(x, 'FunctionName'), find_system(gcs, 'BlockType', 'CCaller'), 'UniformOutput', false);
disp(ccallerfunctions)