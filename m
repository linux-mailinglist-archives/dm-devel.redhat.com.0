Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DE631219D90
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:20:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-DGbbdMeWNBCqk3RJETbCVg-1; Thu, 09 Jul 2020 06:20:26 -0400
X-MC-Unique: DGbbdMeWNBCqk3RJETbCVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C677107ACCA;
	Thu,  9 Jul 2020 10:20:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5547A1001B07;
	Thu,  9 Jul 2020 10:20:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8B6A93F8E;
	Thu,  9 Jul 2020 10:20:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AKGLB030214 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:20:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 53CD22156A59; Thu,  9 Jul 2020 10:20:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CD162166B28
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2C268007CB
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:20:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-462-fhs_5fqtNXeYdeoKjugbwQ-1;
	Thu, 09 Jul 2020 06:20:09 -0400
X-MC-Unique: fhs_5fqtNXeYdeoKjugbwQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1AACDB080;
	Thu,  9 Jul 2020 10:20:08 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:19:52 +0200
Message-Id: <20200709101952.7285-5-mwilck@suse.com>
In-Reply-To: <20200709101952.7285-1-mwilck@suse.com>
References: <20200709101952.7285-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AKGLB030214
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 39/39] libmultipath: increase log level of
	limiting dev_loss_tmo
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Users who aren't familar with the complex dependencies between
dev_loss_tmo, no_path_retry, and fast_io_fail may be confused
if their settings aren't applied. Print this log message at the
default level.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index c00af7e..e26aae2 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -651,7 +651,7 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 		}
 	} else if (mpp->dev_loss > DEFAULT_DEV_LOSS_TMO &&
 		mpp->no_path_retry != NO_PATH_RETRY_QUEUE) {
-		condlog(3, "%s: limiting dev_loss_tmo to %d, since "
+		condlog(2, "%s: limiting dev_loss_tmo to %d, since "
 			"fast_io_fail is not set",
 			rport_id, DEFAULT_DEV_LOSS_TMO);
 		mpp->dev_loss = DEFAULT_DEV_LOSS_TMO;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

