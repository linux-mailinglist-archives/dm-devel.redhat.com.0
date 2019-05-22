Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB6E26302
	for <lists+dm-devel@lfdr.de>; Wed, 22 May 2019 13:32:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC1D381E06;
	Wed, 22 May 2019 11:31:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CEAC2854E;
	Wed, 22 May 2019 11:31:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55F2A54D3C;
	Wed, 22 May 2019 11:30:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MBUBj9009379 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 07:30:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB9092E049; Wed, 22 May 2019 11:30:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3F492E052;
	Wed, 22 May 2019 11:30:05 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F7853001802;
	Wed, 22 May 2019 11:29:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w8so1879070wrl.6;
	Wed, 22 May 2019 04:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vl2Le/QrtLw/kxemCECdyLlLKOV3m8DxaVNt26UKJMI=;
	b=a0n7y55ksfRV7jdSN64RoqOURywLDdygDh6bJGS/K5q6Cq88NXwfEwIej0f+tD14ko
	xqgyDDY1OK4l8Z1mMBoPyL5/tPZH5WptZm/3ccaPXFeaz0chJdixDpLlm/i+R3Mc3UD5
	6YMheeKy9oS5xK2cEnJ2svHRgCV4Zi2KoGyaIq10MqECt1g/1Xr4TBmtUWcntPIfwUtM
	ISxiijeXuYdQaiCHbwunZSIOWvWAPGh8z90uQOCUx/2N+M43YeMhDXZqd5ingAjRtrLU
	q7R1fPpi11+GeXQ/3sNXogaSaves8ul1TJur7mW+iF9qT+QsBW14LfpKv13O1OwIbzit
	Hk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vl2Le/QrtLw/kxemCECdyLlLKOV3m8DxaVNt26UKJMI=;
	b=jh7d90Gt8lcPNr28BfFuZl5LZnLvQMsqsttQh/Z/p0/7+i581quwbQgSQF3KH7AOLf
	gWPAKPVE0SxfsrvqRcMNoxQQlM/7qw8v0vFeWollY6+XRx6xhybG9LkTpXQfJeDCQJhK
	bJbKSFNglooV5nMEVI7N1wmFnSau6USqOaEusS8QlEvpAm9n8ntXqxAQoZALMgMk/Ipe
	KsuLi4trLJIprBcpDo6BYynQ7BGm4Ondh5ZoBx1Eq7E6WfArTcmpy/T7RuO2Y8LL/KV1
	erYgaylj0/0vQHaycv1jw3wtGMrkum6OQD6YcnfOs3X0KPv2+ebGWk6LuzuY/ACyMRok
	eVhw==
X-Gm-Message-State: APjAAAUo8D/S1XLPkU7UFLCs6rdaX/Jr/jD7vrEZiTukCloOeNc4/pxo
	CdNUk8FsV1CQOiFzyXtBNWLEcaDz1f8=
X-Google-Smtp-Source: APXvYqyd6XQS+dIUVRCmzqbgChRWuFhTr6TLfgWpBJ+MMjURHQRl67FCYN/6T9yAJ3Zp23z1dTOPLA==
X-Received: by 2002:adf:ce8e:: with SMTP id r14mr41584485wrn.289.1558524596062;
	Wed, 22 May 2019 04:29:56 -0700 (PDT)
Received: from merlot.mazyland.net (nat-pool-brq-t.redhat.com. [213.175.37.10])
	by smtp.googlemail.com with ESMTPSA id
	h188sm11018157wmf.48.2019.05.22.04.29.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 04:29:55 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Wed, 22 May 2019 13:29:44 +0200
Message-Id: <20190522112944.26787-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 22 May 2019 11:29:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 22 May 2019 11:29:57 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.422  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: mpatocka@redhat.com, Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH] dm-integrity: Always set version on superblock
	update
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 22 May 2019 11:32:50 +0000 (UTC)

New integtiry bitmap mode uses the dirty flag.
This flag should not be set in older superblock versions.

The current code set it unconditionally, if the superblock
was already formatted without bitmap in older system.

This patch moves version check to one common place and does
check version on every superblock write.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 drivers/md/dm-integrity.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 44e76cda087a..a2ab6a32b174 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -476,6 +476,9 @@ static int sync_rw_sb(struct dm_integrity_c *ic, int op, int op_flags)
 	io_loc.sector = ic->start;
 	io_loc.count = SB_SECTORS;
 
+	if (op == REQ_OP_WRITE)
+		sb_set_version(ic);
+
 	return dm_io(&io_req, 1, &io_loc, NULL);
 }
 
@@ -2317,7 +2320,6 @@ static void recalc_write_super(struct dm_integrity_c *ic)
 	if (dm_integrity_failed(ic))
 		return;
 
-	sb_set_version(ic);
 	r = sync_rw_sb(ic, REQ_OP_WRITE, 0);
 	if (unlikely(r))
 		dm_integrity_io_error(ic, "writing superblock", r);
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
