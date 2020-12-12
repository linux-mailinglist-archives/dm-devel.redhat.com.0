Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6C37A2D88E2
	for <lists+dm-devel@lfdr.de>; Sat, 12 Dec 2020 19:03:43 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-pHG6uHofMMq_CVROL055VA-1; Sat, 12 Dec 2020 13:03:40 -0500
X-MC-Unique: pHG6uHofMMq_CVROL055VA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAD8FCE64E;
	Sat, 12 Dec 2020 18:03:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5441071C86;
	Sat, 12 Dec 2020 18:03:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55DAB18095C7;
	Sat, 12 Dec 2020 18:03:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BCI3Kjl028736 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Dec 2020 13:03:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 67E9A2026D11; Sat, 12 Dec 2020 18:03:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E3C2026D47
	for <dm-devel@redhat.com>; Sat, 12 Dec 2020 18:03:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EA038007DF
	for <dm-devel@redhat.com>; Sat, 12 Dec 2020 18:03:17 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-21-N5Eh1aRZPFyNKDcpXrVmrA-1;
	Sat, 12 Dec 2020 13:03:15 -0500
X-MC-Unique: N5Eh1aRZPFyNKDcpXrVmrA-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7058B20B717A;
	Sat, 12 Dec 2020 10:03:13 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7058B20B717A
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, paul@paul-moore.com
Date: Sat, 12 Dec 2020 10:02:43 -0800
Message-Id: <20201212180251.9943-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: [dm-devel] [PATCH v9 0/8] IMA: support for measuring kernel
	integrity critical data
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

IMA measures files and buffer data such as keys, command-line arguments
passed to the kernel on kexec system call, etc. While these measurements
are necessary for monitoring and validating the integrity of the system,
they are not sufficient. Various data structures, policies, and states
stored in kernel memory also impact the integrity of the system.
Several kernel subsystems contain such integrity critical data -
e.g. LSMs like SELinux, AppArmor etc. or device-mapper targets like
dm-crypt, dm-verity, dm-integrity etc. These kernel subsystems help
protect the integrity of a device. Their integrity critical data is not
expected to change frequently during run-time. Some of these structures
cannot be defined as __ro_after_init, because they are initialized later.

For a given device, various external services/infrastructure tools
(including the attestation service) interact with it - both during the
setup and during rest of the device run-time. They share sensitive data
and/or execute critical workload on that device. The external services
may want to verify the current run-time state of the relevant kernel
subsystems before fully trusting the device with business critical
data/workload. For instance, verifying that SELinux is in "enforce" mode
along with the expected policy, disks are encrypted with a certain
configuration, secure boot is enabled etc.

This series provides the necessary IMA functionality for kernel
subsystems to ensure their configuration can be measured:
  - by kernel subsystems themselves,
  - in a tamper resistant way,
  - and re-measured - triggered on state/configuration change.

This patch set:
  - defines a new IMA hook ima_measure_critical_data() to measure
    integrity critical data,
  - limits the critical data being measured based on a label,
  - defines a builtin critical data measurement policy,
  - and includes an SELinux consumer of the new IMA critical data hook.

This series is based on the following repo/branch:

 repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 branch: next-integrity
 commit 207cdd565dfc ("ima: Don't modify file descriptor mode on the fly")

Change Log v9:
Incorporated feedback from Tyler on v8 of this series.
 - Moved rule->data_source logic from Patch #4 to Patch #5.
 - Removed unnecessary variable event_name from selinux_event_name()
   in Patch #8.


Change Log v8:
Incorporated feedback from Tyler on v7 of this series.
 - Removed unnecessary 'else' clauses in ima_match_rule_data().
 - Fixed ima_store_template() to pass the buffer hash in case the
   buffer is large.
 - fixed function description for ima_measure_critical_data().
 - Moved some usage of CRITICAL_DATA from Patch #3 to Patch #4.
 - Moved IMA_DATA_SOURCE from Patch #4 to Patch #5.
 - Removed unnecessary pr_err() from ima_measure_critical_data()
   and selinux_event_name().
 - Fixed log formatting in selinux_measure_state() to be consistent
   with other messages in that file.

Change Log v7:
Incorporated feedback from Mimi on v6 of this series.
 - Updated cover letter and patch descriptions as per Mimi's feedback.
 - Changed references to variable names and policy documentation from
   plural "data_sources" to singular "data_source".
 - Updated SELinux patch to measure only policy, instead of policy and
   state. The state measurement will be upstreamed through a separate
   patch.
 - Updated admin-guide/kernel-parameters.txt to document support for
   critical_data in builtin policy.

Change Log v6:
Incorporated feedback from Mimi on v5 of this series.
 - Got rid of patch 5 from the v5 of the series.(the allow list for data
   sources)
 - Updated function descriptions, changed variable names etc.
 - Moved the input param event_data_source in ima_measure_critical_data()
   to a new patch. (patch 6/8 of this series)
 - Split patch 4 from v5 of the series into two patches (patch 4/8 and 
   patch 5/8)
 - Updated cover letter and patch descriptions as per feedback.

Change Log v5:
(1) Incorporated feedback from Stephen on the last SeLinux patch.
 SeLinux Patch: https://patchwork.kernel.org/patch/11801585/
 - Freed memory in the reverse order of allocation in 
   selinux_measure_state().
 - Used scnprintf() instead of snprintf() to create the string for
   selinux state.
 - Allocated event name passed to ima_measure_critical_data() before
   gathering selinux state and policy information for measuring.

(2) Incorporated feedback from Mimi on v4 of this series.
 V4 of this Series: https://patchwork.kernel.org/project/linux-integrity/list/?series=354437

 - Removed patch "[v4,2/6] IMA: conditionally allow empty rule data"
 - Reversed the order of following patches.
      [v4,4/6] IMA: add policy to measure critical data from kernel components
      [v4,5/6] IMA: add hook to measure critical data from kernel components
   and renamed them to remove "from kernel components"
 - Added a new patch to this series - 
       IMA: add critical_data to built-in policy rules

 - Added the next version of SeLinux patch (mentioned above) to this
   series 
       selinux: measure state and hash of the policy using IMA

 - Updated cover-letter description to give broader perspective of the
   feature, rearranging paragraphs, removing unnecessary info, clarifying
   terms etc.
 - Got rid of opt_list param from ima_match_rule_data().
 - Updated the documentation to remove sources that don't yet exist.
 - detailed IMA hook description added to ima_measure_critical_data(),
   as well as elaborating terms event_name, event_data_source. 
 - "data_sources:=" is not a mandatory policy option for 
   func=CRITICAL_DATA anymore. If not present, all the data sources
   specified in __ima_supported_kernel_data_sources will be measured.


Lakshmi Ramasubramanian (2):
  IMA: define a builtin critical data measurement policy
  selinux: include a consumer of the new IMA critical data hook

Tushar Sugandhi (6):
  IMA: generalize keyring specific measurement constructs
  IMA: add support to measure buffer data hash
  IMA: define a hook to measure kernel integrity critical data
  IMA: add policy rule to measure critical data
  IMA: limit critical data measurement based on a label
  IMA: extend critical data hook to limit the measurement based on a
    label

 Documentation/ABI/testing/ima_policy          |   5 +-
 .../admin-guide/kernel-parameters.txt         |   5 +-
 include/linux/ima.h                           |   8 ++
 security/integrity/ima/ima.h                  |   8 +-
 security/integrity/ima/ima_api.c              |   8 +-
 security/integrity/ima/ima_appraise.c         |   2 +-
 security/integrity/ima/ima_asymmetric_keys.c  |   2 +-
 security/integrity/ima/ima_main.c             |  81 ++++++++++--
 security/integrity/ima/ima_policy.c           | 118 ++++++++++++++----
 security/integrity/ima/ima_queue_keys.c       |   3 +-
 security/selinux/Makefile                     |   2 +
 security/selinux/include/security.h           |  11 +-
 security/selinux/measure.c                    |  79 ++++++++++++
 security/selinux/ss/services.c                |  71 +++++++++--
 14 files changed, 352 insertions(+), 51 deletions(-)
 create mode 100644 security/selinux/measure.c

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

