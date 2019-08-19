Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4407891EFE
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 10:34:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 693FFC05AA66;
	Mon, 19 Aug 2019 08:34:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41A801D8;
	Mon, 19 Aug 2019 08:34:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D621524F30;
	Mon, 19 Aug 2019 08:34:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7J0IkDd010907 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 18 Aug 2019 20:18:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C78D611C998; Mon, 19 Aug 2019 00:18:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 363A760C18;
	Mon, 19 Aug 2019 00:18:42 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92EAA106FA9E;
	Mon, 19 Aug 2019 00:18:40 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id u32so32091ybi.12;
	Sun, 18 Aug 2019 17:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7J6zazvwWXJHLLGTA9d2Z5bIVQ61P1OZdxnYyH/AmRU=;
	b=G3DjLeAO8crktILIMV+OQZXhbVJ4gds8QEDKUcqd7yzz+um13IIf6L6JgVXQMI5rEr
	NHIAU4jzHEcVetOb72pwnZS5VvXqtUGsFx5L74yu47gdaGIjhvP6DW4ngAE5GPm/8O5D
	6nK719L6jY/CgmjS18rEJ/UCbW/QvawqNY/MrI2CKlLP6Im5s+KC/AHZkMcAs0baqH8m
	GLyU3xjzLuq8Xop7lN2iQIqBtcIRqlLwGZORmL+QRtC6gdengmQ/+qIqWolEf4sRrZKu
	cVqXjMVRPuIjr2KNkX9ymV620q4swvwFCt5B6vQOakhMLtfwkumDak8JR70JbHP+m5i6
	ND4w==
X-Gm-Message-State: APjAAAWJ16RiMs/ftnGJ+4VrjZcDQDxXq7/wusjDk8Anhs28QqJG2KtB
	bgicEO2S+zzCBFoJlVeZXsb4v4Bis/QymQ==
X-Google-Smtp-Source: APXvYqzpMpeg5ZYDdaIdaLiIVqUk7tCMN8jbmPiKcFf6wLPPgWKLIyRxVTZGiw+HkMAlqepm9rWNgQ==
X-Received: by 2002:a5b:543:: with SMTP id r3mr9244165ybp.193.1566173919870;
	Sun, 18 Aug 2019 17:18:39 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
	[24.158.240.219])
	by smtp.gmail.com with ESMTPSA id w4sm2886984ywa.1.2019.08.18.17.18.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 18 Aug 2019 17:18:39 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Date: Sun, 18 Aug 2019 19:18:34 -0500
Message-Id: <1566173915-5837-1-git-send-email-wenwen@cs.uga.edu>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Mon, 19 Aug 2019 00:18:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Mon, 19 Aug 2019 00:18:40 +0000 (UTC) for IP:'209.85.219.196'
	DOMAIN:'mail-yb1-f196.google.com'
	HELO:'mail-yb1-f196.google.com' FROM:'wenwenict@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.5  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.219.196 mail-yb1-f196.google.com 209.85.219.196
	mail-yb1-f196.google.com <wenwenict@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 04:33:53 -0400
Cc: "maintainer:DEVICE-MAPPER  LVM,
	linux-kernel@vger.kernel.org open list" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] dm raid: add cleanup in raid_ctr()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 19 Aug 2019 08:34:18 +0000 (UTC)

If rs_prepare_reshape() fails, no cleanup is executed, leading to
memory/resource leaks. To fix this issue, go to the label 'bad' if the
error occurs.

Signed-off-by: Wenwen Wang <wenwen@cs.uga.edu>
---
 drivers/md/dm-raid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 8a60a4a..1f933dd 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -3194,7 +3194,7 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 			  */
 			r = rs_prepare_reshape(rs);
 			if (r)
-				return r;
+				goto bad;
 
 			/* Reshaping ain't recovery, so disable recovery */
 			rs_setup_recovery(rs, MaxSector);
-- 
2.7.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
