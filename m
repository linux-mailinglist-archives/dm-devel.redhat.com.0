Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7441DC8
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 09:31:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C2803004426;
	Wed, 12 Jun 2019 07:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE7916A48E;
	Wed, 12 Jun 2019 07:31:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 124EA1806B16;
	Wed, 12 Jun 2019 07:31:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C6FwHA032697 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 02:15:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F0D621001DCF; Wed, 12 Jun 2019 06:15:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBF191001DCD
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 06:15:56 +0000 (UTC)
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26E5F307D90D
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 06:15:52 +0000 (UTC)
X-QQ-mid: bizesmtp11t1560320126trbdc6p3
Received: from lzy-H3050.localdomain (unknown [218.76.23.26])
	by esmtp6.qq.com (ESMTP) with 
	id ; Wed, 12 Jun 2019 14:15:24 +0800 (CST)
X-QQ-SSF: 01400000000000H0ZG31000A0000000
X-QQ-FEAT: l6IKqkG+NbkhBreuXUE9fBoljx7FiON/6+hPludDBJ5WHTyxJWZnimEV3Ayj4
	KNKyJUrOUNV0T/LMINZA8aVyou/UIzTWzvacjM1Ohr1reiHYRxExiDjDBY4e3z7g73Tmom2
	VGNu6ul/tjsCRITC0iVb+XRcGcb3e6QB3CjdO0NV7yH5rlpwLLsnkQHko58r2nJzSnb2EkK
	G3YbaH6UgAChIj2+81O9hUJRtRALmSSPZWe5DVS+ZBFseSrIcmc9Cdmt3tKzv798Y9Jin8G
	pvzCu9Utm+l4n89Eo+8pvmhDBl2WnUxWZSTZyHK9mcwQ1qXC3ylF3AsHm12j8j9EST3J6Xh
	sM4jRfs
X-QQ-GoodBg: 2
From: Zhengyuan Liu <liuzhengyuan@kylinos.cn>
To: agk@redhat.com, snitzer@redhat.com
Date: Wed, 12 Jun 2019 14:14:46 +0800
Message-Id: <1560320086-14243-2-git-send-email-liuzhengyuan@kylinos.cn>
In-Reply-To: <1560320086-14243-1-git-send-email-liuzhengyuan@kylinos.cn>
References: <1560320086-14243-1-git-send-email-liuzhengyuan@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.cn:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Wed, 12 Jun 2019 06:15:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Wed, 12 Jun 2019 06:15:53 +0000 (UTC) for IP:'54.206.16.166'
	DOMAIN:'smtpbgau1.qq.com' HELO:'smtpbgau1.qq.com'
	FROM:'liuzhengyuan@kylinos.cn' RCPT:''
X-RedHat-Spam-Score: -0.012  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 54.206.16.166 smtpbgau1.qq.com 54.206.16.166
	smtpbgau1.qq.com <liuzhengyuan@kylinos.cn>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Jun 2019 03:28:18 -0400
Cc: dm-devel@redhat.com, Zhengyuan Liu <liuzhengyuan@kylinos.cn>
Subject: [dm-devel] [PATCH] dm-log: use struct_size() to calculate the size
	of struct
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 12 Jun 2019 07:31:03 +0000 (UTC)

As Gustavo said in other patches doing the same replace, we can now
use the new struct_size() helper to avoid leaving these open-coded and
prone to type mistake.

Signed-off-by: Zhengyuan Liu <liuzhengyuan@kylinos.cn>
---
 drivers/md/dm-log-writes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-log-writes.c b/drivers/md/dm-log-writes.c
index 9ea2b02..cda6363 100644
--- a/drivers/md/dm-log-writes.c
+++ b/drivers/md/dm-log-writes.c
@@ -680,7 +680,7 @@ static int log_writes_map(struct dm_target *ti, struct bio *bio)
 	if (discard_bio)
 		alloc_size = sizeof(struct pending_block);
 	else
-		alloc_size = sizeof(struct pending_block) + sizeof(struct bio_vec) * bio_segments(bio);
+		alloc_size = struct_size(block, vecs, bio_segments(bio));
 
 	block = kzalloc(alloc_size, GFP_NOIO);
 	if (!block) {
-- 
2.7.4


.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
