Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 430FD41DD2
	for <lists+dm-devel@lfdr.de>; Wed, 12 Jun 2019 09:32:57 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 652FA30C2A7A;
	Wed, 12 Jun 2019 07:32:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CC856A48A;
	Wed, 12 Jun 2019 07:32:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE800206D2;
	Wed, 12 Jun 2019 07:32:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5C6FmTP032686 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Jun 2019 02:15:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAC565D9CA; Wed, 12 Jun 2019 06:15:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6BCC5D9C9
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 06:15:46 +0000 (UTC)
Received: from smtpbg202.qq.com (smtpbg202.qq.com [184.105.206.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A77B83082133
	for <dm-devel@redhat.com>; Wed, 12 Jun 2019 06:15:36 +0000 (UTC)
X-QQ-mid: bizesmtp11t1560320123tzbqineq
Received: from lzy-H3050.localdomain (unknown [218.76.23.26])
	by esmtp6.qq.com (ESMTP) with 
	id ; Wed, 12 Jun 2019 14:15:18 +0800 (CST)
X-QQ-SSF: 01400000000000H0ZG31000A0000000
X-QQ-FEAT: O9RHVi+JMbJ8r4n0i20oSc9Yu2iajQ+aeB1VuoHNwHaY2Nace0QoMxwag1v1t
	uPvziTdwh+Yb2QnxCcpy/rguj7AetBr1H8//VUUubnyVp7oNI71JlBCiApjNVWtD7dGcD63
	7pscCQdkqDZENpm43gc563P0jasiBsgMcaGIu5qsBPLg8eU7wBfWX4f6n3U2mVvPcAAxnfg
	N9r1ddUHI1FBkm2Cu0f/UWfTbgu6ByL+z+2bty/wWNp5KjlSNGAYBymZ825QdcMeQ5GECTG
	inl8RDZCDe+f2WN6nGcDWvCajdrzgHRbofUx0BErEXkmxt/s/qlEgUIh69R8xNQBNVgBmJZ
	dgs70QM
X-QQ-GoodBg: 2
From: Zhengyuan Liu <liuzhengyuan@kylinos.cn>
To: agk@redhat.com, snitzer@redhat.com
Date: Wed, 12 Jun 2019 14:14:45 +0800
Message-Id: <1560320086-14243-1-git-send-email-liuzhengyuan@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.cn:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Wed, 12 Jun 2019 06:15:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 12 Jun 2019 06:15:37 +0000 (UTC) for IP:'184.105.206.29'
	DOMAIN:'smtpbg202.qq.com' HELO:'smtpbg202.qq.com'
	FROM:'liuzhengyuan@kylinos.cn' RCPT:''
X-RedHat-Spam-Score: -0.011  (RCVD_IN_DNSWL_NONE,
	SPF_PASS) 184.105.206.29 smtpbg202.qq.com 184.105.206.29
	smtpbg202.qq.com <liuzhengyuan@kylinos.cn>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 12 Jun 2019 03:28:18 -0400
Cc: dm-devel@redhat.com, Zhengyuan Liu <liuzhengyuan@kylinos.cn>
Subject: [dm-devel] [PATCH] dm-crypt: use struct_size() in kzalloc()
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 12 Jun 2019 07:32:56 +0000 (UTC)

As Gustavo said in other patches doing the same replace, we can now
use the new struct_size() helper to avoid leaving these open-coded and
prone to type mistake.

Signed-off-by: Zhengyuan Liu <liuzhengyuan@kylinos.cn>
---
 drivers/md/dm-crypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 1b16d34..2587e94 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2699,7 +2699,7 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		return -EINVAL;
 	}
 
-	cc = kzalloc(sizeof(*cc) + key_size * sizeof(u8), GFP_KERNEL);
+	cc = kzalloc(struct_size(cc, key, key_size), GFP_KERNEL);
 	if (!cc) {
 		ti->error = "Cannot allocate encryption context";
 		return -ENOMEM;
-- 
2.7.4



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
