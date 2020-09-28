Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A04527BE75
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-0KqeNeipOg-XDC6b2sX7IA-1; Tue, 29 Sep 2020 03:55:27 -0400
X-MC-Unique: 0KqeNeipOg-XDC6b2sX7IA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14607425D7;
	Tue, 29 Sep 2020 07:55:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91F8660BF1;
	Tue, 29 Sep 2020 07:55:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 870A744A58;
	Tue, 29 Sep 2020 07:55:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08S3uQF8004548 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Sep 2020 23:56:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78A822166BA4; Mon, 28 Sep 2020 03:56:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73B7B2166B44
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 03:56:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42FD4811E78
	for <dm-devel@redhat.com>; Mon, 28 Sep 2020 03:56:24 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-377-f4q25FL9PTap-u6pWqnqAQ-1;
	Sun, 27 Sep 2020 23:56:20 -0400
X-MC-Unique: f4q25FL9PTap-u6pWqnqAQ-1
Received: from tusharsu-Ubuntu.lan (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id BCECB20B7178;
	Sun, 27 Sep 2020 20:56:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BCECB20B7178
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
To: zohar@linux.ibm.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com, pvorel@suse.cz
Date: Sun, 27 Sep 2020 20:56:03 -0700
Message-Id: <20200928035605.22701-1-tusharsu@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Cc: nramas@linux.microsoft.com, linux-integrity@vger.kernel.org,
	dm-devel@redhat.com, ltp@lists.linux.it
Subject: [dm-devel] [PATCH v2 0/2] IMA: Add test for dm-crypt measurement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

New functionality is being added to IMA to measure data provided by
kernel components. With this feature, IMA policy can be set to enable
measuring data provided by device-mapper targets. Currently one such
device-mapper target - dm-crypt, is being updated to use this
functionality. This new functionality needs test automation in LTP.

Some of the existing functionality in ima_keys.sh can be reused for
this, but it needs to be refactored into generic functions first.

Add a testcase which verifies that the IMA subsystem correctly measures
the data coming from a device-mapper target - dm-crypt.
Refactor common functionality in ima_keys.sh for this, and move the
generic functions to ima_setup.sh.

This series needs a kernel built on the following repo/branch/patches:
 repo: https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
 branch: next-integrity
 commit aa662fc04f5b ("ima: Fix NULL pointer dereference in ima_file_hash")

And the following patch series should be applied in the following order:
 1. https://patchwork.kernel.org/patch/11795559/
 2. https://patchwork.kernel.org/patch/11801525/
 3. https://patchwork.kernel.org/patch/11743715/

Change Log v2:
Incorporated feedback from Petr Vorel on v1.
 - Updated TST_NEEDS_CMDS to correctly reflects commands used in tests.
 - Removed unnecessary debugging info.
 - Refactored common functionality in ima_keys.sh, and moved the generic
   functions to ima_setup.sh.
 - Removed the use of eval, and replaced it with the recommended ROD()
   function.
 - All temporary files now get created under $TST_TMPDIR, instead of
   current directory.
 - Removed unnecessary TFAIL, to avoid double counting failures.
 - Updated log messages to be consistent.
 - Moved code to cleanup() to avoid code duplication.

Tushar Sugandhi (2):
  IMA: generalize key measurement tests
  IMA: Add test for dm-crypt measurement

 runtest/ima                                   |  1 +
 .../kernel/security/integrity/ima/README.md   | 20 +++++
 .../integrity/ima/tests/ima_dm_crypt.sh       | 60 ++++++++++++++
 .../security/integrity/ima/tests/ima_keys.sh  | 62 +++------------
 .../security/integrity/ima/tests/ima_setup.sh | 79 +++++++++++++++++++
 5 files changed, 173 insertions(+), 49 deletions(-)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

