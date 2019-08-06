Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2A82879
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 02:19:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC3287FDF6;
	Tue,  6 Aug 2019 00:19:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A1135DD64;
	Tue,  6 Aug 2019 00:19:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 236E32551B;
	Tue,  6 Aug 2019 00:18:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x760IVJd004063 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 20:18:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E66B60FA1; Tue,  6 Aug 2019 00:18:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29E1E60CD3
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 00:18:28 +0000 (UTC)
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
	[192.185.146.70])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 027903082133
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 00:18:28 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
	by gateway33.websitewelcome.com (Postfix) with ESMTP id A48227F012
	for <dm-devel@redhat.com>; Mon,  5 Aug 2019 19:18:27 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id unBLhHXXU3Qi0unBLh0y3D; Mon, 05 Aug 2019 19:18:27 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default;
	h=Content-Type:MIME-Version:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qYZMHbpehI1ztCaWNIng3GM0OrNZZVH0chvksCa52IE=;
	b=aXF8VKy/PnWoChp8posGTJQYQO
	QES4o3BfmhJkZeITsi7saNsCzp3XaFt7J/0JKzp0CehFyDRMsa5UDCk+0wdB7aCxpKgQKUSd2ev0+
	Joq03xhyJIQugTEluvwErX8nYNE1zPFjdaoUN3/T6v9EbTD5WKX0LG55UWox6TR2HunSvHMtfn6d2
	PpLaTycJfUq88lzWf9nyp7FHTsuqTJqc+c+ZiSCmfAdy//lHv1+H2hDFBhl0lFFBlkgsXCbMwIqZr
	d1k29yRz4RzwSgqFgrFqBOtaEJ8z+Lh8Lv8l2ZnbYyrK4dwhzEQICvxXmpXvQ0IL290gVvQeIt9R4
	tVDqLOAA==;
Received: from [187.192.11.120] (port=41292 helo=embeddedor)
	by gator4166.hostgator.com with esmtpa (Exim 4.92)
	(envelope-from <gustavo@embeddedor.com>)
	id 1hunBK-001CRl-Hp; Mon, 05 Aug 2019 19:18:26 -0500
Date: Mon, 5 Aug 2019 19:18:25 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190806001825.GA6854@embeddedor>
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
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hunBK-001CRl-Hp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:41292
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 6
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Tue, 06 Aug 2019 00:18:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 06 Aug 2019 00:18:28 +0000 (UTC) for IP:'192.185.146.70'
	DOMAIN:'gateway33.websitewelcome.com'
	HELO:'gateway33.websitewelcome.com'
	FROM:'gustavo@embeddedor.com' RCPT:''
X-RedHat-Spam-Score: -0.102  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 192.185.146.70 gateway33.websitewelcome.com 192.185.146.70
	gateway33.websitewelcome.com <gustavo@embeddedor.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [dm-devel] [PATCH] dm raid1: Use struct_size() in kzalloc()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 06 Aug 2019 00:19:03 +0000 (UTC)

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct mirror_set {
	...
        struct mirror mirror[0];
};

size = sizeof(struct mirror_set) + count * sizeof(struct mirror);
instance = kzalloc(size, GFP_KERNEL)

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = kzalloc(struct_size(instance, mirror, count), GFP_KERNEL)

Notice that, in this case, variable len is not necessary, hence it
is removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/md/dm-raid1.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 5a51151f680d..f7226ab57fc8 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -878,12 +878,9 @@ static struct mirror_set *alloc_context(unsigned int nr_mirrors,
 					struct dm_target *ti,
 					struct dm_dirty_log *dl)
 {
-	size_t len;
 	struct mirror_set *ms = NULL;
 
-	len = sizeof(*ms) + (sizeof(ms->mirror[0]) * nr_mirrors);
-
-	ms = kzalloc(len, GFP_KERNEL);
+	ms = kzalloc(struct_size(ms, mirror, nr_mirrors), GFP_KERNEL);
 	if (!ms) {
 		ti->error = "Cannot allocate mirror context";
 		return NULL;
-- 
2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
