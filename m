Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F2CD0276BF2
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:31:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-MeD4oyu9MTWG5wUC4xUvdw-1; Thu, 24 Sep 2020 04:31:22 -0400
X-MC-Unique: MeD4oyu9MTWG5wUC4xUvdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D013802EA4;
	Thu, 24 Sep 2020 08:31:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77CA955784;
	Thu, 24 Sep 2020 08:31:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D9B7181A06C;
	Thu, 24 Sep 2020 08:31:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08NJKPT8024846 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 15:20:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E3BE107136; Wed, 23 Sep 2020 19:20:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07BADF49C7
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 19:20:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF07818029CE
	for <dm-devel@redhat.com>; Wed, 23 Sep 2020 19:20:22 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-463-wtQ35TdBOKWgPEjReQex0Q-1;
	Wed, 23 Sep 2020 15:20:20 -0400
X-MC-Unique: wtQ35TdBOKWgPEjReQex0Q-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id B023520B7179;
	Wed, 23 Sep 2020 12:20:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B023520B7179
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
Date: Wed, 23 Sep 2020 12:20:05 -0700
Message-Id: <20200923192011.5293-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 04:31:06 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: [dm-devel] [PATCH v4 0/6] IMA: Infrastructure for measurement of
	critical kernel data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are several kernel components that contain critical data which if
accidentally or maliciously altered, can compromise the security of the
kernel. Example of such components would include LSMs like SELinux, or
AppArmor; or device-mapper targets like dm-crypt, dm-verity etc.

Many of these components do not use the capabilities provided by kernel
integrity subsystem (IMA), and thus they don't use the benefits of
extended TPM PCR quotes and ultimately the benefits of remote attestation.

This series bridges this gap, so that potential kernel components that
contain data critical to the security of the kernel could take advantage
of IMA's measuring and quoting abilities - thus ultimately enabling
remote attestation for their specific data.

System administrators may want to pick and choose which kernel
components they would want to enable for measurements, quoting, and
remote attestation. To enable that, a new IMA policy is introduced.

And lastly, the functionality is exposed through a function
ima_measure_critical_data(). The functionality is generic enough to
measure the data of any kernel component at run-time. To ensure that
only data from supported sources are measured, the kernel component
needs to be added to a compile-time list of supported sources (an
"allowed list of components"). IMA validates the source passed to
ima_measure_critical_data() against this allowed list at run-time.

This series is based on the following repo/branch:

 repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 branch: next-integrity
 commit aa662fc04f5b ("ima: Fix NULL pointer dereference in ima_file_hash")
        
Change Log v4:
Incorporated feedback from Mimi on v3.
 - Split patch #1 into two patches to move introduction of bool
   allow_empty_opt_list into the 2nd patch.
 - Reverted return type of process_buffer_measurement() from int to void
   which got rid of patch #2 from the v3 of the series.
 - Renamed the policy "critical_kernel_data_sources" to "data_sources".
 - Updated process_buffer_measurement() to avoid code and variable
   duplication in the if(measure_buf_hash) block.
 - Changed return type of ima_measure_critical_data() from int to void.
 - Updated patch description for patch #3 and #4 as per Mimi's feedback.

Change Log v3:
Incorporated feedback from Mimi on v2.
 - Renamed the policy "data_sources" to
   "critical_kernel_data_sources".
 - Added "critical_kernel_data_sources" description in
   Documentation/ima-policy.
 - Split CRITICAL_DATA + critical_kernel_data_sources into two separate
   patches.
 - Merged hook ima_measure_critical_data() + CRITICAL_DATA into a single
   patch.
 - Added functionality to validate data sources before measurement.

Change Log v2:
 - Reverted the unnecessary indentations in existing #define.
 - Updated the description to replace the word 'enlightened' with
   'supported'.
 - Reverted the unnecessary rename of attribute size to buf_len.
 - Introduced a boolean parameter measure_buf_hash as per community
   feedback to support measuring hash of the buffer, instead of the
   buffer itself.


Tushar Sugandhi (6):
  IMA: generalize keyring specific measurement constructs
  IMA: conditionally allow empty rule data
  IMA: update process_buffer_measurement to measure buffer hash
  IMA: add policy to measure critical data from kernel components
  IMA: add hook to measure critical data from kernel components
  IMA: validate supported kernel data sources before measurement

 Documentation/ABI/testing/ima_policy         |  11 +-
 include/linux/ima.h                          |   8 ++
 security/integrity/ima/ima.h                 |  37 ++++++-
 security/integrity/ima/ima_api.c             |   8 +-
 security/integrity/ima/ima_appraise.c        |   2 +-
 security/integrity/ima/ima_asymmetric_keys.c |   2 +-
 security/integrity/ima/ima_main.c            |  61 ++++++++++-
 security/integrity/ima/ima_policy.c          | 101 +++++++++++++++----
 security/integrity/ima/ima_queue_keys.c      |   3 +-
 9 files changed, 196 insertions(+), 37 deletions(-)

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

