Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D37BB30CDED
	for <lists+dm-devel@lfdr.de>; Tue,  2 Feb 2021 22:28:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-_5t5L8OEOMW84uWdI-gmMw-1; Tue, 02 Feb 2021 16:28:14 -0500
X-MC-Unique: _5t5L8OEOMW84uWdI-gmMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EEE1108C28E;
	Tue,  2 Feb 2021 21:28:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF18060C6B;
	Tue,  2 Feb 2021 21:28:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9085950039;
	Tue,  2 Feb 2021 21:28:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 112LRoqM015477 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Feb 2021 16:27:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 635691018D5A; Tue,  2 Feb 2021 21:27:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F79D106567B
	for <dm-devel@redhat.com>; Tue,  2 Feb 2021 21:27:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC806187504F
	for <dm-devel@redhat.com>; Tue,  2 Feb 2021 21:27:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-35-z2d46C3UNbyVV9ixLxmOBA-1;
	Tue, 02 Feb 2021 16:27:43 -0500
X-MC-Unique: z2d46C3UNbyVV9ixLxmOBA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 99A63B0D2;
	Tue,  2 Feb 2021 21:27:41 +0000 (UTC)
From: mwilck@suse.com
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>, lixiaokeng@huawei.com
Date: Tue,  2 Feb 2021 22:27:29 +0100
Message-Id: <20210202212729.18442-4-mwilck@suse.com>
In-Reply-To: <20210202212729.18442-1-mwilck@suse.com>
References: <20210202212729.18442-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 112LRoqM015477
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 3/3] multipath -w: allow removing blacklisted
	paths
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

multipath should allow removing WWIDs of paths even if they
are blacklisted.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 3263bb0..598efe0 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1441,7 +1441,7 @@ static int _get_refwwid(enum mpath_cmds cmd, const char *dev,
 				return ret;
 			}
 		}
-		if (pp->udev && pp->uid_attribute &&
+		if (flags & DI_BLACKLIST &&
 		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
 			return PATHINFO_SKIPPED;
 		refwwid = pp->wwid;
@@ -1466,7 +1466,7 @@ static int _get_refwwid(enum mpath_cmds cmd, const char *dev,
 				refwwid = dev;
 		}
 
-		if (refwwid && strlen(refwwid) &&
+		if (flags & DI_BLACKLIST && refwwid && strlen(refwwid) &&
 		    filter_wwid(conf->blist_wwid, conf->elist_wwid, refwwid,
 				NULL) > 0)
 			return PATHINFO_SKIPPED;
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

