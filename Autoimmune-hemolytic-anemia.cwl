cwlVersion: v1.0
steps:
  read-potential-cases-omop:
    run: read-potential-cases-omop.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  haemolytic-autoimmune-hemolytic-anemia---secondary:
    run: haemolytic-autoimmune-hemolytic-anemia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-omop/output
  autoimmune-hemolytic-anemia-evans---secondary:
    run: autoimmune-hemolytic-anemia-evans---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: haemolytic-autoimmune-hemolytic-anemia---secondary/output
  mixed-autoimmune-hemolytic-anemia---secondary:
    run: mixed-autoimmune-hemolytic-anemia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-evans---secondary/output
  autoimmune-hemolytic-anemia-colitis---secondary:
    run: autoimmune-hemolytic-anemia-colitis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: mixed-autoimmune-hemolytic-anemia---secondary/output
  rheumatic-autoimmune-hemolytic-anemia---secondary:
    run: rheumatic-autoimmune-hemolytic-anemia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-colitis---secondary/output
  autoimmune-hemolytic-anemia-inflammatory---secondary:
    run: autoimmune-hemolytic-anemia-inflammatory---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: rheumatic-autoimmune-hemolytic-anemia---secondary/output
  autoimmune-hemolytic-anemia-neoplasm---secondary:
    run: autoimmune-hemolytic-anemia-neoplasm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-inflammatory---secondary/output
  autoimmune-hemolytic-anemia-syphilis---secondary:
    run: autoimmune-hemolytic-anemia-syphilis---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-neoplasm---secondary/output
  autoimmune-hemolytic-anemia-class---secondary:
    run: autoimmune-hemolytic-anemia-class---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-syphilis---secondary/output
  autoimmune-hemolytic-anemia-coldtype---secondary:
    run: autoimmune-hemolytic-anemia-coldtype---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-class---secondary/output
  postviral-autoimmune-hemolytic-anemia---secondary:
    run: postviral-autoimmune-hemolytic-anemia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-coldtype---secondary/output
  lymphoproliferative-autoimmune-hemolytic-anemia---secondary:
    run: lymphoproliferative-autoimmune-hemolytic-anemia---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: postviral-autoimmune-hemolytic-anemia---secondary/output
  autoimmune-hemolytic-anemia-erythematosus---secondary:
    run: autoimmune-hemolytic-anemia-erythematosus---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: lymphoproliferative-autoimmune-hemolytic-anemia---secondary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: autoimmune-hemolytic-anemia-erythematosus---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
