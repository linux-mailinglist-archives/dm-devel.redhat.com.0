Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6280CF3DC7
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:00:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178432;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=URDnXhf8JmSGI4oPGNieXMnjraW/H5SwUlLge1Sv9lA=;
	b=L8gf9QBnYcN60qlUcDdONN8KNy7dGXWmlu3lL6f16T/VxwtJA36nSEOa81dVTF1SzWBPIi
	K+wLyGG4i0Lc4lJ0zudeCw6Soqy8fbuYPhBUWiHEdeKkAMCNr9sJqLBwki7EoiMp9s83WC
	xvpEzJT1lFfK0tU65cMM7KoxHn9qgMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-N1tMI2cQPpmor7SF_pm-nQ-1; Thu, 07 Nov 2019 21:00:30 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3FF81005500;
	Fri,  8 Nov 2019 02:00:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A62F60BE1;
	Fri,  8 Nov 2019 02:00:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63FDC18095FF;
	Fri,  8 Nov 2019 02:00:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81wkug000737 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:58:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 764D65D6AE; Fri,  8 Nov 2019 01:58:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9D6D5D6A5;
	Fri,  8 Nov 2019 01:58:41 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 624BAC04959B;
	Fri,  8 Nov 2019 01:58:13 +0000 (UTC)
IronPort-SDR: BBdhgbYHCyFDo0GBpMH4LO2oYrL5qo08me45hpGnz+inzYnjjVEBeXUUaxc0TRqcCzo6LsW0Dd
	PrZtcxWVxCCbryudjxt82NS4D1E3lZ0LYz+97cC9yox6Zd8voV6pnK/mft2M7fJISIbgVD5XdQ
	4KLILF0ybCxg1pgkT5lJucy69Vwv5QEaoJLMtQhEKU0XgZjOYfU8KtpgWoWShf1LICBjJee1bY
	Mwz/DQZA98TtCMdkN4MM179YOlQJa5pUV+O5ttCNcwgCApnZyi7PsgZlgRwXuR4hMfvGgplUS8
	B8M=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636917"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:57 +0800
IronPort-SDR: tsZE8okdLOg/W4iktpCy6FiR/8TdChlnw5CYh4aF1v30zrxYcGyRjSuOJgsRVDgi82iRer+VCQ
	CwtchDtYyRfAKrLigawEcex7oTDWHkifqVkubGEpPYgGTugX+VszGwH6dW9Sl13WUNfm/Y8iKo
	BymY1WL3DjjZ7kcZjmq4lpVsHNg5pWZ3536vO+sWy2V7yuqX3kNoaFVDrmnbU37nb1GKOgB2s5
	ddg+to8mtH8aGZ8U7n3ig9ZYRoEfuH0X3FfbxQY6Oaupo4BqfdpL2m43KuaT065JO6PwmepQ6Y
	tDF9jeGjRKhMHRptUXlYepKl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:28 -0800
IronPort-SDR: dHLRd3tvtQ98q8DR8MwYs6kFl+6+MwCORXw5XY8UeHeZmmbwW8EmKaU/5UBlQ7GIWI2DFt5/h3
	pguu0LBgUW+IOJRG5oHEnqORPsQgS+3ttITalhT8LiVC71i3QBCZmPqzGx0gQ0zdTJT1IMPP7f
	dNvMATD9OHPjcUhT/m49BQjwPkpDKz1gKwrGkyL6bKrb08LFBK9YIDij069nNj95EI/A9jryfZ
	yTBySx8vV/N6UXprL8jNnLLQKZSRZIWWqWawaUj+itEJuxVNmwPXy4zdUaSOoJrr87VuDOSoWt
	K5s=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:17 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:57:01 +0900
Message-Id: <20191108015702.233102-9-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Fri, 08 Nov 2019 01:58:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 08 Nov 2019 01:58:29 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 8/9] scsi: sd_zbc: Cleanup
	sd_zbc_alloc_report_buffer()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: N1tMI2cQPpmor7SF_pm-nQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is no need to arbitrarily limit the size of a report zone to the
number of zones defined by SD_ZBC_REPORT_MAX_ZONES. Rather, simply
calculate the report buffer size needed for the requested number of
zones without exceeding the device total number of zones. This buffer
size limitation to the hardware maximum transfer size and page mapping
capabilities is kept unchanged. Starting with this initial buffer size,
the allocation is optimized by iterating over decreasing buffer size
until the allocation succeeds. This ensures forward progress for zone
reports and avoids failures of zones revalidation under memory pressure.

While at it, also replace the hard coded 512 B sector size with the
SECTOR_SIZE macro.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/scsi/sd_zbc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/scsi/sd_zbc.c b/drivers/scsi/sd_zbc.c
index 7c4690f26698..f191af15de1b 100644
--- a/drivers/scsi/sd_zbc.c
+++ b/drivers/scsi/sd_zbc.c
@@ -104,11 +104,6 @@ static int sd_zbc_do_report_zones(struct scsi_disk *sdkp, unsigned char *buf,
 	return 0;
 }
 
-/*
- * Maximum number of zones to get with one report zones command.
- */
-#define SD_ZBC_REPORT_MAX_ZONES		8192U
-
 /**
  * Allocate a buffer for report zones reply.
  * @sdkp: The target disk
@@ -138,17 +133,22 @@ static void *sd_zbc_alloc_report_buffer(struct scsi_disk *sdkp,
 	 * sure that the allocated buffer can always be mapped by limiting the
 	 * number of pages allocated to the HBA max segments limit.
 	 */
-	nr_zones = min(nr_zones, SD_ZBC_REPORT_MAX_ZONES);
-	bufsize = roundup((nr_zones + 1) * 64, 512);
+	nr_zones = min(nr_zones, sdkp->nr_zones);
+	bufsize = roundup((nr_zones + 1) * 64, SECTOR_SIZE);
 	bufsize = min_t(size_t, bufsize,
 			queue_max_hw_sectors(q) << SECTOR_SHIFT);
 	bufsize = min_t(size_t, bufsize, queue_max_segments(q) << PAGE_SHIFT);
 
-	buf = vzalloc(bufsize);
-	if (buf)
-		*buflen = bufsize;
+	while (bufsize >= SECTOR_SIZE) {
+		buf = vzalloc(bufsize);
+		if (buf) {
+			*buflen = bufsize;
+			return buf;
+		}
+		bufsize >>= 1;
+	}
 
-	return buf;
+	return NULL;
 }
 
 /**
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

