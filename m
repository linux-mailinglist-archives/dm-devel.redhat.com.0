Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1570624E26E
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 23:10:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-083vTuWOOHuSDUoajX9-Mg-1; Fri, 21 Aug 2020 17:10:11 -0400
X-MC-Unique: 083vTuWOOHuSDUoajX9-Mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9047681F036;
	Fri, 21 Aug 2020 21:10:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 551587E32F;
	Fri, 21 Aug 2020 21:10:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 883C1662CF;
	Fri, 21 Aug 2020 21:09:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LILOcA003754 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 14:21:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0EBA2117A977; Fri, 21 Aug 2020 18:21:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AEC5117A976
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 18:21:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C249F101AA40
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 18:21:21 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-236-2yd7AMnhPyWiO1qYIQ1xJw-1;
	Fri, 21 Aug 2020 14:21:18 -0400
X-MC-Unique: 2yd7AMnhPyWiO1qYIQ1xJw-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 947F020B4908;
	Fri, 21 Aug 2020 11:21:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 947F020B4908
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
Date: Fri, 21 Aug 2020 11:21:04 -0700
Message-Id: <20200821182107.5328-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Aug 2020 17:09:44 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: [dm-devel] [PATCH v2 0/3] IMA: Infrastructure for measurement of
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
X-Mimecast-Spam-Score: 0.002
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
measure the data of any kernel component at run-time.

This series is based on the following repo/branch:
 repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 branch: next-integrity

This series also has a dependency on the following patch series:
 https://patchwork.kernel.org/patch/11709527/

Change Log v2:
 - Reverted the unnecessary indentations in existing #define.
 - Updated the description to replace the word 'enlightened' with
   'supported'.
 - Reverted the unnecessary rename of attribute size to buf_len.
 - Introduced a boolean parameter measure_buf_hash as per community
   feedback to support measuring hash of the buffer, instead of the
   buffer itself.

Tushar Sugandhi (3):
  IMA: generalize keyring specific measurement constructs
  IMA: add policy to support measuring critical data from kernel
    components
  IMA: define IMA hook to measure critical data from kernel components

 Documentation/ABI/testing/ima_policy         |   6 +-
 include/linux/ima.h                          |  11 ++
 security/integrity/ima/ima.h                 |  12 ++-
 security/integrity/ima/ima_api.c             |   8 +-
 security/integrity/ima/ima_appraise.c        |   2 +-
 security/integrity/ima/ima_asymmetric_keys.c |   2 +-
 security/integrity/ima/ima_main.c            |  69 +++++++++++--
 security/integrity/ima/ima_policy.c          | 100 +++++++++++++++----
 security/integrity/ima/ima_queue_keys.c      |   3 +-
 9 files changed, 167 insertions(+), 46 deletions(-)

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

