Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 332DD200300
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 09:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592553094;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yIMtAwdq+1wdpvU9aoQ89u7+mrqxhRE5tHQhBMXtaDg=;
	b=P/ZPgIti/oEPW4wy7GOhZx0IoZV64u8dxD7CRfHWG+qBnREiOGrV9yhfRuhBTBSS8bpIy+
	D1OsMfIM8QatrCYYb3HU1nlzD8hFz33NkSfyRhT5iqBtkHaqHiqcrOb6bpA4oQ8k061Ywi
	pI/hGTGtjejA/opw5+0Q0yH4d50g/38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-RrMnbvIXPnG9gREh5GrvXw-1; Fri, 19 Jun 2020 03:51:31 -0400
X-MC-Unique: RrMnbvIXPnG9gREh5GrvXw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 963E419067FA;
	Fri, 19 Jun 2020 07:51:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7369960BE1;
	Fri, 19 Jun 2020 07:51:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75999180954D;
	Fri, 19 Jun 2020 07:51:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J7pDQb022318 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:51:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48B8D2026D67; Fri, 19 Jun 2020 07:51:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43D4420267F2
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:51:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 637B8185A78B
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:51:07 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-4xFvoRzvNsK83hxrXcj6qw-1; Fri, 19 Jun 2020 03:51:02 -0400
X-MC-Unique: 4xFvoRzvNsK83hxrXcj6qw-1
IronPort-SDR: IaNElWaMUDpuOpTBrmjg6rJec6U7BejoEoSwzwjWJ5yajnKCpk7xtjmoVireAJ4jxEMpehQj1v
	Umhb5zhRxeaxiiQGjXUUp3ejOGUA17t/EasCzPyvwX36TYrx0tLqqGVfBQxkuTU+4Axmwt2DY5
	y+3/rT82BZkvp3UoXhz8c4N9ISMm7dI7p9QL9TVzRkyhn3XX6wyJR2Sd4Zceenf/fhDBldvFRE
	95JQzeCfJfDvGdb+WUxSQAZYAIMvbSawQNeVKZbObziUP2LuJ+tnN8PmoI0kJku1TjkfjU9R8P
	SZY=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="249594578"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 15:49:58 +0800
IronPort-SDR: 43Dv3UgxCVbGi56GCasVSLJSKQv+CU2gLV/p1NWU7LsPpOnCST5jFtpT+kXI8znArk1GjVcTi9
	pBqhlgGYvxNFucAua6wwnk/oSFBpJMG5c=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Jun 2020 00:38:36 -0700
IronPort-SDR: nykffY3jP5rI9kFTi2giZjqWfvW3ldJvvbCGZmSOptVAFQKayRQTej0sIb+c/d0vzDgXv+kSVA
	SJ/bSwyz3arA==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 00:49:57 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Fri, 19 Jun 2020 16:49:54 +0900
Message-Id: <20200619074956.352647-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [dm-devel] [PATCH 0/2] dm-zoned fixes
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A couple of fixes for dm-zoned which solve target hangs under severe
zone shortage conditions with a write intensive workload. Both fixes are
for reclaim zone selection.

Damien Le Moal (1):
  dm zoned: Fix random zone reclaim selection

Shin'ichiro Kawasaki (1):
  dm zoned: Fix reclaim zone selection

 drivers/md/dm-zoned-metadata.c | 39 +++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 10 deletions(-)

-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

