Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B609C914B
	for <lists+dm-devel@lfdr.de>; Wed,  2 Oct 2019 21:04:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 732C912A2;
	Wed,  2 Oct 2019 19:04:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 366F15D9DC;
	Wed,  2 Oct 2019 19:04:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 861E41803B37;
	Wed,  2 Oct 2019 19:04:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x92J4LqP015993 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 15:04:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B0A0601B3; Wed,  2 Oct 2019 19:04:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 858CE6013A
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 19:04:18 +0000 (UTC)
Received: from gateway24.websitewelcome.com (gateway24.websitewelcome.com
	[192.185.51.122])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D59DE85543
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 19:04:15 +0000 (UTC)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway24.websitewelcome.com (Postfix) with ESMTP id C76525A064
	for <dm-devel@redhat.com>; Wed,  2 Oct 2019 14:04:14 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id Fjv4iiVeyVUVYFjv4iVQsN; Wed, 02 Oct 2019 14:04:14 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default;
	h=Content-Type:MIME-Version:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lGuFHxBRnjeWcjmv8+OVj8h6DT2+GVr2Gf8sL4rtDWM=;
	b=iCsBeVOYQ8y5i0JxkH7to0mWYD
	nHxhmItBEKPjOco0tAuRVIq+WBxiu994Y2EkTRb704t1zGngb5RkHIe6VV8ImtoUtUJEBmU0Kk1nv
	UL35BlIIoraV6yiT5wmIuoYClrOIKQ0drO01Qw7V2lA8noPMfgeMfjbllZiffnrr5tzZCs9I7imOd
	KPdWXoupPZalrpljy6xtAK8Y9VFmEP8Ie2/OGmVaLmSsCb/ARPklUkjJSikxUt/+TQn/fclSf0G9n
	CjRooX9KKaOo/+3WfV7wo1dG0AfS2sWiuuBJNflXy0Zyy3TQ7g/wBzccnCxpN6fKv43zwgQxCpgC8
	CVS4/Osw==;
Received: from 187-162-252-62.static.axtel.net ([187.162.252.62]:39692
	helo=embeddedor) by gator4166.hostgator.com with esmtpa (Exim 4.92)
	(envelope-from <gustavo@embeddedor.com>)
	id 1iFjv3-0047wu-MW; Wed, 02 Oct 2019 14:04:13 -0500
Date: Wed, 2 Oct 2019 14:03:41 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Message-ID: <20191002190341.GA8900@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.252.62
X-Source-L: No
X-Exim-ID: 1iFjv3-0047wu-MW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-252-62.static.axtel.net (embeddedor)
	[187.162.252.62]:39692
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 02 Oct 2019 19:04:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 02 Oct 2019 19:04:17 +0000 (UTC) for IP:'192.185.51.122'
	DOMAIN:'gateway24.websitewelcome.com'
	HELO:'gateway24.websitewelcome.com'
	FROM:'gustavo@embeddedor.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_HELO_PASS,
	SPF_PASS) 192.185.51.122 gateway24.websitewelcome.com 192.185.51.122
	gateway24.websitewelcome.com <gustavo@embeddedor.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [dm-devel] [PATCH] md: dm-stripe: Use struct_size() in kmalloc()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 02 Oct 2019 19:04:54 +0000 (UTC)

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct stripe_c {
        ...
        struct stripe stripe[0];
};

In this case alloc_context() and dm_array_too_big() are removed and
replaced by the direct use of the struct_size() helper in kmalloc().

Notice that open-coded form is prone to type mistakes.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/md/dm-stripe.c        | 15 +--------------
 include/linux/device-mapper.h |  3 ---
 2 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index 8547d7594338..63bbcc20f49a 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -55,19 +55,6 @@ static void trigger_event(struct work_struct *work)
 	dm_table_event(sc->ti->table);
 }
 
-static inline struct stripe_c *alloc_context(unsigned int stripes)
-{
-	size_t len;
-
-	if (dm_array_too_big(sizeof(struct stripe_c), sizeof(struct stripe),
-			     stripes))
-		return NULL;
-
-	len = sizeof(struct stripe_c) + (sizeof(struct stripe) * stripes);
-
-	return kmalloc(len, GFP_KERNEL);
-}
-
 /*
  * Parse a single <dev> <sector> pair
  */
@@ -142,7 +129,7 @@ static int stripe_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		return -EINVAL;
 	}
 
-	sc = alloc_context(stripes);
+	sc = kmalloc(struct_size(sc, stripe, stripes), GFP_KERNEL);
 	if (!sc) {
 		ti->error = "Memory allocation for striped context "
 		    "failed";
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 399ad8632356..2e13826898b2 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -594,9 +594,6 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
  */
 #define dm_round_up(n, sz) (dm_div_up((n), (sz)) * (sz))
 
-#define dm_array_too_big(fixed, obj, num) \
-	((num) > (UINT_MAX - (fixed)) / (obj))
-
 /*
  * Sector offset taken relative to the start of the target instead of
  * relative to the start of the device.
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
