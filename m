Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADB02428BC
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:34:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-fxSipok-MJuNdlAfduZxag-1; Wed, 12 Aug 2020 07:34:40 -0400
X-MC-Unique: fxSipok-MJuNdlAfduZxag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 206701007460;
	Wed, 12 Aug 2020 11:34:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F16DC60CCA;
	Wed, 12 Aug 2020 11:34:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D795181A07B;
	Wed, 12 Aug 2020 11:34:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBYVE5028587 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:34:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E82B2156A2E; Wed, 12 Aug 2020 11:34:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AC932166BA4
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:34:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D8C980015B
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:34:28 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-563-woNUaa_APb-sFKTL9zn6IA-1;
	Wed, 12 Aug 2020 07:34:24 -0400
X-MC-Unique: woNUaa_APb-sFKTL9zn6IA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B51FDAF0C;
	Wed, 12 Aug 2020 11:34:44 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:34:04 +0200
Message-Id: <20200812113405.26206-2-mwilck@suse.com>
In-Reply-To: <20200812113405.26206-1-mwilck@suse.com>
References: <20200812113405.26206-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBYVE5028587
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 40/42] libmultipath: free_multipath(): remove
	mpp references
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If free_paths is false, make sure no references to the dropped
multipath remain. Otherwise multipathd may crash later when
trying to access these.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index da898b7..d227ec0 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -258,6 +258,21 @@ free_multipath (struct multipath * mpp, enum free_path_mode free_paths)
 		mpp->dmi = NULL;
 	}
 
+	if (!free_paths && mpp->pg) {
+		struct pathgroup *pgp;
+		struct path *pp;
+		int i, j;
+
+		/*
+		 * Make sure paths carry no reference to this mpp any more
+		 */
+		vector_foreach_slot(mpp->pg, pgp, i) {
+			vector_foreach_slot(pgp->paths, pp, j)
+				if (pp->mpp == mpp)
+					pp->mpp = NULL;
+		}
+	}
+
 	free_pathvec(mpp->paths, free_paths);
 	free_pgvec(mpp->pg, free_paths);
 	FREE_PTR(mpp->mpcontext);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

