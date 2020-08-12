Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 58A442428D0
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-fv2cj58aO7e6u_El2BumFw-1; Wed, 12 Aug 2020 07:36:25 -0400
X-MC-Unique: fv2cj58aO7e6u_El2BumFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4496D8027E9;
	Wed, 12 Aug 2020 11:36:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2F03107B84D;
	Wed, 12 Aug 2020 11:36:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E2EE181A07C;
	Wed, 12 Aug 2020 11:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBaGma028992 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:36:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF1A610EE999; Wed, 12 Aug 2020 11:36:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B947410F1C1F
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51029918661
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:16 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-405-0jc39MpQNr-ElguzmgnTlQ-1;
	Wed, 12 Aug 2020 07:36:13 -0400
X-MC-Unique: 0jc39MpQNr-ElguzmgnTlQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 12975B714;
	Wed, 12 Aug 2020 11:36:33 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:59 +0200
Message-Id: <20200812113601.26658-3-mwilck@suse.com>
In-Reply-To: <20200812113601.26658-1-mwilck@suse.com>
References: <20200812113601.26658-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBaGma028992
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH v2 82/84] libmultipath: free pp if store_path
	fails in disassemble_map
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Zhiqiang Liu <liuzhiqiang26@huawei.com>

In disassemble_map func, one pp will be allocated and stored in
pgp->paths. However, if store_path fails, pp will not be freed,
then memory leak problem occurs.

Here, we will call free_path to free pp when store_path fails.

Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dmparser.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 25e6a4a..c103161 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -306,11 +306,15 @@ int disassemble_map(const struct _vector *pathvec,
 					goto out1;
 
 				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
-			}
-			FREE(word);
 
-			if (store_path(pgp->paths, pp))
-				goto out;
+				if (store_path(pgp->paths, pp)) {
+					free_path(pp);
+					goto out1;
+				}
+			} else if (store_path(pgp->paths, pp))
+				goto out1;
+
+			FREE(word);
 
 			pgp->id ^= (long)pp;
 			pp->pgindex = i + 1;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

