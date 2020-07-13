Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 14EC921D48B
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 13:08:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-ZSJbdjv1NtOPG58F-PhCgw-1; Mon, 13 Jul 2020 07:08:34 -0400
X-MC-Unique: ZSJbdjv1NtOPG58F-PhCgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F1851081;
	Mon, 13 Jul 2020 11:08:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F01681000235;
	Mon, 13 Jul 2020 11:08:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE60C72F79;
	Mon, 13 Jul 2020 11:08:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DB8DLb016435 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 07:08:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 642F92157F26; Mon, 13 Jul 2020 11:08:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FF142157F24
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 770D3924902
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-364-B86-2AJuM4a-Cfamy0U-Iw-1;
	Mon, 13 Jul 2020 07:08:07 -0400
X-MC-Unique: B86-2AJuM4a-Cfamy0U-Iw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 47B5AB1A3;
	Mon, 13 Jul 2020 11:08:08 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <lixiaokeng@huawei.com>
Date: Mon, 13 Jul 2020 13:07:43 +0200
Message-Id: <20200713110743.26329-5-mwilck@suse.com>
In-Reply-To: <20200713110743.26329-1-mwilck@suse.com>
References: <20200713110743.26329-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DB8DLb016435
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 4/4] libmultipath: fix mpp->hwe handling in
	sync_paths()
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This is anologous to

1f96269 ("multipathd: fix mpp->hwe handling on path removal")
f6839eb ("multipathd: fix mpp->hwe handling when paths are freed")

When paths are removed from a map, we need to make sure that
mpp->hwe doesn't become stale.

Reported-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs_vec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 0a73d2a..0519996 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -256,6 +256,8 @@ void sync_paths(struct multipath *mpp, vector pathvec)
 		}
 		if (!found) {
 			condlog(3, "%s dropped path %s", mpp->alias, pp->dev);
+			if (mpp->hwe == pp->hwe)
+				mpp->hwe = NULL;
 			vector_del_slot(mpp->paths, i--);
 			orphan_path(pp, "path removed externally");
 		}
@@ -263,6 +265,8 @@ void sync_paths(struct multipath *mpp, vector pathvec)
 	update_mpp_paths(mpp, pathvec);
 	vector_foreach_slot (mpp->paths, pp, i)
 		pp->mpp = mpp;
+	if (mpp->hwe == NULL)
+		extract_hwe_from_path(mpp);
 }
 
 int
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

