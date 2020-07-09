Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 61D1E219DFB
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-qABAUJ6mPwGj2Qnm_s9__g-1; Thu, 09 Jul 2020 06:36:57 -0400
X-MC-Unique: qABAUJ6mPwGj2Qnm_s9__g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523FA108E;
	Thu,  9 Jul 2020 10:36:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD25A512FE;
	Thu,  9 Jul 2020 10:36:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A2EC93F81;
	Thu,  9 Jul 2020 10:36:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069Aal2c031565 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28B112156A59; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D8C52157F24
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F016A8007C9
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-84-E3wslXh4Obu9XBYySdkCww-1;
	Thu, 09 Jul 2020 06:36:42 -0400
X-MC-Unique: E3wslXh4Obu9XBYySdkCww-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B0366AE65;
	Thu,  9 Jul 2020 10:36:40 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:13 +0200
Message-Id: <20200709103623.8302-3-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069Aal2c031565
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 44/54] libmultipath: adopt_paths(): don't bail
	out on single path failure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If pathinfo fails for one path to be adopted, we currently
fail the entire function. This may cause ev_add_path() for a valid
path to fail because some other path is broken. Fix it by just
skipping paths that don't look healthy.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 55fca9b..bc47d1e 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -75,16 +75,20 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
 			if (!mpp->paths && !(mpp->paths = vector_alloc()))
 				return 1;
 
-			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
-			    store_path(mpp->paths, pp))
-					return 1;
 			conf = get_multipath_config();
 			pthread_cleanup_push(put_multipath_config, conf);
 			ret = pathinfo(pp, conf,
 				       DI_PRIO | DI_CHECKER);
 			pthread_cleanup_pop(1);
-			if (ret)
-				return 1;
+			if (ret) {
+				condlog(3, "%s: pathinfo failed for %s",
+					__func__, pp->dev);
+				continue;
+			}
+
+			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
+			    store_path(mpp->paths, pp))
+					return 1;
 		}
 	}
 	return 0;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

