#!/bin/bash

# Copyright 2014 Midokura SARL
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#disable IPv6 tests
sed -ri 's/ipv6_subnet_attributes = True/ipv6_subnet_attributes = False/g' /opt/stack/tempest/etc/tempest.conf
sed -ri 's/ipv6 = True/ipv6 = False/g' /opt/stack/tempest/etc/tempest.conf

PYTHONPATH=/opt/stack/tempest nosetests -vv \
tempest.api.network.test_networks \
tempest.api.network.test_ports \
tempest.api.network.test_networks_negative \
tempest.api.network.test_security_groups \
tempest.api.network.test_security_groups_negative \
tempest.scenario.test_network_advanced_server_ops \
tempest.scenario.test_network_basic_ops \
--with-xunit --xunit-file=${TEMPEST_XUNIT_FILE:-tempest-results.xml}
