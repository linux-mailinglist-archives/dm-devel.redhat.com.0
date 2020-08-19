Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 61576249F66
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 15:18:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-kM8RA5crOzaO4jtBuZU1CA-1; Wed, 19 Aug 2020 09:18:53 -0400
X-MC-Unique: kM8RA5crOzaO4jtBuZU1CA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D40100CA95;
	Wed, 19 Aug 2020 13:18:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E0116597;
	Wed, 19 Aug 2020 13:18:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2672662B0;
	Wed, 19 Aug 2020 13:18:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JDIjpw020925 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 09:18:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 044DF2166BDD; Wed, 19 Aug 2020 13:18:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0052C2166BB3
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB8F5800CAF
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-294-8pRZxrKHMgmgKVStXSt40Q-1;
	Wed, 19 Aug 2020 09:18:39 -0400
X-MC-Unique: 8pRZxrKHMgmgKVStXSt40Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 90704ACF2;
	Wed, 19 Aug 2020 13:19:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 19 Aug 2020 15:18:18 +0200
Message-Id: <20200819131819.13493-4-mwilck@suse.com>
In-Reply-To: <20200819131819.13493-1-mwilck@suse.com>
References: <20200819131819.13493-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07JDIjpw020925
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 86/87] libmultipath: adopt_paths(): set
	pp->mpp only on success
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Make sure that pp->mpp is only set for paths that have been
successfully added to mpp->paths.

Suggested-by: Benjamin Marzinki <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 2d85df9..cc2dafa 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -248,14 +248,10 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
 					pp->dev, mpp->alias);
 				continue;
 			}
-			pp->mpp = mpp;
 			if (pp->initialized == INIT_REMOVED)
 				continue;
-			condlog(3, "%s: ownership set to %s",
-				pp->dev, mpp->alias);
-
 			if (!mpp->paths && !(mpp->paths = vector_alloc()))
-				return 1;
+				goto err;
 
 			conf = get_multipath_config();
 			pthread_cleanup_push(put_multipath_config, conf);
@@ -270,10 +266,17 @@ int adopt_paths(vector pathvec, struct multipath *mpp)
 
 			if (!find_path_by_devt(mpp->paths, pp->dev_t) &&
 			    store_path(mpp->paths, pp))
-					return 1;
+				goto err;
+
+			pp->mpp = mpp;
+			condlog(3, "%s: ownership set to %s",
+				pp->dev, mpp->alias);
 		}
 	}
 	return 0;
+err:
+	condlog(1, "error setting ownership of %s to %s", pp->dev, mpp->alias);
+	return 1;
 }
 
 void orphan_path(struct path *pp, const char *reason)
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

