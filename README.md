# Run VAL Validator in Docker

This repository provides a Dockerfile to build and run the VAL Validator, developed in https://github.com/KCL-Planning/VAL.

Example:
```bash
> docker run claudiusk/val:latest domain.pddl problem.pddl plan.pddl
```

Commands:
```bash
> docker run claudiusk/val:latest -h
VAL: The PDDL+ plan validation tool
Version 4: Validates continuous effects, events and processes.

Authors: Derek Long, Richard Howey, Stephen Cresswell and Maria Fox
https:://github/KCL-Planning/VAL

Usage: validate [options] domainFile problemFile planFile1 ...
Options:
    -t <n>     -- Set tolerance to (float) value of n.
    -r <n> <p> <m> -- Analyse the plan for its robustness, each action timestamp to within a (float) value of n, each PNE to within a (float value) of p, for m test plans.
    -ra <p>    -- Calculate robustness of plan with respect to varying action timestamps, whilst varying PNEs to within a (float value) of p (default p = 0).
    -rp <n>    -- Calculate robustness of plan with respect to varying PNEs, whilst varying action timestamps to within a (float value) of n (default n = 0).
    -rm <x>    -- Set metric for robustness testing: x = m, maximum; x = a, accumulative; x = d, delay. (default x = m).
    -rd <x>    -- Set distribution for robustness testing: x = u, uniform; x = n, normal; x = p, psuedo-normal. (default x = u).
    -j         -- When varying the values of PNEs also vary for event preconditions. (default = false)
    -v         -- Verbose reporting of plan check progress.
    -l         -- Verbose LaTeX reporting of plan check progress.
    -a         -- Do not output plan repair advice when Verbose is on.
    -g         -- Use graphplan length where no metric specified.
    -h         -- Print this message.
    -p <n> <m> -- Number of pages for LaTeX Gantt chart (n = across time axis, m = across rows).
    -o  ... -o -- Objects (and/or types of) to be tracked on LaTeX Gantt chart.
    -q <n>     -- Number of points(10-878) used to draw LaTeX graphs of PNEs (default = 500).
    -d         -- Do not check set of derived predicates for stratification.
    -c         -- Continue executing plan even if an action precondition is unsatisfied.
    -e         -- Produce error report for the full plan, and try to repair it.
    -i         -- Warn if invariants with continuous effects cannot be checked.
    -s         -- Silent mode: output is generated only when errors occur
    -S         -- Silent mode with values: outputs only plan values in order (failed for bad plan)
    -m         -- Use makespan as metric for temporal plans (overrides any other metric).
    -L         -- Add step length as metric (in addition to any other metric).
    -f <file>  -- LaTeX report will be stored in file 'file.tex'
Multiple plan file arguments can be appended for checking.
```

This image can also be used to call the other executables of the VAL repository:
Possible Executables: 
- Analyse        
- DomainView    
- HowWhatWhen    
- Instantiate    
- Parser         
- PinguPlan      
- PlanRec        
- PlanSeqStep    
- PlanToValStep  
- Relax          
- TIM            
- ToFn           
- TypeAnalysis   
- ValStep        
- Validate       
- ValueSeq

```bash
docker run --entrypoint /usr/local/bin/ValStep claudiusk/val:latest 
```