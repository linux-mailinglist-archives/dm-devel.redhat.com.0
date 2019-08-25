Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9A9CA33
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4918D8980E3;
	Mon, 26 Aug 2019 07:24:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2349C5C29A;
	Mon, 26 Aug 2019 07:24:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7DDB180BA9D;
	Mon, 26 Aug 2019 07:24:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7P7PGGM025019 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 25 Aug 2019 03:25:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E6509F5C; Sun, 25 Aug 2019 07:25:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E1660C80;
	Sun, 25 Aug 2019 07:25:11 +0000 (UTC)
Received: from sender-pp-o92.zoho.com (sender-pp-o92.zoho.com [135.84.80.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86E8010576E0;
	Sun, 25 Aug 2019 07:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1566717906; cv=none; d=zoho.com; s=zohoarc; 
	b=Yjj9Rt7PSlWq0HPfmzbLhvQKdcqom6NrNe9llRsWF7aVQMOXiV8AjiXUqO365DJ9eM5icwuJWFKadheAf2j1bbMRrISZ5aPec/WihxbFFM1SA4mheQvWpQNvDfmn5Py6jhON/AcmRR+EbqFSGXLOnuZsQGqE2FH//NHhiDwTPH4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1566717906;
	h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results;
	bh=Ll1ddxjlpuzcBFEPUI7g0gZvBDFbmDed0ou/3799LFI=; 
	b=hV8XNvO8xGgJRInjwl3m2YHfosYI13JUkRBMtglehScoNS+VOAmXYwTDqdd5VonySa4+AaQMgUn2w7Aen9/IkxVysyGe9FlPM+ceTNhX23fbUHrLAKPF9ixlr6CJS/TFRWvweZmsQuZkn61eeZzM59Ryw1QcYCMwbkxmRdbyztQ=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=yehs2007@zoho.com;
	dmarc=pass header.from=<yehs2007@zoho.com>
	header.from=<yehs2007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id:in-reply-to:references; 
	b=h8bNdcwCOcnyX9C96B/SV8Gcd5TJBr05qUyw+Ya95aHltSrT1fEdPfZBFfOUDhsk0JNlQNoucCBy
	uQVk6ioHUUH5IrAkKeo+LAKHbthlCpewJJEAvjU3X6Pec2VdIkB1  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1566717906; 
	s=zm2019; d=zoho.com; i=yehs2007@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	l=1017; bh=Ll1ddxjlpuzcBFEPUI7g0gZvBDFbmDed0ou/3799LFI=;
	b=Vw/993Q/FtiTHaRCQNPB36qpst0AacARkWXRYwkz9T3O0WqHYSAzmlfJqcIZWhz4
	SwNI6wUdgoDjY4VwlCg0A2BmT166xBAlA32FGQnasKVw/LH9xNoyLcuG7KDEhkGzYtL
	UTrv4SIHrXYIWpaCtVHbsFjjcVJkbQKFlQIsnVVU=
Received: from YEHS1XR3054QMS.lenovo.com (123.120.58.107 [123.120.58.107]) by
	mx.zohomail.com with SMTPS id 1566717905963339.9025705087869;
	Sun, 25 Aug 2019 00:25:05 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Sun, 25 Aug 2019 15:24:32 +0800
Message-Id: <20190825072433.2628-3-yehs2007@zoho.com>
In-Reply-To: <20190825072433.2628-1-yehs2007@zoho.com>
References: <20190825072433.2628-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.64]); Sun, 25 Aug 2019 07:25:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Sun, 25 Aug 2019 07:25:11 +0000 (UTC) for IP:'135.84.80.237'
	DOMAIN:'sender-pp-o92.zoho.com' HELO:'sender-pp-o92.zoho.com'
	FROM:'yehs2007@zoho.com' RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 135.84.80.237 sender-pp-o92.zoho.com 135.84.80.237
	sender-pp-o92.zoho.com <yehs2007@zoho.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Aug 2019 03:24:39 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH 2/3] dm writecache: add unlikely for getting two
	block with same LBA
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Mon, 26 Aug 2019 07:24:56 +0000 (UTC)

From: Huaisheng Ye <yehs1@lenovo.com>

In function writecache_writeback, entries g and f has same original
sector only happens at entry f has been committed, but entry g has
NOT yet.

The probability of this happening is very low in the following
256 blocks at most of entry e.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
Acked-by: Mikulas Patocka <mpatocka@redhat.com>
---
 drivers/md/dm-writecache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 5c7009d..3643084 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -1628,8 +1628,8 @@ static void writecache_writeback(struct work_struct *work)
 			if (unlikely(!next_node))
 				break;
 			g = container_of(next_node, struct wc_entry, rb_node);
-			if (read_original_sector(wc, g) ==
-			    read_original_sector(wc, f)) {
+			if (unlikely(read_original_sector(wc, g) ==
+			    read_original_sector(wc, f))) {
 				f = g;
 				continue;
 			}
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
