Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB7943339C4
	for <lists+dm-devel@lfdr.de>; Wed, 10 Mar 2021 11:16:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-8D1J9q6iOv-7VW0QXBcmhw-1; Wed, 10 Mar 2021 05:16:32 -0500
X-MC-Unique: 8D1J9q6iOv-7VW0QXBcmhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0527519067E5;
	Wed, 10 Mar 2021 10:16:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65DD319C48;
	Wed, 10 Mar 2021 10:16:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40FE31809C86;
	Wed, 10 Mar 2021 10:16:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12AAG1ST003624 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 05:16:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6852208C6CF; Wed, 10 Mar 2021 10:16:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C01E3208C6CD
	for <dm-devel@redhat.com>; Wed, 10 Mar 2021 10:15:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54AAF185A7BC
	for <dm-devel@redhat.com>; Wed, 10 Mar 2021 10:15:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-159-FB67dq6YMQ2muDPK0_WFNg-1;
	Wed, 10 Mar 2021 05:15:54 -0500
X-MC-Unique: FB67dq6YMQ2muDPK0_WFNg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 16CA7AC24;
	Wed, 10 Mar 2021 10:15:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 10 Mar 2021 11:15:38 +0100
Message-Id: <20210310101538.25289-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 12AAG1ST003624
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] multipath -U: reduce log level of "adding new
	path" message
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The message

    3600a098000aad73f00000a3f5a275dc8: adding new path sdc

was meant to warn users in cases where multipathd hadn't obtained
information about a path device from udev, and found it later
in some multipath map. In regular operation, this may indicate
a problem with the udev db, stuck udev workers, or some race
between udev and multipathd. It could also be a normal situation,
e.g. after switching from the initrd to the root FS.

However, there's one mode of operation where this situation is normal:
the "check usable paths" mode (-C/-U). For performance reasons, multipath
doesn't do a full path discovery in this mode. It just reads the given
map. Thus encountering paths which aren't in pathvec is totally normal,
and will cause the above message for every path on every uevent for
a multipath device, which is highly confusing for users.

Reduce the log level of this message to 3. I think that's sufficient.
The reason I'd set it originall to level 2 was mainly that when I
worked on that code, I really didn't want to miss any of these messages.
---
 libmultipath/structs_vec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 47b1d03..57cd88a 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -192,7 +192,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 						must_reload = true;
 						continue;
 					}
-					condlog(2, "%s: adding new path %s",
+					condlog(3, "%s: adding new path %s",
 						mpp->alias, pp->dev);
 					store_path(pathvec, pp);
 					pp->tick = 1;
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

