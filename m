Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2F00520F8D3
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 17:50:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-xgg-FrDFOR6OFOSeVpVSmQ-1; Tue, 30 Jun 2020 11:50:01 -0400
X-MC-Unique: xgg-FrDFOR6OFOSeVpVSmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 776A6EC1AB;
	Tue, 30 Jun 2020 15:49:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A06FC1A835;
	Tue, 30 Jun 2020 15:49:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B66206C9C4;
	Tue, 30 Jun 2020 15:49:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05UFnev3008728 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 11:49:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A90010A4F95; Tue, 30 Jun 2020 15:49:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34D4E10A4F89
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 15:49:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6FB58EF3A0
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 15:49:36 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-477-YJFVE8SvPymhUbF0O0RU5A-1;
	Tue, 30 Jun 2020 11:49:28 -0400
X-MC-Unique: YJFVE8SvPymhUbF0O0RU5A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A55FEAD63;
	Tue, 30 Jun 2020 15:49:26 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Mikulas Patocka <mpatocka@redhat.com>
Date: Tue, 30 Jun 2020 17:49:24 +0200
Message-Id: <20200630154924.3283-1-msuchanek@suse.de>
In-Reply-To: <alpine.LRH.2.02.2006301101210.24028@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2006301101210.24028@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05UFnev3008728
X-loop: dm-devel@redhat.com
Cc: Cornelia Huck <cohuck@redhat.com>, Jan Kara <jack@suse.cz>,
	Jakub Staron <jstaron@google.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
	Yuval Shaia <yuval.shaia@oracle.com>, dm-devel@redhat.com,
	Dan Williams <dan.j.williams@intel.com>,
	Michal Suchanek <msuchanek@suse.de>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH v3] dm writecache: reject asynchronous pmem.
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The writecache driver does not handle asynchronous pmem. Reject it when
supplied as cache.

Link: https://lore.kernel.org/linux-nvdimm/87lfk5hahc.fsf@linux.ibm.com/
Fixes: 6e84200c0a29 ("virtio-pmem: Add virtio pmem driver")

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 drivers/md/dm-writecache.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 30505d70f423..5358894bb9fd 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -2266,6 +2266,12 @@ static int writecache_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	}
 
 	if (WC_MODE_PMEM(wc)) {
+		if (!dax_synchronous(wc->ssd_dev->dax_dev)) {
+			r = -EOPNOTSUPP;
+			ti->error = "Asynchronous persistent memory not supported as pmem cache";
+			goto bad;
+		}
+
 		r = persistent_memory_claim(wc);
 		if (r) {
 			ti->error = "Unable to map persistent memory for cache";
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

