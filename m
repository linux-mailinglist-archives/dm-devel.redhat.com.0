Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5314321D489
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 13:08:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-zLUUinpFMUWmE09q2UFMgQ-1; Mon, 13 Jul 2020 07:08:34 -0400
X-MC-Unique: zLUUinpFMUWmE09q2UFMgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 579468027ED;
	Mon, 13 Jul 2020 11:08:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B0822DE72;
	Mon, 13 Jul 2020 11:08:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5823872F4B;
	Mon, 13 Jul 2020 11:08:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DB8Dip016433 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 07:08:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FB3630B9D; Mon, 13 Jul 2020 11:08:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B7FAE5B0D
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CA6C856A5E
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-321-g27cRWQ2OdaxptC4mR_pvw-1;
	Mon, 13 Jul 2020 07:08:07 -0400
X-MC-Unique: g27cRWQ2OdaxptC4mR_pvw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 134ECB1A2;
	Mon, 13 Jul 2020 11:08:08 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <lixiaokeng@huawei.com>
Date: Mon, 13 Jul 2020 13:07:42 +0200
Message-Id: <20200713110743.26329-4-mwilck@suse.com>
In-Reply-To: <20200713110743.26329-1-mwilck@suse.com>
References: <20200713110743.26329-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DB8Dip016433
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 3/4] libmultipath: warn about NULL value of
	mpp->hwe
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

mpp->hwe is only accessed in propsel.c. It may become unset if
all paths of the mpp have been deleted. Access to mpp->hwe in this
case should be avoided.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/propsel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 897e48c..92b0595 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -65,7 +65,9 @@ do {									\
 	__do_set_from_vec(struct hwentry, var, (src)->hwe, dest)
 
 #define do_set_from_hwe(var, src, dest, msg)				\
-	if (__do_set_from_hwe(var, src, dest)) {			\
+	if (!src->hwe) {						\
+		condlog(0, "BUG: do_set_from_hwe called with hwe == NULL"); \
+	} else if (__do_set_from_hwe(var, src, dest)) {			\
 		origin = msg;						\
 		goto out;						\
 	}
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

