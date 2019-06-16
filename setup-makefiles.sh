#!/bin/bash
#
# Copyright (C) 2020 The Lineage OS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

# Required!
export DEVICE=ks01ltexx
export VENDOR=samsung
export DEVICE_BRINGUP_YEAR=2013


INITIAL_COPYRIGHT_YEAR=2013

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$MY_DIR" ]]; then MY_DIR="$PWD"; fi

LINEAGE_ROOT="$MY_DIR"/../../..

HELPER="$LINEAGE_ROOT"/vendor/lineage/build/tools/extract_utils.sh
if [ ! -f "$HELPER" ]; then
    echo "Unable to find helper script at $HELPER"
    exit 1
fi
. "$HELPER"

# Initialize the helper for device
setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" true

# Copyright headers and guards
write_headers "ks01ltexx ks01lteskt ks01ltektt ks01ltelgt"

# The standard device blobs
write_makefiles "$MY_DIR"/proprietary-files.txt true

# We are done!
write_footers

# Blobs for TWRP data decryption
cat << EOF >> "$BOARDMK"
ifeq (\$(WITH_TWRP),true)
TARGET_RECOVERY_DEVICE_DIRS += vendor/$VENDOR/$DEVICE/proprietary
endif
EOF

# Finish
write_footers

if [ -s "$MY_DIR"/../$DEVICE/proprietary-files.txt ]; then
    # Reinitialize the helper for device
    INITIAL_COPYRIGHT_YEAR="$DEVICE_BRINGUP_YEAR"
    setup_vendor "$DEVICE" "$VENDOR" "$LINEAGE_ROOT" false

    # Copyright headers and guards
    write_headers

    # The standard device blobs
    write_makefiles "$MY_DIR"/../$DEVICE/proprietary-files.txt true

    # We are done!
    write_footers
fi

./../../$VENDOR/$DEVICE/setup-makefiles.sh $@
