Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E39A69CA30
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B18A83082E51;
	Mon, 26 Aug 2019 07:24:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87FA1196AE;
	Mon, 26 Aug 2019 07:24:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2C481180BA9D;
	Mon, 26 Aug 2019 07:24:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7P7PCsn025006 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 25 Aug 2019 03:25:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 19A2C5D6D0; Sun, 25 Aug 2019 07:25:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6D75D6A3;
	Sun, 25 Aug 2019 07:25:07 +0000 (UTC)
Received: from sender-pp-o92.zoho.com (sender-pp-o92.zoho.com [135.84.80.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 984A8811DE;
	Sun, 25 Aug 2019 07:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1566717904; cv=none; d=zoho.com; s=zohoarc; 
	b=ldzPbGLT+phX41skMR487QM7VL1Vh995xoJxj0oo8rNNgxozgHtVpnEVlo/JGZ8qgFr2sTffSITYrVEXiupqfy4GbCKfxZSKCv9sU0IIicOKKw5TmMnX2X0zNA8uj9zQRnwOgeiDY5OAJg4rTWLrHWFqb/bvRg4T5rP8UN/bHEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1566717904;
	h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results;
	bh=GBEJpVc45vEgTHzPnaWjFe1ezba09XmkZtfewSChPOA=; 
	b=CAxidBtB4ryAxSHLktB548ZFZSFKM3QkSD5o696o+ZCs9jA61gMzMNZpMmlkvtxX77PChqtbwmiW8K2wJifVn0RjFdd8xA4wcMIKvpY9urr5li5hGcM3+JaP/eDpdWbc7+4HzjpE1uB746OX2T5AACwMTBfGRCvGyX+wFTwHB9g=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=yehs2007@zoho.com;
	dmarc=pass header.from=<yehs2007@zoho.com>
	header.from=<yehs2007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id:in-reply-to:references; 
	b=ddh0MTBebnOgvtxBq84DNzIHZ7pY1U3xkVNoXqo0GirJoqYxPwZZR5oBOFjAOqYN9sWO3lCem6w5
	+g8EXs1mHeajKUjP6kymcQvOT7zPBrmCQrTcP1a2Uo/JdKzCOU06  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1566717904; 
	s=zm2019; d=zoho.com; i=yehs2007@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=714;
	bh=GBEJpVc45vEgTHzPnaWjFe1ezba09XmkZtfewSChPOA=;
	b=IWXUumZzwAkajLMcOI61NRT+FphXnrnMi69LG6SNO3qJYYDxIla2CaGZA7A9EsHK
	nXq9AcnW4BDylrs0QuCj/xH8A88TJStzcN+xWycLqNPKF32dCjTRToxCRGON212DQCa
	E+8QSTjOO7sRIwkrqwKbEfZfOX+Uc7M4ngBcT8hY=
Received: from YEHS1XR3054QMS.lenovo.com (123.120.58.107 [123.120.58.107]) by
	mx.zohomail.com with SMTPS id 1566717903096668.6389464058707;
	Sun, 25 Aug 2019 00:25:03 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Sun, 25 Aug 2019 15:24:31 +0800
Message-Id: <20190825072433.2628-2-yehs2007@zoho.com>
In-Reply-To: <20190825072433.2628-1-yehs2007@zoho.com>
References: <20190825072433.2628-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Sun, 25 Aug 2019 07:25:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Sun, 25 Aug 2019 07:25:07 +0000 (UTC) for IP:'135.84.80.237'
	DOMAIN:'sender-pp-o92.zoho.com' HELO:'sender-pp-o92.zoho.com'
	FROM:'yehs2007@zoho.com' RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 135.84.80.237 sender-pp-o92.zoho.com 135.84.80.237
	sender-pp-o92.zoho.com <yehs2007@zoho.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Aug 2019 03:24:39 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH 1/3] dm writecache: remove unused member pointer
	in writeback_struct
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 26 Aug 2019 07:24:54 +0000 (UTC)

From: Huaisheng Ye <yehs1@lenovo.com>

The stucture member pointer page in writeback_struct never has been
used actually. Remove it.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
Acked-by: Mikulas Patocka <mpatocka@redhat.com>
---
 drivers/md/dm-writecache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 1cb137f..5c7009d 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -190,7 +190,6 @@ struct writeback_struct {
 	struct dm_writecache *wc;
 	struct wc_entry **wc_list;
 	unsigned wc_list_n;
-	struct page *page;
 	struct wc_entry *wc_list_inline[WB_LIST_INLINE];
 	struct bio bio;
 };
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
