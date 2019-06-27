Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B258D13
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 23:31:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9EAEC057F3B;
	Thu, 27 Jun 2019 21:31:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA158608C1;
	Thu, 27 Jun 2019 21:31:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6E791806B19;
	Thu, 27 Jun 2019 21:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RHcfL3020141 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 13:38:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D67B16013C; Thu, 27 Jun 2019 17:38:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ED0460126;
	Thu, 27 Jun 2019 17:38:37 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0B40308792C;
	Thu, 27 Jun 2019 17:38:21 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id c13so1343924pgg.3;
	Thu, 27 Jun 2019 10:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3w6fpt9SMN3c36dCdkRgHrjfqJfJ1NBvhxfXSqy7Z50=;
	b=ayNTRWaEXxzJHMLpcTQt8Pg/0YkjdOV0OoyD5m9RGml3Zvp9zQt9e5oiDwYS5CvUNM
	8VMqW6jVvo3rrsRQP4A+Dyzq974KRXgQSX+R4NmoTukpkjTcLY2i7Djq2uNKkg7QSwME
	l2SdNb4i9a/KNL2c4gMtzFQ/NIARAUSMQ4SAsFk/b2lBG2Sz3tkfoh/P7WobOfZ9dm8J
	fswAmafaH/bQib3yEV7Afppbk2VXHx1KR7M7y8WHoPAXP3NcjT3xolKleqL2UozB4FrY
	ivRynImi10MUEJuyrZ4Fc89+YcIhTMJeUg8G2tv2JhJeD2xn8RedMrwJyiUGTyNBGo5r
	T3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3w6fpt9SMN3c36dCdkRgHrjfqJfJ1NBvhxfXSqy7Z50=;
	b=NasjltUj/l3wRGBas+WD9vfr6VRgYgLtDmhV3nXIcny/TjqAWYcuevP5nXi0zDnEDp
	4s9NQleO3k59N9k3DMLVVERsSQcBSjzLMUXSnhhBKrRf6WbdeJkm4UTvdhyxqtReWOuk
	BwEorYF9NqHrpJzEh1Xiuq9q8gG/D64odYsTpgQmCjCpeGbJAoPMIBoAei6Xf0TZabBZ
	xlioZed1QqpYsm9pv4xFFtZvga1+3FaAs4ahzdzititEJ4d1VpWrtUFQks0ZrShhekVH
	YVJiHY8Hl5C2qMV+NANm8kkmA9gwRVEYiKp+AQTaDtJPTav7CDGI3Z8+PbxkGnZS6Goo
	tzlg==
X-Gm-Message-State: APjAAAXLZ6ML3Hg4ipDj2nxVTjWt3O/g5SxY86TiBTm7R+kxltX6P+2+
	MQPeApks83PbUaLCBmqyoyg=
X-Google-Smtp-Source: APXvYqw0WFyPD5V3vbs0Ry11+99txLKtHkHLhH2U/ftYK0dQkvTouuL06MGOmDqS2ghvB7LAi65s3w==
X-Received: by 2002:a63:2323:: with SMTP id j35mr4859345pgj.166.1561657101161; 
	Thu, 27 Jun 2019 10:38:21 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
	by smtp.googlemail.com with ESMTPSA id
	u3sm3865861pjn.5.2019.06.27.10.38.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 10:38:20 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Fri, 28 Jun 2019 01:38:14 +0800
Message-Id: <20190627173814.3361-1-huangfq.daxian@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 27 Jun 2019 17:38:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Thu, 27 Jun 2019 17:38:21 +0000 (UTC) for IP:'209.85.215.195'
	DOMAIN:'mail-pg1-f195.google.com'
	HELO:'mail-pg1-f195.google.com' FROM:'huangfq.daxian@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 1.39 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_SORBS_WEB,
	SPF_PASS) 209.85.215.195 mail-pg1-f195.google.com 209.85.215.195
	mail-pg1-f195.google.com <huangfq.daxian@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 27 Jun 2019 17:29:46 -0400
Cc: Fuqian Huang <huangfq.daxian@gmail.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH 29/87] md: dm-integrity: replace kmalloc and
	memset with kzalloc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 27 Jun 2019 21:31:41 +0000 (UTC)

kmalloc + memset(0) -> kzalloc

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/md/dm-integrity.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 44e76cda087a..f5db89b28757 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -3358,7 +3358,7 @@ static int create_journal(struct dm_integrity_c *ic, char **error)
 				goto bad;
 			}
 
-			crypt_iv = kmalloc(ivsize, GFP_KERNEL);
+			crypt_iv = kzalloc(ivsize, GFP_KERNEL);
 			if (!crypt_iv) {
 				*error = "Could not allocate iv";
 				r = -ENOMEM;
@@ -3387,7 +3387,6 @@ static int create_journal(struct dm_integrity_c *ic, char **error)
 				sg_set_buf(&sg[i], va, PAGE_SIZE);
 			}
 			sg_set_buf(&sg[i], &ic->commit_ids, sizeof ic->commit_ids);
-			memset(crypt_iv, 0x00, ivsize);
 
 			skcipher_request_set_crypt(req, sg, sg,
 						   PAGE_SIZE * ic->journal_pages + sizeof ic->commit_ids, crypt_iv);
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
