Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8B32C315199
	for <lists+dm-devel@lfdr.de>; Tue,  9 Feb 2021 15:31:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-5c4Up5jAMIqADwOL3VFKCg-1; Tue, 09 Feb 2021 09:31:31 -0500
X-MC-Unique: 5c4Up5jAMIqADwOL3VFKCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A11D192AB83;
	Tue,  9 Feb 2021 14:31:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D275D747;
	Tue,  9 Feb 2021 14:31:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A25FF58076;
	Tue,  9 Feb 2021 14:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 119EVKwd029118 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Feb 2021 09:31:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 007912026D14; Tue,  9 Feb 2021 14:31:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFEEF2026D36
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 14:31:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCF08856F68
	for <dm-devel@redhat.com>; Tue,  9 Feb 2021 14:31:19 +0000 (UTC)
Received: from mx2.veeam.com (mx2.veeam.com [64.129.123.6]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-493-Ii7l9LBpNEe2KIXzOrxcuQ-1;
	Tue, 09 Feb 2021 09:31:17 -0500
X-MC-Unique: Ii7l9LBpNEe2KIXzOrxcuQ-1
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.veeam.com (Postfix) with ESMTPS id 6AF154141F;
	Tue,  9 Feb 2021 09:31:14 -0500 (EST)
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
	prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.721.2; Tue, 9 Feb 2021 15:30:53 +0100
From: Sergei Shtepa <sergei.shtepa@veeam.com>
To: <Damien.LeMoal@wdc.com>, <snitzer@redhat.com>, <hare@suse.de>,
	<ming.lei@redhat.com>, <agk@redhat.com>, <corbet@lwn.net>,
	<axboe@kernel.dk>, <jack@suse.cz>, <johannes.thumshirn@wdc.com>,
	<gregkh@linuxfoundation.org>, <koct9i@gmail.com>, <steve@sk2.org>,
	<dm-devel@redhat.com>, <linux-block@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 9 Feb 2021 17:30:28 +0300
Message-ID: <1612881028-7878-7-git-send-email-sergei.shtepa@veeam.com>
In-Reply-To: <1612881028-7878-1-git-send-email-sergei.shtepa@veeam.com>
References: <1612881028-7878-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
	(172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D265617465
X-Veeam-MMEX: True
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
Cc: pavel.tide@veeam.com, sergei.shtepa@veeam.com
Subject: [dm-devel] [PATCH v5 6/6] docs: device-mapper: 'noexcl' option for
	dm-linear
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

New 'noexcl' option allow to open underlying block-device
without FMODE_EXCL flag.

Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
---
 .../admin-guide/device-mapper/linear.rst      | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/linear.rst b/Documentation/admin-guide/device-mapper/linear.rst
index 9d17fc6e64a9..f035cd7ad78c 100644
--- a/Documentation/admin-guide/device-mapper/linear.rst
+++ b/Documentation/admin-guide/device-mapper/linear.rst
@@ -6,12 +6,22 @@ Device-Mapper's "linear" target maps a linear range of the Device-Mapper
 device onto a linear range of another device.  This is the basic building
 block of logical volume managers.
 
-Parameters: <dev path> <offset>
+Parameters: <dev path> <offset> [<options>]
     <dev path>:
-	Full pathname to the underlying block-device, or a
+        Full pathname to the underlying block-device, or a
         "major:minor" device-number.
     <offset>:
-	Starting sector within the device.
+        Starting sector within the device.
+    <options>:
+        Options allow to set the exclusivity mode. The exclusivity mode
+        can be 'excl' and 'noexcl'. By default, then options is not set,
+        the 'excl' mode is used. 'noexcl' mode allow to open device
+        without FMODE_EXCL flag. This allow to create liner device with
+        underlying block-device that are already used by the system. For
+        example, the file system on this device is already mounted.
+        The 'noexcl' option should be used when creating dm devices that
+        will be used as acceptor when connecting the device mapper to an
+        existing block device with the 'dmsetup remap' command.
 
 
 Example scripts
@@ -61,3 +71,13 @@ Example scripts
   }
 
   `echo \"$table\" | dmsetup create $name`;
+
+::
+
+  #!/bin/sh
+  # Create linear device and remap all requests from the original device
+  # to new linear.
+  DEV=$1
+
+  echo "0 `blockdev --getsz $DEV` linear $DEV 0 noexcl" | dmsetup create dm-noexcl
+  dmsetup remap start dm-noexcl $DEV
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

