---
layout: post
title: "Evidently: The Ultimate Tool for Streamlining Your Machine Learning Workflow ⚡"
description: "Intro to the Evidently open-source framework"
date: 2023-06-15
---

# The Use Case

Error handling is something that I have personally been trying to incorporate more into my own workflow. But error handling in data science is much different than that of software engineering. Evidently makes this easy!

I recently came across this open-source package that I think is fantastic for using in ML projects. Evidently is a tool that generates metrics and reports for your data, model, and predictions. The key components are metrics, tests, and reports. Each component can be customized to fit your needs. 

# Core Concepts

(from documentation)

A **Metric** is a core component of Evidently. You can combine multiple Metrics in a Report. Reports are best for visual analysis and debugging of your models and data.

A **Test** is a metric with a condition. Each test returns a pass or fail result. You can combine multiple Tests in a Test Suite. Test Suites are best for automated model checks as part of an ML pipeline.

A **Report** is a combination of different Metrics that evaluate data or ML model quality.

You can list multiple Tests and execute them together in a **Test Suite**. Test Suites are best for automation. Use them when you can set up expectations upfront (or derive them from the reference dataset).

All of these objects produce JSON artifacts that can be converted to html, python dictionaries, or visual renders within a notebook.

![Evidently Example 1](https://www.googleapis.com/download/storage/v1/b/kaggle-forum-message-attachments/o/inbox%2F1506047%2F2c71b476901354f1a9c3cec72d2fcbf3%2FScreenshot%202023-04-14%20at%2011.53.35%20AM.png?generation=1681495210873114&alt=media)

![Evidently Example 2](https://www.googleapis.com/download/storage/v1/b/kaggle-forum-message-attachments/o/inbox%2F1506047%2Fc30992efbb15c456d60bf018330413b5%2FScreenshot%202023-04-14%20at%2011.53.07%20AM.png?generation=1681495221209007&alt=media)

## Example python dictionary output

![Evidently Example 3](https://www.googleapis.com/download/storage/v1/b/kaggle-forum-message-attachments/o/inbox%2F1506047%2Fa144cae04f5024e6f476b4cd24e70d20%2FScreenshot%202023-04-14%20at%2011.59.51%20AM.png?generation=1681495257329481&alt=media)

# Getting Started
```python
from evidently.metric_preset import DataDriftPreset, TargetDriftPreset, DataQualityPreset
```

```python
# Predefined sets of tests
from evidently.metric_preset import DataDriftPreset, TargetDriftPreset, DataQualityPreset
```

```python
from evidently.report import Report
from evidently.metrics import DatasetDriftMetric, DataDriftTable

# Customizable reports, display in notebook
data_drift_dataset_report = Report(metrics=[
    DatasetDriftMetric(),
    DataDriftTable(),    
])
data_drift_dataset_report.run(reference_data=reference, current_data=current)
data_drift_dataset_report
```

```python
# Example output
data_drift_dataset_report.as_dict()

# Customize dictionary output
data_drift_dataset_report.as_dict(include={
    "DataDriftTable": {
        "drift_by_columns":{
            "target":{
                "column_name", "column_type", "drift_score"
            }}}})

# HTML
report.save_html("file.html")

```

**Docs:** [EvidentlyAI](https://www.evidentlyai.com/)

**Github:** [Evidently Github](https://github.com/evidentlyai/evidently) 