function run_all_subject(subj_info, contrasts, varargin)

defaults = struct('data_dir', 'd:/meg_laminar/derivatives/spm12', 'inv_type', 'EBB',...
    'patch_size',0.4, 'surf_dir', 'd:/meg_laminar/derivatives/freesurfer', 'iterations',10,...
    'shift_magnitude', 10);  %define default values
params = struct(varargin{:});
for f = fieldnames(defaults)',
    if ~isfield(params, f{1}),
        params.(f{1}) = defaults.(f{1});
    end
end

for idx=1:params.iterations
    for i=1:length(contrasts)
        contrast=contrasts(i);
        compare_subject_layers(subj_info, contrast, idx,...
            'data_dir', params.data_dir, 'inv_type', params.inv_type, ...
            'patch_size', params.patch_size, 'surf_dir', params.surf_dir,...
            'shift_magnitude', params.shift_magnitude);
    end        
end
