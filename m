Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0A44F220949
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:53:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-v0Bo9IHBMwOPlBmGzmYH9g-1; Wed, 15 Jul 2020 05:52:47 -0400
X-MC-Unique: v0Bo9IHBMwOPlBmGzmYH9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB3D28027EE;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC77261462;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7180C180954D;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qTOG007911 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37C9F2156880; Wed, 15 Jul 2020 09:52:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31E6D2156A3B
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49F67858EE4
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:28 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-29-O4qf5QBtPl2DyeEnNesMNg-1; Wed, 15 Jul 2020 05:52:25 -0400
X-MC-Unique: O4qf5QBtPl2DyeEnNesMNg-1
IronPort-SDR: aORw0zR6oHTs9IFAcBtWZhXwrWX3Nz6HeA3Wf6y4ZKG0pYCl8TTmT1uFj0T4IQB4EJWdda1dwM
	J9on3LjLqByTVqv5ditA6VKCildhJYgQ8gmpItLz7JPwH0UFJfuN/kNUbLeU9kiVhdLV7nGo86
	uiL+xDvtoTIrmnx8prD8JvNnFwrpyNkNOJj5gGm6qXI8QIX7BkyhNhDmfrVXzE4FkDKnoYTyCM
	Z0X3382gH82Go9VxzQrs6OmNo0F5MPK4uX4l1F5vJhgmyBLiQ+6D2Q/RYD33XoFp0RYBTCNpfu
	9Jw=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769676"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:24 +0800
IronPort-SDR: /a0UCTq7UhoLlgwtLpBYrCSpQscW+FxUwlw0FFTNhovCxgPv+051BDWlSPV971w5UoSjDSlfr2
	l5BQ+Wqvz3mixfH67FJUCJ1Z1drUB1n7s=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:18 -0700
IronPort-SDR: CAsc+zHHqt+MxpFqyNP4/YtzZuKrUF7Ud2oqBvSxqsbKv5+94mXzv8VQlUuXNZlWBQ0Iu+rJnn
	ajw8t9b65dnw==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:24 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:17 +0900
Message-Id: <20200715095217.441885-9-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 8/8] dm init: Set file local variable static
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Declare dm_allowed_targets as static to avoid the warning:

drivers/md/dm-init.c:39:12: warning: symbol 'dm_allowed_targets' was
not declared. Should it be static?

when compiling with C=1.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index b869316d3722..b0c45c6ebe0b 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -36,7 +36,7 @@ struct dm_device {
 	struct list_head list;
 };
 
-const char * const dm_allowed_targets[] __initconst = {
+static const char * const dm_allowed_targets[] __initconst = {
 	"crypt",
 	"delay",
 	"linear",
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

