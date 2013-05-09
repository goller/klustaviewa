"""User preferences for KlustaViewa."""

# -----------------------------------------------------------------------------
# Imports
# -----------------------------------------------------------------------------
import logging
import numpy as np

# -----------------------------------------------------------------------------
# Logging
# -----------------------------------------------------------------------------

# Console logging level, can be DEBUG, INFO or WARNING.
loglevel = logging.INFO

# Level of the logging file. DEBUG, INFO or WARNING, or just None to disable.
loglevel_file = logging.DEBUG


# -----------------------------------------------------------------------------
# Main window
# -----------------------------------------------------------------------------
# Should the software ask the user to save upon closing?
prompt_save_on_exit = True


# -----------------------------------------------------------------------------
# Waveform view
# -----------------------------------------------------------------------------
# Approximate maximum number of spikes to show. Should be
# about 100 for low-end graphics cards, 1000 for high-end ones.
waveforms_nspikes_max_expected = 100

# The minimum number of spikes per cluster to display.
waveforms_nspikes_per_cluster_min = 3


# -----------------------------------------------------------------------------
# Feature view
# -----------------------------------------------------------------------------
# Opacity value of the background spikes.
feature_background_alpha = .2

# Opacity value of the spikes in the selected clusters.
feature_selected_alpha = .75

# Number of spikes to show in the background.
features_nspikes_background_max = 10000  

# Maximum number of spikes to show in the selected clusters.
features_nspikes_selection_max = np.inf  # always show all selected clusters

# Minimum number of spikes to show per selected cluster.
features_nspikes_per_cluster_min = np.inf  # always show all selected clusters

# Unit of the spike time in the feature view. Can be 'samples' or 'second'.
features_info_time_unit = 'second'


# -----------------------------------------------------------------------------
# Unit tests
# -----------------------------------------------------------------------------
# Delay between two successive automatic operations in unit tests for views.
test_operator_delay = .01

# Whether to automatically close the views during unit testing.
test_auto_close = True

