Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1E633F6C5
	for <lists+dm-devel@lfdr.de>; Wed, 17 Mar 2021 18:28:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-iDVXVzh-OFmtt2kLMzo_fg-1; Wed, 17 Mar 2021 13:28:16 -0400
X-MC-Unique: iDVXVzh-OFmtt2kLMzo_fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81380107B78C;
	Wed, 17 Mar 2021 17:28:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E2CB50DDB;
	Wed, 17 Mar 2021 17:28:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F3C04BB7C;
	Wed, 17 Mar 2021 17:28:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12HHRraP003204 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 13:27:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EEC301134CD7; Wed, 17 Mar 2021 17:27:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E69041134CBB
	for <dm-devel@redhat.com>; Wed, 17 Mar 2021 17:27:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AF7480080E
	for <dm-devel@redhat.com>; Wed, 17 Mar 2021 17:27:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-552-t2KYRvXONvmJF8aRLjayew-1;
	Wed, 17 Mar 2021 13:27:45 -0400
X-MC-Unique: t2KYRvXONvmJF8aRLjayew-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5371FAC1E;
	Wed, 17 Mar 2021 17:27:44 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 17 Mar 2021 18:27:27 +0100
Message-Id: <20210317172727.8364-2-mwilck@suse.com>
In-Reply-To: <20210317172727.8364-1-mwilck@suse.com>
References: <20210317172727.8364-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12HHRraP003204
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/2] 11-dm-mpath.rules: run "multipath -U" with
	-v1
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

In cases where some path devices are temporarily unavailable (e.g. failover),
high amounts of error messages such as these are seen:

Feb 27 08:02:03 ictm1608s02h1 multipath[1420]: get_udev_device: failed to look up 65:224 with type 1
Feb 27 08:02:03 ictm1608s02h1 multipath[1420]: 3600a098000aada210000f1625de51ed9: discarding non-existing path 65:224

This is because every invocation of "multipath -U" prints these messages
at the default log level (-v2). In the case of "multipath -U", these
messages aren't important, and in failover situations, "multipath -U" is
run pretty often, spamming the log with many similar messages.

Generally reducing the log level of these messages would be wrong,
because they are important for multipathd's operation, to verify that
multipathd does the right thing when discovering a discrepancy between the dm
state and the devices present in the system. Therefore, just decrease the
verbosity with which we invoke "multipath -U" in the udev rules.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/11-dm-mpath.rules | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
index cd522e8..d191ae8 100644
--- a/multipath/11-dm-mpath.rules
+++ b/multipath/11-dm-mpath.rules
@@ -32,7 +32,7 @@ ACTION=="add", ENV{.MPATH_DEVICE_READY_OLD}=="1", GOTO="paths_ok"
 
 # Check the map state directly with multipath -U.
 # This doesn't attempt I/O on the device.
-PROGRAM=="$env{MPATH_SBIN_PATH}/multipath -U %k", GOTO="paths_ok"
+PROGRAM=="$env{MPATH_SBIN_PATH}/multipath -U -v1 %k", GOTO="paths_ok"
 ENV{MPATH_DEVICE_READY}="0", GOTO="mpath_action"
 LABEL="paths_ok"
 
-- 
2.30.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

