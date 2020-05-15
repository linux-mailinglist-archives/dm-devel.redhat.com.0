Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6401D7362
	for <lists+dm-devel@lfdr.de>; Mon, 18 May 2020 11:00:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589792400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qzScjc6GnHFbSUGknoBwcaIhfABPfAF4V0LOKgB8pPQ=;
	b=JKPWovwE44w2mAA6x1hTybJaRgxNRn3VNcEboAs0nYitB163AC2fQ/Fk9GvK6Z/gjMAKuM
	bg/Y/ElWNUv1QzquN4Up7gBAIKVqZiYttSQ+JOsoWdvFtNC18TEsKLTw7uYrLcVcUJEkxo
	JJlWHLfACMeXpu6DpB21Fiwe7EtZ+DM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-WRFbB7ZKNa-r_y4Ezhe4aQ-1; Mon, 18 May 2020 04:59:58 -0400
X-MC-Unique: WRFbB7ZKNa-r_y4Ezhe4aQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31BAB18FE872;
	Mon, 18 May 2020 08:59:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8717F79587;
	Mon, 18 May 2020 08:59:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A8314ED38;
	Mon, 18 May 2020 08:59:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FA5gA8013008 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 06:05:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2859C20110C9; Fri, 15 May 2020 10:05:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06DBE202B170
	for <dm-devel@redhat.com>; Fri, 15 May 2020 10:05:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C00EB800580
	for <dm-devel@redhat.com>; Fri, 15 May 2020 10:05:39 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
	by relay.mimecast.com with ESMTP id us-mta-423-zI-NsrS2NCyCh0rLZp3xXA-1;
	Fri, 15 May 2020 06:05:35 -0400
X-MC-Unique: zI-NsrS2NCyCh0rLZp3xXA-1
X-UUID: 7088b99243a04af7a18c84445ff11d5e-20200515
X-UUID: 7088b99243a04af7a18c84445ff11d5e-20200515
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 1026002086; Fri, 15 May 2020 18:05:31 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
	mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server
	(TLS) id 15.0.1497.2; Fri, 15 May 2020 18:05:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
	Frontend Transport; Fri, 15 May 2020 18:05:26 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	<dm-devel@redhat.com>
Date: Fri, 15 May 2020 18:05:28 +0800
Message-ID: <20200515100528.14341-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 704E7B1D95B5A2015993205326258A150957E452D2B16B36C86F62849D97192C2000:8
X-MTK: N
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04FA5gA8013008
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 18 May 2020 04:59:34 -0400
Cc: Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: [dm-devel] [PATCH] dm: replace strncpy() with strscpy()
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace strncpy() with strscpy() to guarantee a NULL-terminated
string.

Detected by Coverity.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/md/dm-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index ac83f5002ce5..4dc3658e3351 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1167,7 +1167,7 @@ static void retrieve_status(struct dm_table *table,
 		spec->status = 0;
 		spec->sector_start = ti->begin;
 		spec->length = ti->len;
-		strncpy(spec->target_type, ti->type->name,
+		strscpy(spec->target_type, ti->type->name,
 			sizeof(spec->target_type));
 
 		outptr += sizeof(struct dm_target_spec);
-- 
2.18.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

