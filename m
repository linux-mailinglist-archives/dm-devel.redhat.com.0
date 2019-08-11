Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3044D898B0
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 10:30:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24A1D8E592;
	Mon, 12 Aug 2019 08:30:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF93826195;
	Mon, 12 Aug 2019 08:30:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14FD118005B9;
	Mon, 12 Aug 2019 08:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7BGD5hg019139 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 11 Aug 2019 12:13:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C267118223; Sun, 11 Aug 2019 16:13:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1D9D5C3F8;
	Sun, 11 Aug 2019 16:13:00 +0000 (UTC)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
	[136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ADF6307C947;
	Sun, 11 Aug 2019 16:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1565539978; cv=none; d=zoho.com; s=zohoarc; 
	b=k6oBNE9NWzTI+nYMITWgTOBj46cwZ0VzrYK6y7rPlKx0TLECCqui+KbkELfTPzfd+2axLJ1EI/R/RnIEN+BEgvgTUY6K6Dc4Vlfyoyi0ZlsTAXzSsRTEnqJMGofj+J0nrEYk/Br52yXOqQ9VJWbapuFuQWDZlLEFfxru9MmfSxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1565539978;
	h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results;
	bh=1aDYVhR5ua7R6QtqqYBIeriKVtf05O2LG5PFry5xJvo=; 
	b=IUT6eQ65lLKAP1tUpWXclKQM8OnRdjqL6AtGupA4BZcoZdT4/JZkZBkGDS7KASnr4fWTSsmrsgpCyJMP2mTKV+/R5qZfqSomn94dypA8TowoxZfaYQPrEMwaaoQOR34lZBlq9k86orcdJue9zw+nN4IgppY7mG211cvlgVjnbIE=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=yehs2007@zoho.com;
	dmarc=pass header.from=<yehs2007@zoho.com>
	header.from=<yehs2007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id:in-reply-to:references; 
	b=alkQzwM8edBCu3qQZh1bHv4vZmFN9MkF2/YKq95OMrmmcSawkJdnaDw/Rlv0k8ZtlADdrdQ7JcpY
	3xrRsZ7lg/g1DepNHfZdL8GhScSGvATFnt506pRpqc9rdmk5dQ+U  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1565539978; 
	s=zm2019; d=zoho.com; i=yehs2007@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	l=1001; bh=1aDYVhR5ua7R6QtqqYBIeriKVtf05O2LG5PFry5xJvo=;
	b=dY5bJLMwuEbg/pqA9SR9XF3DaFzkEc5HJq7nofCTPfZsKzVtkF40ydtk+TwhpFgJ
	tvux+W5IaUAn56WNIOK4fk0ZSPBMYlAixP3fga0eP7jKtB38FyPw9MzBtTI/m4mlc6r
	fODh70X1GvtAPheOnPCoGRfyRH33G18NAZpcKplU=
Received: from YEHS1XR3054QMS.lenovo.com (114.245.9.228 [114.245.9.228]) by
	mx.zohomail.com with SMTPS id 156553997678386.42888057393054;
	Sun, 11 Aug 2019 09:12:56 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Mon, 12 Aug 2019 00:12:33 +0800
Message-Id: <20190811161233.7616-2-yehs2007@zoho.com>
In-Reply-To: <20190811161233.7616-1-yehs2007@zoho.com>
References: <20190811161233.7616-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Sun, 11 Aug 2019 16:13:00 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Sun, 11 Aug 2019 16:13:00 +0000 (UTC) for IP:'136.143.188.95'
	DOMAIN:'sender4-pp-o95.zoho.com' HELO:'sender4-pp-o95.zoho.com'
	FROM:'yehs2007@zoho.com' RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 136.143.188.95 sender4-pp-o95.zoho.com 136.143.188.95
	sender4-pp-o95.zoho.com <yehs2007@zoho.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Aug 2019 04:30:26 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] dm writecache: add unlikely for getting two block with
	same LBA
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 12 Aug 2019 08:30:44 +0000 (UTC)

From: Huaisheng Ye <yehs1@lenovo.com>

In function writecache_writeback, entries g and f has same original
sector only happens at entry f has been committed, but entry g has
NOT yet.

The probability of this happening is very low in the following
 256 blocks at most of entry e, so add unlikely for the result.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
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
