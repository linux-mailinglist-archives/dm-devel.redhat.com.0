Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D04EF090
	for <lists+dm-devel@lfdr.de>; Fri,  1 Apr 2022 16:37:09 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-QBW2lt-aM32ltKFlswyKVw-1; Fri, 01 Apr 2022 10:37:05 -0400
X-MC-Unique: QBW2lt-aM32ltKFlswyKVw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F505803D77;
	Fri,  1 Apr 2022 14:36:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD2AD5E3215;
	Fri,  1 Apr 2022 14:35:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E43F194034C;
	Fri,  1 Apr 2022 14:35:58 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 113D41947BBE
 for <dm-devel@listman.corp.redhat.com>; Fri,  1 Apr 2022 14:35:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C40425E3210; Fri,  1 Apr 2022 14:35:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD565E320F
 for <dm-devel@redhat.com>; Fri,  1 Apr 2022 14:35:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6C56299E74D
 for <dm-devel@redhat.com>; Fri,  1 Apr 2022 14:35:56 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-tchbPq9aO22QvpXZM5An2Q-1; Fri, 01 Apr 2022 10:35:52 -0400
X-MC-Unique: tchbPq9aO22QvpXZM5An2Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8E27B82511;
 Fri,  1 Apr 2022 14:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1DBC3410F;
 Fri,  1 Apr 2022 14:35:48 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  1 Apr 2022 10:32:08 -0400
Message-Id: <20220401143256.1950537-61-sashal@kernel.org>
In-Reply-To: <20220401143256.1950537-1-sashal@kernel.org>
References: <20220401143256.1950537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH AUTOSEL 5.16 061/109] dm: requeue IO if mapping
 table not yet available
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Mike Snitzer <snitzer@redhat.com>,
 Zhang Yi <yi.zhang@huawei.com>, snitzer@kernel.org, dm-devel@redhat.com,
 agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============6364828906902473533=="

--===============6364828906902473533==
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream; x-default=true

From: Mike Snitzer <snitzer@redhat.com>

[ Upstream commit fa247089de9936a46e290d4724cb5f0b845600f5 ]

Update both bio-based and request-based DM to requeue IO if the
mapping table not available.

This race of IO being submitted before the DM device ready is so
narrow, yet possible for initial table load given that the DM device's
request_queue is created prior, that it best to requeue IO to handle
this unlikely case.

Reported-by: Zhang Yi <yi.zhang@huawei.com>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/md/dm-rq.c |  7 ++++++-
 drivers/md/dm.c    | 11 +++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm-rq.c b/drivers/md/dm-rq.c
index 579ab6183d4d..dffeb47a9efb 100644
--- a/drivers/md/dm-rq.c
+++ b/drivers/md/dm-rq.c
@@ -499,8 +499,13 @@ static blk_status_t dm_mq_queue_rq(struct blk_mq_hw_ct=
x *hctx,
=20
 =09if (unlikely(!ti)) {
 =09=09int srcu_idx;
-=09=09struct dm_table *map =3D dm_get_live_table(md, &srcu_idx);
+=09=09struct dm_table *map;
=20
+=09=09map =3D dm_get_live_table(md, &srcu_idx);
+=09=09if (unlikely(!map)) {
+=09=09=09dm_put_live_table(md, srcu_idx);
+=09=09=09return BLK_STS_RESOURCE;
+=09=09}
 =09=09ti =3D dm_table_find_target(map, 0);
 =09=09dm_put_live_table(md, srcu_idx);
 =09}
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 356a0183e1ad..5522ea1f18c5 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1563,15 +1563,10 @@ static void dm_submit_bio(struct bio *bio)
 =09struct dm_table *map;
=20
 =09map =3D dm_get_live_table(md, &srcu_idx);
-=09if (unlikely(!map)) {
-=09=09DMERR_LIMIT("%s: mapping table unavailable, erroring io",
-=09=09=09    dm_device_name(md));
-=09=09bio_io_error(bio);
-=09=09goto out;
-=09}
=20
-=09/* If suspended, queue this IO for later */
-=09if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags))) {
+=09/* If suspended, or map not yet available, queue this IO for later */
+=09if (unlikely(test_bit(DMF_BLOCK_IO_FOR_SUSPEND, &md->flags)) ||
+=09    unlikely(!map)) {
 =09=09if (bio->bi_opf & REQ_NOWAIT)
 =09=09=09bio_wouldblock_error(bio);
 =09=09else if (bio->bi_opf & REQ_RAHEAD)
--=20
2.34.1


--===============6364828906902473533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

--===============6364828906902473533==--

