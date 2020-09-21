Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B13D8273AFB
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 08:32:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-tjfaD04sO2Oq3mdKAyu29Q-1; Tue, 22 Sep 2020 02:32:53 -0400
X-MC-Unique: tjfaD04sO2Oq3mdKAyu29Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE31110059A2;
	Tue, 22 Sep 2020 06:32:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EEF660BF4;
	Tue, 22 Sep 2020 06:32:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 889AA44A46;
	Tue, 22 Sep 2020 06:32:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08LDQBDn023331 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 09:26:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A04542028DC0; Mon, 21 Sep 2020 13:26:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C0212024508
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 13:26:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A38285828E
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 13:26:09 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-198-TMGxua5VM3GUFLY7juR_5Q-1; Mon, 21 Sep 2020 09:26:06 -0400
X-MC-Unique: TMGxua5VM3GUFLY7juR_5Q-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 395306C370E3AD7EAC4E;
	Mon, 21 Sep 2020 21:09:52 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 21 Sep 2020 21:09:46 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	<dm-devel@redhat.com>
Date: Mon, 21 Sep 2020 21:10:10 +0800
Message-ID: <20200921131010.91236-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08LDQBDn023331
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 22 Sep 2020 02:32:23 -0400
Cc: linux-kernel@vger.kernel.org, Qinglang Miao <miaoqinglang@huawei.com>
Subject: [dm-devel] [PATCH -next] dm bufio: simplify the return expression
	of skip_metadata()
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

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/md/dm-snap-persistent.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
index 63fab7c76..74b483fed 100644
--- a/drivers/md/dm-snap-persistent.c
+++ b/drivers/md/dm-snap-persistent.c
@@ -284,16 +284,11 @@ static void skip_metadata(struct pstore *ps)
  */
 static int area_io(struct pstore *ps, int op, int op_flags)
 {
-	int r;
 	chunk_t chunk;
 
 	chunk = area_location(ps, ps->current_area);
 
-	r = chunk_io(ps, ps->area, chunk, op, op_flags, 0);
-	if (r)
-		return r;
-
-	return 0;
+	return chunk_io(ps, ps->area, chunk, op, op_flags, 0);
 }
 
 static void zero_memory_area(struct pstore *ps)
-- 
2.23.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

